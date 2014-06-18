include:
  - mysql.client
  {% if  salt['pillar.get']('gitlab:db_host') == 'localhost' %}
  - mysql.server
  {% endif %}

gitlab-db:
  mysql_user.present:
    - name: {{ salt['pillar.get']('gitlab:db_user') }}
    - password: {{ salt['pillar.get']('gitlab:db_pass') }}
    - charset: utf8
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
