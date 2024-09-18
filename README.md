# Export AWS CloudWatch Alarms to CSV

This guide describes how to export AWS CloudWatch alarms to a CSV file using AWS CLI and Python in AWS CloudShell.

## Script Summary

1. **`convert_alarms_to_csv.py`**
   - **Description:** Converts AWS CloudWatch alarms described in a JSON file to a CSV file. The script reads `cloudwatch_alarms.json` and outputs `cloudwatch_alarms.csv`.

## How to Run in AWS CloudShell

### Prerequisites

- Ensure you have access to the AWS Management Console.
- Ensure you have the necessary permissions to describe CloudWatch alarms.

### Steps

1. **Open AWS CloudShell:**

   - Navigate to the [AWS Management Console](https://aws.amazon.com/console/).
   - Click on the **CloudShell** icon in the top-right corner of the console.

2. **Describe CloudWatch Alarms and Save to JSON:**

   - Run the following command in CloudShell to get the details of all CloudWatch alarms and save the output to a JSON file:

   ```bash
   aws cloudwatch describe-alarms --output json > cloudwatch_alarms.json
   ```

3. **Upload the Script to CloudShell:**

   - Once CloudShell is open, click on the Actions menu (three vertical dots) in the upper right corner of the CloudShell terminal.
   - Select Upload file.
   - Choose the convert_alarms_to_csv.py script file from your local machine and upload it to CloudShell.

4. **Install pandas Library:**

   - If pandas is not already installed in CloudShell, install it using pip:

   ```bash
      pip install pandas
   ```

5. **Run the Python Script:**

   - Execute the Python script to convert the JSON file to a CSV file:

   ```bash
      python convert_alarms_to_csv.py
   ```

6. **Verify the CSV File:**

   - List the files to verify the CSV file was created:

   ```bash
      ls
   ```

7. **Download the CSV File:**
   - Once the script runs successfully, you can download the cloudwatch_alarms.csv file from CloudShell to your local machine using the download feature in the CloudShell interface.
