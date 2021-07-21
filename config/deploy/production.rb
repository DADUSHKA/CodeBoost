# server-based syntax
# ======================
server "82.146.40.13", user: "deployer", roles: %w{app db web}, primary: true
set :rail_env, :production

set :ssh_options, {
  keys: %w(/home/vicstor/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey password),
  port: 1705
}