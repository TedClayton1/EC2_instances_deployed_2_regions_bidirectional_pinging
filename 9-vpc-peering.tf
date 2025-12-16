resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = aws_vpc.us_vpc_east.id
  peer_vpc_id = aws_vpc.aps2_vpc.id
  peer_region = "ap-southeast-2"

  auto_accept = false
}

resource "aws_vpc_peering_connection_accepter" "peer_accept" {
  provider                  = aws.aps2
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true
}

resource "aws_route" "us_to_aps2" {
  route_table_id            = aws_route_table.us_east_rt.id
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  depends_on = [aws_vpc_peering_connection_accepter.peer_accept]
}

resource "aws_route" "aps2_to_us" {
  provider                  = aws.aps2
  route_table_id            = aws_route_table.aps2_rt.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  depends_on = [aws_vpc_peering_connection_accepter.peer_accept]
}

# Optional Enable DNS Resolution Over Peering
# Allows things like Private DNS and Internal service discovery.
# Enabling DNS resolution over peering for a ping test in a Terraform configuration allows
# the resource performing the test in a private network to resolve the private DNS names of
#resources in a connected private network, without the traffic needing to go out to the public internet
# or through complex VPN/direct connect setups.

resource "aws_vpc_peering_connection_options" "us_options" {
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [
    aws_vpc_peering_connection_accepter.peer_accept
  ]
}

resource "aws_vpc_peering_connection_options" "aps2_options" {
  provider                  = aws.aps2
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  depends_on = [
    aws_vpc_peering_connection_accepter.peer_accept
  ]
}

