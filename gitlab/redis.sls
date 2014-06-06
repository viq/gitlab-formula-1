{% if grains['os_family'] == 'Debian' %}
{% set redis_package = 'redis-server' %}
{% set redis_service = 'redis-server' %}
{% elif grains['os_family'] == 'RedHat' %}
{% set redis_package = 'redis-server' %}
{% set redis_service = 'redis-server' %}
{% endif %}
gitlab-redis:
  pkg:
    - installed
    - name: {{ redis_package }}
  service:
    - name: {{ redis_service }}
    - running
    - enable: True
    - watch:
      - pkg: redis
