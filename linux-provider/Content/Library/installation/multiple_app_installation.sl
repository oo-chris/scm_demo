namespace: installation
flow:
  name: multiple_app_installation
  workflow:
    - install_nodejs:
        do:
          installation.install_nodejs: []
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_docker
    - install_docker:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${hostname}'
            - command: apt-get install docker-engine
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
      install_nodejs:
        x: 209
        y: 154
      install_docker:
        x: 442
        y: 152
        navigate:
          2275fc3a-6ec9-3fd3-fd3d-be5c5ff034bc:
            targetId: 093bb1ab-06ed-1acc-cc44-e843e4b369ee
            port: SUCCESS
    results:
      SUCCESS:
        093bb1ab-06ed-1acc-cc44-e843e4b369ee:
          x: 668
          y: 156
