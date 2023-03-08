const aws  = require('aws-sdk');

const assumeRole = (roleArn) => {
    return new Promise((resolve, reject) => {
        const sts =  new aws.STS();
        sts.assumeRole(({
            RoleArn: roleArn,
            DurationSeconds: 43199,
            RoleSessionName: process.env.USER + "-" +  (Math.floor(new Date() / 1000))
        }),function (err, res) {
                if(err){
                    console.error("Error in assuming role", {roleArn, err});
                    return reject(new Error('Error in assuming role'));
                }
                if(!res.Credentials){
                    console.error("Invalid response from aws while assuming role",{res});
                    return reject(new Error('Error in assuming role'));
                }
                aws.config.update({
                    credentials: {
                        accessKeyId: res.Credentials.AccessKeyId,
                        secretAccessKey: res.Credentials.SecretAccessKey,
                        sessionToken: res.Credentials.SessionToken
                    }
                })
                console.info("Successfully assumed role", {roleArn});
                return resolve(true);
        });
    });
} 




