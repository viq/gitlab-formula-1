{% set db_engine = salt['pillar.get']('gitlab:db_engine', 'postgresql') %}

include:
  {% if grains['os_family'] == 'RedHat' %}
  - gitlab.repos
  {% endif %}
  - gitlab.packages
  - gitlab.redis
  {% if db_engine == "postgresql" %}
  - postgres
  - gitlab.postgresql
  {% elif db_engine == "mysql2" %}
  - mysql.server
  - mysql.client
  - gitlab.mysql
  {% endif %}
  - gitlab.user
  - gitlab.ruby
  - gitlab.gitlab-shell
  - gitlab.gitlab
  - gitlab.nginx
