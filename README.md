# Greenplum in Docker with 2 segments
To start, execute:
```sh
git clone https://github.com/ShaRgCx/gpdb7
cd gpdb7/build
docker build -t gpdb7
```
To run use
```sh
cd ..
docker-compose up
```
This should give output of something like this:
```
Creating network "gpdb7_default" with the default driver
Creating volume "gpdb7_pgdata" with default driver
Creating gpdb7_sdw1_1 ... done
Creating gpdb7_sdw2_1 ... done
Creating gpdb7_cdw_1  ... done
Attaching to gpdb7_sdw2_1, gpdb7_sdw1_1, gpdb7_cdw_1
sdw1_1  | ssh-keygen: generating new host keys: RSA1 RSA DSA ECDSA ED25519 
sdw2_1  | ssh-keygen: generating new host keys: RSA1 RSA DSA ECDSA ED25519 
cdw_1   | ssh-keygen: generating new host keys: RSA1 RSA DSA ECDSA ED25519 
cdw_1   | sdw_1
cdw_1   | PING sdw1_1 (172.21.0.3) 56(84) bytes of data.
cdw_1   | 64 bytes from gpdb7_sdw1_1.gpdb7_default (172.21.0.3): icmp_seq=1 ttl=64 time=0.046 ms
cdw_1   | 
cdw_1   | --- sdw1_1 ping statistics ---
cdw_1   | 1 packets transmitted, 1 received, 0% packet loss, time 0ms
cdw_1   | rtt min/avg/max/mdev = 0.046/0.046/0.046/0.000 ms
cdw_1   | Adding sdw1_1
cdw_1   | Warning: Permanently added 'sdw1_1,172.21.0.3' (ECDSA) to the list of known hosts.
cdw_1   |  13:49:01 up 35 min,  0 users,  load average: 0.74, 0.60, 0.43
cdw_1   | sdw_1
cdw_1   | PING sdw2_1 (172.21.0.2) 56(84) bytes of data.
cdw_1   | 64 bytes from gpdb7_sdw2_1.gpdb7_default (172.21.0.2): icmp_seq=1 ttl=64 time=0.162 ms
cdw_1   | 
cdw_1   | --- sdw2_1 ping statistics ---
cdw_1   | 1 packets transmitted, 1 received, 0% packet loss, time 0ms
cdw_1   | rtt min/avg/max/mdev = 0.162/0.162/0.162/0.000 ms
cdw_1   | Adding sdw2_1
cdw_1   | Warning: Permanently added 'sdw2_1,172.21.0.2' (ECDSA) to the list of known hosts.
cdw_1   |  13:49:01 up 35 min,  0 users,  load average: 0.74, 0.60, 0.43
cdw_1   | sdw_1
cdw_1   | ping: sdw3_1: Name or service not known
cdw_1   | .
cdw_1   | sdw_1
cdw_1   | ping: sdw4_1: Name or service not known
cdw_1   | .
cdw_1   | sdw_1
cdw_1   | ping: sdw5_1: Name or service not known
cdw_1   | .
cdw_1   | sdw_1
cdw_1   | ping: sdw6_1: Name or service not known
cdw_1   | .
cdw_1   | sdw_1
cdw_1   | ping: sdw7_1: Name or service not known
cdw_1   | .
cdw_1   | sdw_1
cdw_1   | ping: sdw8_1: Name or service not known
cdw_1   | .
cdw_1   | sdw_1
cdw_1   | ping: sdw9_1: Name or service not known
cdw_1   | .
cdw_1   | [STEP 1 of 5] create local ID and authorize on local host
cdw_1   |   ... /home/gpadmin/.ssh/id_rsa file exists ... key generation skipped
cdw_1   | 
cdw_1   | [STEP 2 of 5] keyscan all hosts and update known_hosts file
cdw_1   | 
cdw_1   | [STEP 3 of 5] retrieving credentials from remote hosts
cdw_1   |   ... send to sdw1_1
cdw_1   |   ... send to sdw2_1
cdw_1   | 
cdw_1   | [STEP 4 of 5] determine common authentication file content
cdw_1   | 
cdw_1   | [STEP 5 of 5] copy authentication files to all remote hosts
cdw_1   |   ... finished key exchange with sdw1_1
cdw_1   |   ... finished key exchange with sdw2_1
cdw_1   | 
cdw_1   | [INFO] completed successfully
cdw_1   | 20240403:13:49:03:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Environment variable $USER unset, will set to gpadmin
cdw_1   | 20240403:13:49:03:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Checking configuration parameters, please wait...
cdw_1   | 20240403:13:49:03:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Reading Greenplum configuration file /tmp/gpinitsystem.conf
cdw_1   | 20240403:13:49:03:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Locale has not been set in /tmp/gpinitsystem.conf, will set to default value
cdw_1   | 20240403:13:49:03:000076 gpinitsystem:cdw:gpadmin-[INFO]:-No DATABASE_NAME set, will exit following template1 updates
cdw_1   | 20240403:13:49:03:000076 gpinitsystem:cdw:gpadmin-[INFO]:-COORDINATOR_MAX_CONNECT not set, will set to default value 250
cdw_1   | 20240403:13:49:03:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Checking configuration parameters, Completed
cdw_1   | 20240403:13:49:03:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Commencing multi-home checks, please wait...
cdw_1   | ...
cdw_1   | 20240403:13:49:04:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Configuring build for standard array
cdw_1   | 20240403:13:49:04:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Commencing multi-home checks, Completed
cdw_1   | 20240403:13:49:04:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Building primary segment instance array, please wait...
cdw_1   | ......
cdw_1   | 20240403:13:49:07:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Checking Coordinator host
cdw_1   | 20240403:13:49:07:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Checking new segment hosts, please wait...
cdw_1   | ......
cdw_1   | 20240403:13:49:14:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Checking new segment hosts, Completed
cdw_1   | 20240403:13:49:14:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Building the Coordinator instance database, please wait...
cdw_1   | 20240403:13:49:14:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Starting the Coordinator in admin mode
cdw_1   | 20240403:13:49:16:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Commencing parallel build of primary segment instances
cdw_1   | 20240403:13:49:16:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Spawning parallel processes    batch [1], please wait...
cdw_1   | ......
cdw_1   | 20240403:13:49:16:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Waiting for parallel processes batch [1], please wait...
cdw_1   | ......
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:------------------------------------------------
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Parallel process exit status
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:------------------------------------------------
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Total processes marked as completed           = 6
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Total processes marked as killed              = 0
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Total processes marked as failed              = 0
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:------------------------------------------------
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Removing back out file
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:-No errors generated from parallel processes
cdw_1   | 20240403:13:49:22:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Restarting the Greenplum instance in production mode
cdw_1   | 20240403:13:49:22:005545 gpstop:cdw:gpadmin-[INFO]:-Starting gpstop with args: -a -l /home/gpadmin/gpAdminLogs -m -d /gpdata/master/gpseg-1
cdw_1   | 20240403:13:49:22:005545 gpstop:cdw:gpadmin-[INFO]:-Gathering information and validating the environment...
cdw_1   | 20240403:13:49:22:005545 gpstop:cdw:gpadmin-[INFO]:-Obtaining Greenplum Coordinator catalog information
cdw_1   | 20240403:13:49:22:005545 gpstop:cdw:gpadmin-[INFO]:-Obtaining Segment details from coordinator...
cdw_1   | 20240403:13:49:22:005545 gpstop:cdw:gpadmin-[INFO]:-Greenplum Version: 'postgres (Greenplum Database) 7.1.0+dev.209.g4e9334d build dev'
cdw_1   | 20240403:13:49:22:005545 gpstop:cdw:gpadmin-[INFO]:-Commencing Coordinator instance shutdown with mode='smart'
cdw_1   | 20240403:13:49:22:005545 gpstop:cdw:gpadmin-[INFO]:-Coordinator segment instance directory=/gpdata/master/gpseg-1
cdw_1   | 20240403:13:49:22:005545 gpstop:cdw:gpadmin-[INFO]:-Stopping coordinator segment and waiting for user connections to finish ...
cdw_1   | server shutting down
cdw_1   | 20240403:13:49:24:005545 gpstop:cdw:gpadmin-[INFO]:-Attempting forceful termination of any leftover coordinator process
cdw_1   | 20240403:13:49:24:005545 gpstop:cdw:gpadmin-[INFO]:-Terminating processes for segment /gpdata/master/gpseg-1
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Starting gpstart with args: -a -l /home/gpadmin/gpAdminLogs -d /gpdata/master/gpseg-1
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Gathering information and validating the environment...
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Greenplum Binary Version: 'postgres (Greenplum Database) 7.1.0+dev.209.g4e9334d build dev'
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Greenplum Catalog Version: '302307241'
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Starting Coordinator instance in admin mode
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-CoordinatorStart pg_ctl cmd is env GPSESSID=0000000000 GPERA=None $GPHOME/bin/pg_ctl -D /gpdata/master/gpseg-1 -l /gpdata/master/gpseg-1/log/startup.log -w -t 600 -o " -c gp_role=utility " start
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Obtaining Greenplum Coordinator catalog information
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Obtaining Segment details from coordinator...
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Setting new coordinator era
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Coordinator Started...
cdw_1   | 20240403:13:49:25:005708 gpstart:cdw:gpadmin-[INFO]:-Shutting down coordinator
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-Commencing parallel segment instance startup, please wait...
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-Process results...
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-----------------------------------------------------
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-   Successful segment starts                                            = 6
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-   Failed segment starts                                                = 0
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-   Skipped segment starts (segments are marked down in configuration)   = 0
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-----------------------------------------------------
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-Successfully started 6 of 6 segment instances 
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-----------------------------------------------------
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-Starting Coordinator instance cdw directory /gpdata/master/gpseg-1 
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-CoordinatorStart pg_ctl cmd is env GPSESSID=0000000000 GPERA=ffccdf55c4c1fcf3_240403134925 $GPHOME/bin/pg_ctl -D /gpdata/master/gpseg-1 -l /gpdata/master/gpseg-1/log/startup.log -w -t 600 -o " -c gp_role=dispatch " start
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-Command pg_ctl reports Coordinator cdw instance active
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-Connecting to db template1 on host localhost
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-No standby coordinator configured.  skipping...
cdw_1   | 20240403:13:49:28:005708 gpstart:cdw:gpadmin-[INFO]:-Database successfully started
cdw_1   | 20240403:13:49:28:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Completed restart of Greenplum instance in production mode
cdw_1   | 20240403:13:49:28:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Creating core GPDB extensions
cdw_1   | 20240403:13:49:29:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Importing system collations
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Scanning utility log file for any warning messages
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Log file scan check passed
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Greenplum Database instance successfully created
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-------------------------------------------------------
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-To complete the environment configuration, please 
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-update gpadmin .bashrc file with the following
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-1. Ensure that the greenplum_path.sh file is sourced
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-2. Add "export COORDINATOR_DATA_DIRECTORY=/gpdata/master/gpseg-1"
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-   to access the Greenplum scripts for this instance:
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-   or, use -d /gpdata/master/gpseg-1 option for the Greenplum scripts
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-   Example gpstate -d /gpdata/master/gpseg-1
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Script log file = /home/gpadmin/gpAdminLogs/gpinitsystem_20240403.log
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-To remove instance, run gpdeletesystem utility
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-To initialize a Standby Coordinator Segment for this Greenplum instance
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Review options for gpinitstandby
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-------------------------------------------------------
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-The Coordinator /gpdata/master/gpseg-1/pg_hba.conf post gpinitsystem
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-has been configured to allow all hosts within this new
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-array to intercommunicate. Any hosts external to this
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-new array must be explicitly added to this file
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-Refer to the Greenplum Admin support guide which is
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-located in the /usr/local/gpdb/docs directory
cdw_1   | 20240403:13:49:32:000076 gpinitsystem:cdw:gpadmin-[INFO]:-------------------------------------------------------
cdw_1   | ALTER ROLE
cdw_1   | 20240403:13:49:33:006272 gpstop:cdw:gpadmin-[INFO]:-Starting gpstop with args: -a
cdw_1   | 20240403:13:49:33:006272 gpstop:cdw:gpadmin-[INFO]:-Gathering information and validating the environment...
cdw_1   | 20240403:13:49:33:006272 gpstop:cdw:gpadmin-[INFO]:-Obtaining Greenplum Coordinator catalog information
cdw_1   | 20240403:13:49:33:006272 gpstop:cdw:gpadmin-[INFO]:-Obtaining Segment details from coordinator...
cdw_1   | 20240403:13:49:33:006272 gpstop:cdw:gpadmin-[INFO]:-Greenplum Version: 'postgres (Greenplum Database) 7.1.0+dev.209.g4e9334d build dev'
cdw_1   | 20240403:13:49:33:006272 gpstop:cdw:gpadmin-[INFO]:-Commencing Coordinator instance shutdown with mode='smart'
cdw_1   | 20240403:13:49:33:006272 gpstop:cdw:gpadmin-[INFO]:-Coordinator segment instance directory=/gpdata/master/gpseg-1
cdw_1   | 20240403:13:49:33:006272 gpstop:cdw:gpadmin-[INFO]:-Stopping coordinator segment and waiting for user connections to finish ...
cdw_1   | server shutting down
cdw_1   | 20240403:13:49:34:006272 gpstop:cdw:gpadmin-[INFO]:-Attempting forceful termination of any leftover coordinator process
cdw_1   | 20240403:13:49:34:006272 gpstop:cdw:gpadmin-[INFO]:-Terminating processes for segment /gpdata/master/gpseg-1
cdw_1   | 20240403:13:49:36:006272 gpstop:cdw:gpadmin-[INFO]:-No standby coordinator host configured
cdw_1   | 20240403:13:49:36:006272 gpstop:cdw:gpadmin-[INFO]:-Targeting dbid [2, 3, 4, 5, 6, 7] for shutdown
cdw_1   | 20240403:13:49:36:006272 gpstop:cdw:gpadmin-[INFO]:-Commencing parallel segment instance shutdown, please wait...
cdw_1   | 20240403:13:49:36:006272 gpstop:cdw:gpadmin-[INFO]:-0.00% of jobs completed
cdw_1   | 20240403:13:49:38:006272 gpstop:cdw:gpadmin-[INFO]:-100.00% of jobs completed
cdw_1   | 20240403:13:49:38:006272 gpstop:cdw:gpadmin-[INFO]:-----------------------------------------------------
cdw_1   | 20240403:13:49:38:006272 gpstop:cdw:gpadmin-[INFO]:-   Segments stopped successfully      = 6
cdw_1   | 20240403:13:49:38:006272 gpstop:cdw:gpadmin-[INFO]:-   Segments with errors during stop   = 0
cdw_1   | 20240403:13:49:38:006272 gpstop:cdw:gpadmin-[INFO]:-----------------------------------------------------
cdw_1   | 20240403:13:49:38:006272 gpstop:cdw:gpadmin-[INFO]:-Successfully shutdown 6 of 6 segment instances 
cdw_1   | 20240403:13:49:38:006272 gpstop:cdw:gpadmin-[INFO]:-Database successfully shutdown with no errors reported
cdw_1   | 20240403:13:49:38:006779 gpstart:cdw:gpadmin-[INFO]:-Starting gpstart with args: -a
cdw_1   | 20240403:13:49:38:006779 gpstart:cdw:gpadmin-[INFO]:-Gathering information and validating the environment...
cdw_1   | 20240403:13:49:38:006779 gpstart:cdw:gpadmin-[INFO]:-Greenplum Binary Version: 'postgres (Greenplum Database) 7.1.0+dev.209.g4e9334d build dev'
cdw_1   | 20240403:13:49:38:006779 gpstart:cdw:gpadmin-[INFO]:-Greenplum Catalog Version: '302307241'
cdw_1   | 20240403:13:49:38:006779 gpstart:cdw:gpadmin-[INFO]:-Starting Coordinator instance in admin mode
cdw_1   | 20240403:13:49:38:006779 gpstart:cdw:gpadmin-[INFO]:-CoordinatorStart pg_ctl cmd is env GPSESSID=0000000000 GPERA=None $GPHOME/bin/pg_ctl -D /gpdata/master/gpseg-1 -l /gpdata/master/gpseg-1/log/startup.log -w -t 600 -o " -c gp_role=utility " start
cdw_1   | 20240403:13:49:39:006779 gpstart:cdw:gpadmin-[INFO]:-Obtaining Greenplum Coordinator catalog information
cdw_1   | 20240403:13:49:39:006779 gpstart:cdw:gpadmin-[INFO]:-Obtaining Segment details from coordinator...
cdw_1   | 20240403:13:49:39:006779 gpstart:cdw:gpadmin-[INFO]:-Setting new coordinator era
cdw_1   | 20240403:13:49:39:006779 gpstart:cdw:gpadmin-[INFO]:-Coordinator Started...
cdw_1   | 20240403:13:49:39:006779 gpstart:cdw:gpadmin-[INFO]:-Shutting down coordinator
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-Commencing parallel segment instance startup, please wait...
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-Process results...
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-----------------------------------------------------
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-   Successful segment starts                                            = 6
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-   Failed segment starts                                                = 0
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-   Skipped segment starts (segments are marked down in configuration)   = 0
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-----------------------------------------------------
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-Successfully started 6 of 6 segment instances 
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-----------------------------------------------------
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-Starting Coordinator instance cdw directory /gpdata/master/gpseg-1 
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-CoordinatorStart pg_ctl cmd is env GPSESSID=0000000000 GPERA=ffccdf55c4c1fcf3_240403134939 $GPHOME/bin/pg_ctl -D /gpdata/master/gpseg-1 -l /gpdata/master/gpseg-1/log/startup.log -w -t 600 -o " -c gp_role=dispatch " start
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-Command pg_ctl reports Coordinator cdw instance active
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-Connecting to db template1 on host localhost
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-No standby coordinator configured.  skipping...
cdw_1   | 20240403:13:49:41:006779 gpstart:cdw:gpadmin-[INFO]:-Database successfully started
```
