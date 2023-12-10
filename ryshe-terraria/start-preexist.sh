sudo docker run -d -p 7777:7777 -v $HOME/terraria/world:/root/.local/share/Terraria/Worlds --name="terraria" -e WORLD_FILENAME=Terrarium ryshe/terraria:latest
