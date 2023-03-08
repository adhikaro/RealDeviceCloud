const supertest = require("supertest")
const config = require('../../../webdriverio-ui-automation/testing_api/Helper_elements/config').config;
var exec = require('child_process').exec;
let moment = require('moment');

var UIFunction = function () {
    this.automationTrigger = async function (req, res) {
        console.log(req.body)
        let timeStamp = moment().format().substring(08, 16);
        console.log(timeStamp)
        if (req.body.device_name) {
            console.log("in1")
            if (req.body.device_name === 'POCO') {
                console.log("poco")
                exec(`bash /Users/omika/Desktop/WorkSpace/webdriverio-ui-automation/SliceRealDeviceCloud/public/javascripts/poco.sh ${req.body.device_name} ${timeStamp}`, {maxBuffer: 1024 * 100000},(error, stdout, stderr) => {
                    console.log("in2")
                    if (error) {
                        console.log(`error: ${error.message}`);
                        return;
                    }
                    if (stderr) {
                        console.log(`stderr: ${stderr}`);
                        return;
                    }
                    console.log(`stdout: ${stdout}`);
                })
                return res.send({ "success": true, "msg": "Execution Started" });
            } else {
                exec(`bash /Users/slicerealdevicecloud/Desktop/slice_project/webdriverio-ui-automation/SliceRealDeviceCloud/public/javascripts/iphone.sh ${req.body.device_name} ${timeStamp}`, (error, stdout, stderr) => {
                    console.log("in2")
                    if (error) {
                        console.log(`error: ${error.message}`);
                        return;
                    }
                    if (stderr) {
                        console.log(`stderr: ${stderr}`);
                        return;
                    }
                    console.log(`stdout: ${stdout}`);
                })
                return res.send({ "success": true, "msg": "Execution Started" });
            }
        }
        else {
            return res.send({ "success": false, "msg": "Execution Failed" });
        }
    }
}
module.exports = new UIFunction();

