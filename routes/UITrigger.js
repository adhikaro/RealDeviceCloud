const express = require("express");
const router = express.Router();
var UIFns = require("../public/javascripts/UIFns");

router.post("/uiautomation", UIFns.automationTrigger);

module.exports = router;