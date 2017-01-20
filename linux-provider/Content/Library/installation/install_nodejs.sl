namespace: installation
flow:
  name: install_nodejs
  workflow:
    - check_latest_version:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: nodejs.com/version
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_nodejs
    - install_nodejs:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: myd-vm12345.hpeswlab.net
            - command: apt-get install nodejs
            - username: root
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      check_latest_version:
        x: 148
        y: 141
      install_nodejs:
        x: 335
        y: 138
        navigate:
          47404265-c5a4-e9d6-e745-2c656ba14981:
            targetId: 7997455f-ccf7-7873-096f-e5c5d50fd198
            port: SUCCESS
    results:
      SUCCESS:
        7997455f-ccf7-7873-096f-e5c5d50fd198:
          x: 553
          y: 143
