gitlab-formula
==============

SaltStack formula to install GitLab

Salt state for installing GitLab - https://gitlab.com/gitlab-org/gitlab-ce

Following original install docs ( https://gitlab.com/gitlab-org/gitlab-ce/blob/master/doc/install/installation.md ) as close as possible, with some exceptions:
* ruby 1.9.3 is enough for it to work, so I'm using system packages for that
* Using PostgreSQL as currently recommended database, with support to use MySQL settable via pillar

Currently tested only on Debian, further systems planned.

Initial work done for CentOS but doesn't work there yet, heavily inspired by https://github.com/gitlabhq/gitlab-recipes/tree/master/install/centos

There are some initial bits for supporting RVM, but it's not working yet.

I assume you're running gitlab under your node's FQDN, not under another name.

Attempt made to have most settings tunable via pillars.

Formula Dependencies
====================

* git: https://github.com/saltstack-formulas/git-formula
* (not used yet) nginx: https://github.com/saltstack-formulas/nginx-formula
Depending on which database engine you chose, one of:
* postgres (recommended, default): https://github.com/saltstack-formulas/postgres-formula
* mysql: https://github.com/saltstack-formulas/mysql-formula
