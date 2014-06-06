gitlab-info:
  cmd.run:
    - user: git
    - cwd: /home/git/gitlab
    - name: bundle exec rake gitlab:env:info RAILS_ENV=production
    - shell: /bin/bash

gitlab-check:
  cmd.run:
    - user: git
    - cwd: /home/git/gitlab
    - name: bundle exec rake gitlab:check RAILS_ENV=production
    - shell: /bin/bash
