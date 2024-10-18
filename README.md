
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
