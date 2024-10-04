#!/bin/bash

# Function to display options and prompt for selection by number
prompt_selection() {
  echo "$1"
  PS3="Enter the number of your choice: "
  select opt in "${@:2}"; do
    if [ -n "$opt" ]; then
      echo "$opt"
      break
    else
      echo "Invalid option. Please try again."
    fi
  done
}

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

# Mapping module number to category name
case $module_choice in
  1) module="Account & User Management" ;;
  2) module="Account Management" ;;
  3) module="Allocation Management" ;;
  4) module="Allocation/Sourcing Management" ;;
  5) module="Certificate Configuration" ;;
  6) module="Contract Management" ;;
  7) module="Customer Management" ;;
  8) module="Dashboard" ;;
  9) module="Issue Reporting" ;;
  10) module="Logistic Management" ;;
  11) module="Product & Configuration" ;;
  12) module="Production Management" ;;
  13) module="Shipment Dashboard" ;;
  14) module="Shipment Management" ;;
  15) module="Sourcing & Contract Management" ;;
  16) module="Spatial Monitoring And Analysis" ;;
  17) module="Supplier Profile Management" ;;
  18) module="Task & Workflow Management" ;;
  19) module="Tenant Management" ;;
  20) module="Traceability Management" ;;
  21) module="Notification Management" ;;
  22) module="Others" ;;
  *) echo "Invalid choice for module. Exiting."; exit 1 ;;
esac

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

# Mapping business unit number to name
case $bu_choice in
  1) business_unit="Tenant" ;;
  2) business_unit="Customer" ;;
  3) business_unit="KCP" ;;
  4) business_unit="Mill" ;;
  5) business_unit="Mill/KCP" ;;
  6) business_unit="Platform Admin" ;;
  7) business_unit="Platform Management" ;;
  8) business_unit="Refinery" ;;
  9) business_unit="Supply Chain Department" ;;
  10) business_unit="Sustainability" ;;
  11) business_unit="Tenant Admin" ;;
  *) echo "Invalid choice for business unit. Exiting."; exit 1 ;;
esac

# Prompt for use-case ID
read -p "Enter the use-case ID: " use_case_id

# Prompt for Jira issue number
read -p "Enter the Jira issue number: " jira_issue

# Prompt for change summary
read -p "Enter the change summary: " change_summary

# Generate the commit message in the desired format
commit_message="($module) ----- ($business_unit) ----- $use_case_id ----- $jira_issue ----- $change_summary"

# Confirm the commit message with the user
echo "Your commit message will be: "
echo "$commit_message"

# Prompt for confirmation
read -p "Do you want to proceed with this commit message? (y/n): " confirmation

if [[ "$confirmation" =~ ^[Yy]$ ]]; then
  # Proceed with the git commit
  git commit -m "$commit_message"
else
  echo "Commit aborted."
fi

