import json
import pandas as pd # type: ignore

# Load JSON data
with open('cloudwatch_alarms.json') as f:
    data = json.load(f)

# Extract relevant details
alarm_details = []
for alarm in data['MetricAlarms']:
    alarm_details.append({
        'AlarmName': alarm['AlarmName'],
        'AlarmDescription': alarm.get('AlarmDescription', 'N/A'),
        'StateValue': alarm['StateValue'],
        'MetricName': alarm.get('MetricName', 'N/A'),
        'Namespace': alarm.get('Namespace', 'N/A'),
        'Statistic': alarm.get('Statistic', 'N/A'),
        'ComparisonOperator': alarm['ComparisonOperator'],
        'Threshold': alarm.get('Threshold', 'N/A'),
        'Period': alarm.get('Period', 'N/A'),
        'EvaluationPeriods': alarm.get('EvaluationPeriods', 'N/A'),
        'AlarmActions': ', '.join(alarm.get('AlarmActions', [])),
        'OKActions': ', '.join(alarm.get('OKActions', [])),
        'InsufficientDataActions': ', '.join(alarm.get('InsufficientDataActions', []))
    })

# Convert to DataFrame
df = pd.DataFrame(alarm_details)

# Save to CSV
output_file = 'cloudwatch_alarms.csv'
df.to_csv(output_file, index=False)

print(f"CloudWatch alarms have been saved to {output_file}")