include:
  - git

{% set db_engine = salt['pillar.get']('gitlab:db_engine', 'postgresql')  %}

gitlab-deps:
  pkg.installed:
{% if grains['os_family'] == 'RedHat' %}
    - pkgs:
      - autoconf
      - automake
      - binutils
      - bison
      - byacc
      - ca-certificates
      - crontabs
      - cscope
      - ctags
      - cvs
      - db4-devel
      - diffstat
      - doxygen
      - elfutils
      - expat-devel
      - flex
      - gcc
      - gcc-c++
      - gcc-gfortran
      - gdbm-devel
      - gettext
      - git
      - glibc-devel
      - indent
      - intltool
      - libffi
      - libffi-devel
      - libicu
      - libicu-devel
      - libcurl-devel
      - libtool
      - libxml2
      - libxml2-devel
      - libxslt
      - libxslt-devel
      - libyaml
      - libyaml-devel
      - logrotate
      - logwatch
      - make
      - ncurses-devel
      - openssl-devel
      - patch
      - patchutils
      - perl-Time-HiRes
      - pkgconfig
      {% if db_engine == "postgresql" %}
      - postgresql-devel
      {% elif db_engine == "mysql2" %}
      - mysql-devel
      {% endif %}
      - python-devel
      - rcs
      - readline
      - readline-devel
      - redhat-rpm-config
      - redis
      - rpm-build
      - sqlite-devel
      - subversion
      - sudo
      - swig
      - system-config-firewall-tui
      - systemtap
      - tcl-devel
      - vim-enhanced
      - wget
    - require:
      - pkgrepo: PUIAS_6_computational
{% elif grains['os_family'] == 'Debian' %}
    - pkgs:
      - build-essential
      - ca-certificates
      - checkinstall
      - curl
      - libcurl4-openssl-dev
      - libffi-dev
      - libgdbm-dev
      - libicu-dev
      - libncurses5-dev
      - libreadline-dev
      - libssl-dev
      - libxml2-dev
      - libxslt1-dev
      - libyaml-dev
      - logrotate
      - openssh-server
      - python
      - python-docutils
      - redis
      - zlib1g-dev
      {% if db_engine == "postgresql" %}
      - libpq-dev
      {% if db_engine == "mysql2" %}
      - libmysqlclient-dev
      {% endif %}
      {% endif %}
{% endif %}

{% if salt['pillar.get']('gitlab:use_rvm', False) %}
rvm-deps:
  pkg.installed:
    - pkgs:
    {% if grains['os_family'] == 'RedHat' %}
      - bash
      - bzip2
      - coreutils
      - curl
      - gawk
      - gzip
      - libtool
      - sed
      - zlib
      - zlib-devel
    {% endif %}
{% endif %}
