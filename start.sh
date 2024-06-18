mkdir -p ./server/plugins
cp --no-preserve=mode -r $missile_wars/plugins/* ./server/plugins
cp --no-preserve=mode -r $world_edit/plugins/* ./server/plugins
cp --no-preserve=mode $papermc ./server/paper.jar
cd ./server
echo "eula=true" > eula.txt
$java -jar paper.jar --nogui 
