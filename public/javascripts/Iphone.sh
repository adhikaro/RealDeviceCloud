#!/bin/bash


echo $1
echo $2
cd /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS 
   npx wdio 
  allure generate /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS/allure-results --clean && allure 
   mv /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS/allure-report /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS/allure-report-$1
   aws s3 sync /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS/allure-report-$1 s3://test.uireport.sliceit.com/srdc_iOS-$2
   rm -r /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS/allure-results
   rm -r /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS/allure-report-$1
    ui_automation_report=""
   curl -X POST -H 'Content-type: application/json' --data '
        {"text":"Description - MobileAppAutomationExecutedOnSRDC : srdc_iOS-'$2', DeviceName: '$1' \n
        Test_Report_Link - https://s3.console.aws.amazon.com/s3/buckets/test.uireport.sliceit.com?region=ap-south-1&prefix=srdc_iOS-'$2'/&showversions=false"}
        ' $ui_automation_report


