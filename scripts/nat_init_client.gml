/// nat_init_client()
// Initializes NAT traversal variables for client
// Call this in oClient Create event AFTER config is loaded

// Mediation server connection (config variables loaded separately)
mediation_socket = -1;
mediation_connected = false;

// NAT state machine
nat_state = NAT_STATE_DISCONNECTED;

// NAT detection
nat_type = NAT_TYPE_UNKNOWN;
nat_local_port = 0;
nat_external_port_one = 0;
nat_external_port_two = 0;

// Client ID (random string for mediation server)
nat_client_id = string(floor(random(999999)));

// Connection coordination
nat_connection_id = -1;
nat_peer_ip = "";
nat_peer_port = 0;
nat_peer_nat_type = NAT_TYPE_UNKNOWN;

// Hole punching
nat_hole_punch_timer = 0;
nat_hole_punch_count = 0;
nat_hole_punch_received = 0;
nat_hole_punch_confirmed = false;
NAT_HOLE_PUNCH_THRESHOLD = 5;
NAT_HOLE_PUNCH_INTERVAL = 10;  // Send every 10 steps (~100ms)

// Birthday paradox sockets for symmetric NAT
nat_random_sockets = ds_list_create();  // List of random UDP sockets
nat_random_sockets_created = false;
nat_successful_socket = noone;  // Track which random socket succeeded

// TCP message buffer for partial messages
nat_tcp_buffer = "";
