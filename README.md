<h1 align="center">
<img src="https://raw.githubusercontent.com/Renien/cloud-datasync/master/doc/blob/cloud-data-sync.png" alt="article" width="20%" height="20%">
    <br>
        cloud-datasync
    <br>
  <h4 align="center">Big Data & Cloud Data Sync Tool</h4>
</h1>

<p align="center">
  <a href="https://github.com/Renien/cloud-datasync/blob/master/LICENSE">
    <img src="https://img.shields.io/npm/l/express.svg?maxAge=2592000&style=flat-square"
         alt="License">
  </a>
</p>

## Summary

Cloud data sync tool will be very useful during the migration process to move all the partitioned/non-partitioned HDFS data to Cloud buckets. 

## Features and Limitations

The cloud-datasync tool currently supports to copy data to GCP/AWS cloud data storage from any local linux/mac machines. These are new features I have planned for the tool,
-	Using ‘distcp’ command effectively copy the data from local HDFS cluster to any cloud service 
-	Automatically generate Azkaban job flow and schedule the data copy jobs in Azkaban servers. We can use [Azkaban Python Package](https://pypi.python.org/pypi/azkaban/0.6.43) to implement the this feature.

If you want to share any new features/issues, feel free to open an issue in the GitHub repository.

## Directory Layout

```
.
├── LICENSE
├── README.md
├── doc
│   └── blob
│       └── cloud-data-sync.png
├── modules												--> module folder
│   ├── authentication.sh
│   ├── conf                                            --> configurations for data sync tool
│   │   └── aws-conf.properties                         --> sample access and secret keys for AWS 
│   ├── datePatternValidation.sh
│   ├── dateUtilsLinux.sh                               --> date utils for linux machine 
│   ├── dateUtilsMac.sh                                 --> date utils for mac machine 
│   ├── processBulk.sh                                  --> to upload bulk data
│   └── processPartitioned.sh                           --> to upload incrementally the partitioned data
├── runDataSync.sh                                      --> main script that uses the module
├── sample_AWS_command.sh                               --> sample commands to copy the data to AWS S3 bucket 
├── sample_GCP_command.sh                               --> sample commands to copy the data to GCP storage 
└── test                                                --> test scripts for each modules 
    ├── authenticationTest.sh
    ├── datePatternValidationTest.sh
    ├── dateUtilsLinuxTest.sh
    └── dateUtilsMacTest.sh
```

## License
MIT © [Renien](https://twitter.com/RenienJoseph)