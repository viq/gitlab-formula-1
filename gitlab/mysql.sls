include:
  - mysql.client
  {% if  salt['pillar.get']('gitlab:db_host') == 'localhost' %}
  - mysql.server
  {% endif %}

gitlab-db:
  mysql_user.present:
    - connection_name: {{ salt['pillar.get']('gitlab:db_user') }}
    - connection_password: {{ salt['pillar.get']('gitlab:db_pass') }}
    - connection_charset: utf8
    - host: {{ salt['pillar.get']('gitlab:db_host') }}
    - require:
      - pkg: mysql
      - service: mysqld
  mysql_database.present:
    - name: {{ salt['pillar.get']('gitlab:db_name') }}
    - owner: {{ salt['pillar.get']('gitlab:db_user') }}
    - template: template2
    - require:
      - file: gitlab-service
      - pkg: mysql
      - service: mysqld
      - mysql_user: gitlab-db
