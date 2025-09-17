# frozen_string_literal: true

class CreateVisitorService
  def self.call(request)
    ip_address = IpAddress.find_or_create_by(ip_address: request.ip)
    visitor = ip_address.visitors.create(user_agent: request.user_agent)

    results = Geocoder.search(request.ip)
    if ip_address.country_code.blank?
      ip_address.update(
        country_code: results.first.country,
        region: results.first.region,
        city: results.first.city
      )
    end

    client = DeviceDetector.new(request.user_agent)
    visitor.update(
      browser_type: client.name,
      os_name: client.os_name,
      device_type: client.device_type)
  end
end
