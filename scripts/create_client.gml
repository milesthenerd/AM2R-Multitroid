/// create_client
if(global.canSet){
    instance_create(0, 0, oClient);
    exit;
} else {
    create_client();
}
