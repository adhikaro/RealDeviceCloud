#!/bin/bash

echo $1
echo $2
if [ $1 == POCO ] || [ $1 == poco ] || [ $1 == Poco ]
then

   npm --prefix /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation run android.app --suite demoSuite
   allure generate allure-results/ --clean && allure
   mv /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/SliceRealDeviceCloud/public/javascripts/allure-report /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/SliceRealDeviceCloud/public/javascripts/allure-report-$1
   aws s3 sync /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/SliceRealDeviceCloud/public/javascripts/allure-report-$1 s3://test.uireport.sliceit.com/srdc_Android-$2
   rm -r allure-results
   rm -r allure-report-$1
   ui_automation_report=""
   curl -X POST -H 'Content-type: application/json' --data '
        {"text":"Description - MobileAppAutomationExecutedOnSRDC : srdc_test-'$2', DeviceName: '$1' \n
        Test_Report_Link - https://s3.console.aws.amazon.com/s3/buckets/test.uireport.sliceit.com?region=ap-south-1&prefix=srdc_test-'$2'/&showversions=false"}
        ' $ui_automation_report

elif [ $1 == "PIXEL" ] || [ $1 == "pixel" ] || [ $1 == "Pixel" ]
 then
   npm --prefix /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation run bs.android.app --suite demoSuite
   allure generate ./allure-results/ --clean
   mv ../../../UI_Test_iOS/allure-report ../../../UI_Test_iOS/allure-report-$1
   aws s3 sync /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS/allure-report-$1 s3://test.uireport.sliceit.com

elif [ $1 == "iphone" ] || [ $1 == "IPHONE" ] || [ $1 == "Iphone" ]
 then
   cd /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS 
   npx wdio 
   allure generate allure-results/ --clean && allure
   mv /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/SliceRealDeviceCloud/public/javascripts/allure-report /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/SliceRealDeviceCloud/public/javascripts/allure-report-$1
   aws s3 sync /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/SliceRealDeviceCloud/public/javascripts/allure-report-$1 s3://test.uireport.sliceit.com/srdc_iOS-$2
   rm -r allure-results
   rm -r allure-report-$1
   ui_automation_report=""
   curl -X POST -H 'Content-type: application/json' --data '
        {"text":"Description - MobileAppAutomationExecutedOnSRDC : srdc_test-'$2', DeviceName: '$1' \n
        Test_Report_Link - https://s3.console.aws.amazon.com/s3/buckets/test.uireport.sliceit.com?region=ap-south-1&prefix=srdc_test-'$2'/&showversions=false"}
        ' $ui_automation_report

elif [ $1 == "REDMI" ] || [ $1 == "redmi" ] || [ $1 == "Redmi" ]
 then
   npm --prefix /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation run bs.android.app --suite demoSuite
   allure generate ./allure-results/ --clean
   mv ../../../UI_Test_iOS/allure-report ../../../UI_Test_iOS/allure-report-$1
   aws s3 sync /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/UI_Test_iOS/allure-report-$1 s3://test.uireport.sliceit.com

fi
