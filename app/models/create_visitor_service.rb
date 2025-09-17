# frozen_string_literal: true

class CreateVisitorService
  def self.call(request)
    p request
    p request.ip
    p request.user_agent
    client = DeviceDetector.new(request.user_agent)
    p client.name
    p client.os_name
    p client.device_type
    results = Geocoder.search(request.ip)
    p results.first.city
    p results.first.region
    p results.first.country
  end
end
