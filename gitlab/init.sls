include:
  - postgres
  {% if grains['os_family'] == 'RedHat' %}
  - gitlab.repos
  {% endif %}
  - gitlab.packages
  - redis.server
  - gitlab.postgresql
  - gitlab.user
  - gitlab.ruby
  - gitlab.gitlab-shell
  - gitlab.gitlab
  - gitlab.nginx
