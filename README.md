
### How to Run the Script
1. **Make the Script Executable**: Give the script executable permissions using the following command:
   ```bash
   chmod +x /path/to/aws_resource_tracker.sh
   ```

2. **Run the Script Manually**: Execute the script with the following command:
   ```bash
   /path/to/aws_resource_tracker.sh
   ```

3. **Check the Output**: The output will be appended to `resourceTracker`. You can view it with:
   ```bash
   cat resourceTracker
   ```

### Integrating with Cron Jobs
To run the script automatically at regular intervals, you can use cron jobs. Here’s how to set it up:

1. **Open the Crontab Editor**:
   ```bash
   crontab -e
   ```

2. **Add a Cron Job**: To run the script every 5 minutes, add the following line to the crontab file:
   ```bash
   */5 * * * * /path/to/aws_resource_tracker.sh
   ```

3. **Save and Exit**:
   - If you're using **nano**: Press `CTRL + X`, then `Y`, and hit Enter.
   - If you're using **vim**: Press `Esc`, type `:wq`, and hit Enter.

4. **Verify the Cron Job**: List all cron jobs to confirm that your job is set up correctly:
   ```bash
   crontab -l
   ```




### SCRIPT EXPLAINATION

### 1. Shebang
```bash
#!/bin/bash
```
- This line indicates that the script should be run using the Bash shell.

### 2. Script Header
```bash
######################
# Author: Sayeed
# Date: 18th-Oct
#
# Version: v1
#
# This script will report simplified AWS resource usage
######################
```
- This is a comment block that provides metadata about the script, including the author, date, version, and a brief description of its purpose.

### 3. Debugging Mode
```bash
set -x
```
- This command enables debugging mode, which prints each command and its arguments to the terminal as they are executed. This can help with troubleshooting by showing you what the script is doing step by step.

### 4. Clear Previous Content (Optional)
```bash
> resourceTracker
```
- This line clears the content of the `resourceTracker` file before appending new data. If the file doesn't exist, it will create an empty file.

### 5. List of S3 Buckets
```bash
echo "List of S3 Buckets:" | tee -a resourceTracker
aws s3 ls | awk '{print $3}' | tee -a resourceTracker
```
- **First Line**: Prints the header "List of S3 Buckets:" to the terminal and appends it to `resourceTracker`.
- **Second Line**: Uses the `aws s3 ls` command to list S3 buckets. The output is piped to `awk`, which extracts the third column (the bucket names) and then appends this output to `resourceTracker`.

### 6. List of EC2 Instances
```bash
echo "List of EC2 Instance IDs and States:" | tee -a resourceTracker
aws ec2 describe-instances | jq -r '.Reservations[].Instances[] | {InstanceId, State: .State.Name}' | tee -a resourceTracker
```
- **First Line**: Prints the header "List of EC2 Instance IDs and States:" and appends it to `resourceTracker`.
- **Second Line**: Uses the `aws ec2 describe-instances` command to get details about EC2 instances. The output is processed by `jq`, which extracts each instance's ID and state (e.g., running, stopped) and appends this output to `resourceTracker`.

### 7. List of Lambda Functions
```bash
echo "List of Lambda Function Names:" | tee -a resourceTracker
aws lambda list-functions | jq -r '.Functions[].FunctionName' | tee -a resourceTracker
```
- **First Line**: Prints the header "List of Lambda Function Names:" and appends it to `resourceTracker`.
- **Second Line**: Uses the `aws lambda list-functions` command to list Lambda functions. The output is processed by `jq`, which extracts the names of all functions and appends this output to `resourceTracker`.

### 8. List of IAM Users
```bash
echo "List of IAM User Names:" | tee -a resourceTracker
aws iam list-users | jq -r '.Users[].UserName' | tee -a resourceTracker
```
- **First Line**: Prints the header "List of IAM User Names:" and appends it to `resourceTracker`.
- **Second Line**: Uses the `aws iam list-users` command to list IAM users. The output is processed by `jq`, which extracts the usernames and appends this output to `resourceTracker`.

