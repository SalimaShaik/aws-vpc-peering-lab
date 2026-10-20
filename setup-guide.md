# AWS VPC Peering Lab — Setup Guide

## 1. Introduction

This guide explains how to configure two Amazon Virtual Private Clouds (VPCs), launch EC2 instances, establish VPC Peering, configure routing, and test private network connectivity.

## 2. Prerequisites

Before starting, ensure you have:

- An active AWS account with access to VPC and EC2.
- Access to the AWS Management Console.
- An SSH client, such as OpenSSH.
- Basic knowledge of IP addresses, subnets, and security groups.

**Cost warning:** Check your AWS account plan, available credits, and current resource pricing before launching instances. AWS resources may incur charges.

## 3. Select the AWS Region

1. Sign in to the AWS Management Console.
2. Select the AWS Region required for your lab.
3. Use the same Region for all resources in this project unless instructed otherwise.

Suggested Region: Mumbai (`ap-south-1`).

## 4. Create VPC A

1. Open the **VPC** service.
2. Select **Create VPC**.
3. Enter the name `ewb-vpc-a`.
4. Set the IPv4 CIDR block to `10.10.0.0/16`.
5. Create the VPC.

### Create subnets in VPC A

| Subnet | CIDR block | Type |
|---|---|---|
| ewb-a-public | 10.10.1.0/24 | Public |
| ewb-a-private | 10.10.2.0/24 | Private |

Create both subnets inside `ewb-vpc-a`.

## 5. Create the Internet Gateway

1. Open **Internet Gateways** in the VPC console.
2. Create an Internet Gateway named `ewb-igw-a`.
3. Attach it to `ewb-vpc-a`.

## 6. Configure VPC A Route Tables

### Public route table

Create `ewb-rt-a-public` and associate it with `ewb-a-public`.

Add these routes:

| Destination | Target |
|---|---|
| 10.10.0.0/16 | Local |
| 0.0.0.0/0 | Internet Gateway |

The local route is created automatically. Add the default route to the Internet Gateway.

### Private route table

Create `ewb-rt-a-private` and associate it with `ewb-a-private`.

The local route is created automatically. The route to VPC B will be added after peering is created.

## 7. Create VPC B

1. Create a VPC named `ewb-vpc-b`.
2. Set the IPv4 CIDR block to `10.20.0.0/16`.
3. Create a private subnet named `ewb-b-private` with CIDR `10.20.1.0/24`.
4. Create a route table named `ewb-rt-b-private`.
5
