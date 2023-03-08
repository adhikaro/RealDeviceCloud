#!/bin/bash


echo $1
echo $2
cd /Users/omika/Desktop/WorkSpace/webdriverio-ui-automation/mobileAppAutomation
npx wdio
   allure generate /Users/omika/Desktop/WorkSpace/webdriverio-ui-automation/mobileAppAutomation/allure-results --clean && allure
   mv /Users/omika/Desktop/WorkSpace/webdriverio-ui-automation/mobileAppAutomation/allure-report /Users/omika/Desktop/WorkSpace/webdriverio-ui-automation/mobileAppAutomation/allure-report-$1
   aws s3 sync /Users/omika/Desktop/WorkSpace/webdriverio-ui-automation/mobileAppAutomation/allure-report-$1 s3://test.uireport.sliceit.com/srdc_Android-$2
   rm -r /Users/omika/Desktop/WorkSpace/webdriverio-ui-automation/mobileAppAutomation/allure-results
   rm -r /Users/omika/Desktop/WorkSpace/webdriverio-ui-automation/mobileAppAutomation/allure-report-$1
   ui_automation_report=""
   curl -X POST -H 'Content-type: application/json' --data '
        {"text":"Description - MobileAppAutomationExecutedOnSRDC : srdc_android-'$2', DeviceName: '$1' \n
        Test_Report_Link - https://s3.console.aws.amazon.com/s3/buckets/test.uireport.sliceit.com?region=ap-south-1&prefix=srdc_android-'$2'/&showversions=false"}
        ' $ui_automation_report