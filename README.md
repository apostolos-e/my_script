# Linux Script

<h2>General:</h2>
<p>This repo includes scripts to setup a machine to log some system info.</p>

<h5>In more detail:</h5>
<p>The script (script.sh) has two versions. You can either choose to run it with the -f parameter or with the -s parameter.
<ol>
<li>
  Running it with the -f parameter followed by a filename, the script will create a file with the specified name under the /home/user directory and every 10 seconds it will log the following info: <b>Date/Time, Average system load, Memory utilization, Available disk space and the Number of zombie processes running on the system</b>.</p>
</li>
<li>
   Running it with the -s parameter followed by a path, the script will create a file under the specified location and it will log the same info once.
</li>
</ol>
</p>

<p>You can use the second version of the script with the configuration file (cron_config) provided in the repo to schedule the logging process with the cron service. After doing that, you can also use the logrotate service (logrotate.conf,rotation_script.sh) to rotate the files daily.</p>

<h2>Installation guide</h2>
<p>
  To setup the cron service:
  <ol>
    <li>Run the: <b>sudo crontab -u root -e</b> command in the terminal. </li>
    <li>Choose an editor (First time run only). </li>
    <li>Replace the contents of the file with these inside the cron_config file provided. </li>
    <li>Save the file and exit the editor. </li>
    <li>And you are ready. </li>
  </ol>
</p>

<p>
  To setup the rotation service:
    <ol>
    <li>Run the rotation_script.sh through the repo folder in your machine. </li>
    <li>That's it!</li>
  </ol>
</p>

<h2>Syntax:</h2>
<p>
<b>Version 1:</b> ./script.sh -f filename</br>
<b>Version 2:</b> ./script.sh -s file_path</br>
<b>Rotation script:</b> ./rotation_script.sh
</p>


