# Portfolio App — Technology Showcase

This app is a modern Ruby on Rails 8 portfolio site focused on speed, simplicity, and a no‑Node frontend. Below is a concise overview of the tools and choices that shape it.

## Highlights

- Ruby `3.4.5` and Rails `8.0.2.1`
- Hotwire (Turbo + Stimulus) with `importmap` — no bundler/Node
- Tailwind CSS v4 via `tailwindcss-rails` and `tailwindcss-ruby`
- PostgreSQL, Puma, and Propshaft asset pipeline
- Containerized and deployed with Docker and Dokku

## Backend

- Framework: Rails `8.0.2.1` (Ruby `3.4.5`).
- Web server: `puma` with optional `thruster` acceleration.
- Database: PostgreSQL (`pg`).
- Asset pipeline: `propshaft` (modern Rails asset pipeline).

## Frontend

- Hotwire: `turbo-rails` for fast navigation, `stimulus-rails` for small JS behaviors.
- JavaScript delivery: `importmap-rails` (ESM from the browser; no bundler).
- Tailwind CSS v4: `tailwindcss-rails` + `tailwindcss-ruby` for Node‑free styling.
- Stimulus controllers: `app/javascript/controllers/*` for navigation and UI effects.
