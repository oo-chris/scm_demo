namespace: installation
flow:
  name: multiple_app_installation
  workflow:
    - install_nodejs:
        do:
          installation.install_nodejs: []
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_docker_engine
    - install_docker_engine:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${hostname}'
            - command: apt-get install docker-engine
            - username: root
        navigate:
          - FAILURE: on_failure
          - SUCCESS: send_mail
    - send_mail:
        do:
          io.cloudslang.base.mail.send_mail:
            - hostname: smtp3.hpe.com
            - port: '25'
            - from: chris@demo.com
            - to: jane@demo.com
            - subject: application installed
            - body: the following application was installed
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      install_nodejs:
        x: 209
        y: 154
      send_mail:
        x: 592
        y: 153
        navigate:
          be00ca84-c0bd-5580-5b67-7640e56b44cf:
            targetId: 093bb1ab-06ed-1acc-cc44-e843e4b369ee
            port: SUCCESS
      install_docker_engine:
        x: 409
        y: 153
    results:
      SUCCESS:
        093bb1ab-06ed-1acc-cc44-e843e4b369ee:
          x: 751
          y: 154
