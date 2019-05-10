docker search {{image_name}}
docker logs {{container_name_or_id}} 
docker exec -it {{container_name_or_id}} PowerShell 
docker cp {{local_source_file}} {{container_name_or_id}}:{{destination_path_in_container}}

#windows container
docker inspect --format "{{ .ID }} - {{ .Name }} - {{ .NetworkSettings.Networks.nat.IPAddress }}" {{container_name_or_id}}
docker inspect {{container_name_or_id}} | ConvertFrom-Json | select -ExpandProperty SyncRoot | select -expand netWorkSettings | select -ExpandProperty Networks | Select -ExpandProperty nat | Select IPAddress 


#linux container on windows
docker inspect --format "{{ .ID }} - {{ .Name }} - {{ .NetworkSettings.Networks.bridge.IPAddress }}" {{container_name_or_id}}
docker inspect {{container_name_or_id}} | ConvertFrom-Json | select -ExpandProperty SyncRoot | select -expand netWorkSettings | select -ExpandProperty Networks | Select -ExpandProperty bridge | Select IPAddress

#up and down create/remove the containers
docker-compose up
docker-compose start
docker-compose stop
docker-compose down