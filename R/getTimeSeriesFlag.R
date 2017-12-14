

getTimeSeriesFlag=function(tFlag,tbasisFl,sublocs,biweekid="biweekid"){
  conn=RSclient::RS.connect(host="noxchs2.usc.edu",port =5501)
  RSclient::RS.assign(conn,"tFlag",tFlag)
  RSclient::RS.assign(conn,"tbasisFl",tbasisFl)
  RSclient::RS.assign(conn,"sublocs",sublocs)
  RSclient::RS.assign(conn,"biweekid",biweekid)
  merged=RSclient::RS.eval(conn,getTimeSeries(tFlag,tbasisFl,sublocs,biweekid))
  RSclient::RS.close(conn)
  return(merged)
}
