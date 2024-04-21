#!/bin/bash
# Accept the server license terms automatically
/code --accept-server-license-terms
# Run the tunnel service
/code tunnel service install
exec "$@"
