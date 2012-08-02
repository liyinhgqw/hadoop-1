<%@ page
  contentType="text/html; charset=UTF-8"
  import="javax.servlet.*"
  import="javax.servlet.http.*"
  import="java.io.*"
  import="java.util.*"
  import="java.net.*"
  import="org.apache.hadoop.hdfs.*"
  import="org.apache.hadoop.hdfs.server.namenode.*"
  import="org.apache.hadoop.hdfs.server.datanode.*"
  import="org.apache.hadoop.hdfs.server.common.*"
  import="org.apache.hadoop.hdfs.protocol.*"
  import="org.apache.hadoop.io.*"
  import="org.apache.hadoop.conf.*"
  import="org.apache.hadoop.net.DNS"
  import="org.apache.hadoop.security.token.Token"
  import="org.apache.hadoop.hdfs.security.token.block.BlockTokenIdentifier"
  import="org.apache.hadoop.util.*"
  import="org.apache.hadoop.net.NetUtils"
  import="org.apache.hadoop.security.UserGroupInformation"
  import="org.apache.hadoop.http.HtmlQuoting"
  import="java.text.DateFormat"
%>

<html>
  <head>
    <title>Stacktrace</title>
</head>
<body>
  <pre>
<% 
 Map<Thread, StackTraceElement[]> all = Thread.getAllStackTraces();
 for (Thread t : all.keySet()) {
   out.println(t.getName());
   StackTraceElement[] elem = all.get(t);
   for (StackTraceElement e: elem) {
     out.println(String.format("%s.%s %s:%d", e.getClassName(), e.getMethodName(), e.getFileName(), e.getLineNumber()));
   }
 }
%>

</pre>
</body>
</html>
