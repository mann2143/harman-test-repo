#!/bin/bash

# Get the commit message file path
COMMIT_MSG_FILE="$1"

# Prompt for module / function category
echo "Select the module / function category:"
echo "1. Account & User Management"
echo "2. Account Management"
echo "3. Allocation Management"
echo "4. Allocation/Sourcing Management"
echo "5. Certificate Configuration"
echo "6. Contract Management"
echo "7. Customer Management"
echo "8. Dashboard"
echo "9. Issue Reporting"
echo "10. Logistic Management"
echo "11. Product & Configuration"
echo "12. Production Management"
echo "13. Shipment Dashboard"
echo "14. Shipment Management"
echo "15. Sourcing & Contract Management"
echo "16. Spatial Monitoring And Analysis"
echo "17. Supplier Profile Management"
echo "18. Task & Workflow Management"
echo "19. Tenant Management"
echo "20. Traceability Management"
echo "21. Notification Management"
echo "22. Others"
read -p "Enter the number corresponding to the module / function category: " module_choice

# Prompt for business unit
echo "Select the business unit:"
echo "1. Tenant"
echo "2. Customer"
echo "3. KCP"
echo "4. Mill"
echo "5. Mill/KCP"
echo "6. Platform Admin"
echo "7. Platform Management"
echo "8. Refinery"
echo "9. Supply Chain Department"
echo "10. Sustainability"
echo "11. Tenant Admin"
read -p "Enter the number corresponding to the business unit: " bu_choice

# Prompt for use-case ID
read -p "Enter the use-case ID: " use_case_id

# Prompt for JIRA issue number
read -p "Enter the JIRA issue number: " jira_number

# Prompt for change summary
read -p "Enter the change summary: " change_summary

# Format the commit message
commit_message="($module_choice) ----- ($bu_choice) ----- ($use_case_id) ----- ($jira_number) ----- ($change_summary)"

# Write the commit message to the commit message file
echo "$commit_message" > "$COMMIT_MSG_FILE"

