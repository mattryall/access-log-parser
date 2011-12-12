### Access log parser

Takes an [Apache log format pattern](http://httpd.apache.org/docs/2.0/mod/mod_log_config.html) on the command line and the log files in Apache common log format on stdin:

    $ cat logs/* | access-log-parser.pl "%t %h %m %s %T %U" | head
    [31/Mar/2010:23:59:59 -0500] 59.167.164.33 GET 200 1364826 /sr/jira.issueviews:searchrequest-rss/13991/SearchRequest-13991.xml?tempMax=100
    [31/Mar/2010:23:59:59 -0500] 59.167.164.33 GET 200 2613818 /sr/jira.issueviews:searchrequest-rss/13990/SearchRequest-13990.xml?tempMax=100
    [31/Mar/2010:23:59:59 -0500] 59.167.164.33 GET 200 3129748 /sr/jira.issueviews:searchrequest-comments-rss/13991/SearchRequest-13991.xml?tempMax=100
    [01/Apr/2010:00:00:04 -0500] 216.75.233.106 GET 304 1670 /download/resources/support-resources:web/support/images/level2.png
    [31/Mar/2010:23:59:59 -0500] 59.167.164.33 GET 200 4828897 /sr/jira.issueviews:searchrequest-comments-rss/13990/SearchRequest-13990.xml?tempMax=100
    [01/Apr/2010:00:00:04 -0500] 216.75.233.106 GET 304 1572 /download/resources/support-resources:web/support/images/level3.png
    [01/Apr/2010:00:00:04 -0500] 216.75.233.106 GET 304 1616 /download/resources/support-resources:web/support/images/level4.png
    [01/Apr/2010:00:00:06 -0500] 202.169.29.34 GET 200 1297942 /sr/jira.issueviews:searchrequest-printable/14712/SearchRequest-14712.html?tempMax=100
    [01/Apr/2010:00:00:07 -0500] 202.169.29.34 GET 200 2147 /styles/global.css
    [01/Apr/2010:00:00:12 -0500] 202.169.29.34 GET 200 64302 /secure/Dashboard.jspa?selectPageId=12415


