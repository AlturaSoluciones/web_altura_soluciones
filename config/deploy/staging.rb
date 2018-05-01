server "ruby@test-site.alturasoluciones.com", roles: %w{app db web}

set :application, "as_site_test"

set :branch, `git rev-parse --abbrev-ref HEAD`.chomp

