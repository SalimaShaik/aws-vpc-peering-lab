# AWS VPC Peering Lab — Cleanup Guide

## 1. Introduction

This guide explains how to remove the AWS resources created for the VPC Peering lab after completing connectivity tests and collecting the required screenshots.

Cleaning up unused resources helps prevent unnecessary AWS charges.

## 2. Before Starting Cleanup

Before deleting resources:

- Capture screenshots of the VPCs, subnets, route tables, and peering connection.
- Save screenshots of successful and failed connectivity tests.
- Complete your project report.
- Confirm that the resources being deleted belong to this lab.

**Warning:** Deleting resources can permanently remove data and affect other workloads. Do not delete resources that belong to other projects.

## 3. Terminate EC2 Instances

1. Open the AWS Management Console.
2. Navigate to **EC2 → Instances**.
3. Select the following lab instances:
   - `ewb-bastion`
   - `ewb-app-a`
   - `ewb-app-b`
4. Choose **Instance state → Terminate instance**.
5. Confirm the termination.

Wait until the instances have terminated before proceeding.

## 4. Check for Unused Resources

After terminating the instances, check the following EC2 resources:

- **EBS Volumes:** Delete unattached volumes that are no longer required for the lab.
- **Snapshots:** Delete only lab snapshots that are no longer needed.
- **Elastic IP addresses:** Release unused addresses allocated for this lab.

Review each resource carefully before deleting it.

## 5. Delete the VPC Peering Connection

1. Open **VPC → Peering Connections**.
2. Find `ewb-a-b-peer`.
3. Select the connection.
4. Choose **Actions → Delete peering connection**.
5. Confirm the deletion.

If the connection cannot be deleted, check for dependencies or follow the AWS console error message.

## 6. Remove Peering Routes

Open **VPC → Route Tables** and remove routes that point to the deleted peering connection.

Remove these lab routes:

| Route table | Destination |
|---|---|
| `ewb-rt-a-public` | `10.20.0.0/16` |
| `ewb-rt-a-private` | `10.20.0.0/16` |
| `ewb-rt-b-private` | `10.10.0.0/16` |

Keep the local routes. Keep the public route table's Internet Gateway default route until you are ready to remove the Internet Gateway.

## 7. Delete Security Groups

Delete the lab security groups after the instances and dependent network interfaces have been removed:

- `ewb-sg-bastion`
- `ewb-sg-app-a`
- `ewb-sg-app-b`

If AWS reports that a security group is in use, identify and remove the dependent lab resource first.

## 8. Delete Subnets

Navigate to **VPC → Subnets**.

Delete the following subnets:

- `ewb-a-public`
- `ewb-a-private`
- `ewb-b-private`

Make sure the subnets no longer contain dependent resources.

## 9. Delete Custom Route Tables

Navigate to **VPC → Route Tables**.

Delete these custom route tables after removing their subnet associations:

- `ewb-rt-a-public`
- `ewb-rt-a-private`
- `ewb-rt-b-private`

Do not attempt to delete the VPC's main route table directly; AWS manages its lifecycle with the VPC.

## 10. Detach and Delete the Internet Gateway

1. Open **VPC → Internet Gateways**.
2. Select `ewb-igw-a`.
3. Choose **Actions → Detach from VPC**.
4. Confirm the detachment.
5. Delete the Internet Gateway.

## 11. Delete the VPCs

After removing their dependent resources, delete:

- `ewb-vpc-a`
- `ewb-vpc-b`

If deletion fails, read the error message and remove the remaining dependent resources before trying again.

## 12. Delete the Key Pair (Optional)

If you no longer need the lab key pair:

1. Open **EC2 → Key Pairs**.
2. Find `ewb-lab`.
3. Delete the AWS key-pair entry.

Deleting the AWS entry does not securely erase private-key copies already downloaded to your computer. Keep or securely dispose of those copies as appropriate.

## 13. Verify Cleanup and Billing

1. Check that the lab EC2 instances have terminated.
2. Confirm there are no unwanted lab EBS volumes, snapshots, or Elastic IP addresses remaining.
3. Confirm the peering connection and lab VPC resources have been removed.
4. Open **Billing and Cost Management**.
5. Review current and estimated charges.

Billing information may take time to update, and charges already incurred may still appear after cleanup.

## 14. Cleanup Checklist

- [ ] Captured all project screenshots.
- [ ] Terminated all three lab EC2 instances.
- [ ] Checked and removed unwanted EBS volumes and snapshots.
- [ ] Released unused lab Elastic IP addresses.
- [ ] Deleted the VPC peering connection.
- [ ] Removed peering routes.
- [ ] Deleted the lab security groups.
- [ ] Deleted the lab subnets.
- [ ] Deleted the custom route tables.
- [ ] Detached and deleted the Internet Gateway.
- [ ] Deleted both lab VPCs.
- [ ] Reviewed AWS Billing and Cost Management.

## 15. Conclusion

Cleaning up AWS resources is an important part of cloud resource management. This process removes unused lab infrastructure and helps reduce the risk of future charges.

**Evidence note:** Complete this checklist only after performing the corresponding cleanup actions in your AWS account.
