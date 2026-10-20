# AWS VPC Peering Lab

## Project Overview

This project demonstrates how to establish private network communication between two Amazon Virtual Private Clouds (VPCs) using **AWS VPC Peering**. It uses Amazon EC2 instances, route tables, and security groups to configure and test connectivity between resources in separate VPCs.

## Objectives

- Create two VPCs with non-overlapping IPv4 CIDR blocks.
- Configure public and private subnets.
- Launch EC2 instances in both VPCs.
- Create and activate a VPC peering connection.
- Configure route tables and security groups.
- Test connectivity using SSH and ICMP ping.
- Identify and troubleshoot connectivity failures.
- Document the configuration, results, and cleanup process.

## AWS Resources

| Resource | Name | Configuration |
|---|---|---|
| VPC A | `ewb-vpc-a` | `10.10.0.0/16` |
| Public subnet | `ewb-a-public` | `10.10.1.0/24` |
| Private subnet A | `ewb-a-private` | `10.10.2.0/24` |
| VPC B | `ewb-vpc-b` | `10.20.0.0/16` |
| Private subnet B | `ewb-b-private` | `10.20.1.0/24` |
| Bastion EC2 | `ewb-bastion` | `10.10.1.10` |
| App-A EC2 | `ewb-app-a` | `10.10.2.10` |
| App-B EC2 | `ewb-app-b` | `10.20.1.10` |
| VPC Peering | `ewb-a-b-peer` | Connects VPC A and VPC B |

## Architecture

The project uses the following network design:

- **VPC A:** Contains a public subnet with a bastion host and a private subnet with App-A.
- **VPC B:** Contains a private subnet with App-B.
- **Bastion host:** Provides SSH access to the private EC2 instances.
- **VPC peering connection:** Enables private communication between VPC A and VPC B.
- **Route tables:** Direct traffic destined for the other VPC through the peering connection.
- **Security groups:** Control SSH and ICMP traffic.

## Implementation Steps

1. Create VPC A and VPC B.
2. Create the required public and private subnets.
3. Attach an Internet Gateway to VPC A.
4. Configure route tables and subnet associations.
5. Create security groups for the EC2 instances.
6. Launch the bastion, App-A, and App-B instances.
7. Create and accept the VPC peering connection.
8. Add routes for communication between the VPCs.
9. Test SSH access and ping connectivity.
10. Test a controlled connectivity failure and restore the required rule.
11. Capture screenshots and prepare the project report.
12. Clean up AWS resources after testing.

