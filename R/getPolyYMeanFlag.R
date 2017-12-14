#
#
#
#
getPolyYMeanFlag=function(tFlag,tpolyFl,biweekAvFl,pntlayer,ridF="rid",siteid="ID2",yearF="year"){
  conn=RSclient::RS.connect(host="noxchs2.usc.edu",port =5501)
  RSclient::RS.assign(conn,"tFlag",tFlag)
  RSclient::RS.assign(conn,"tpolyFl",tpolyFl)
  RSclient::RS.assign(conn,"biweekAvFl",biweekAvFl)
  RSclient::RS.assign(conn,"pntlayer",pntlayer)
  RSclient::RS.assign(conn,"ridF",ridF)
  RSclient::RS.assign(conn,"siteid",siteid)
  RSclient::RS.assign(conn,"yearF",yearF)
  means=RSclient::RS.eval(conn,getYearlyMean(tFlag,tpolyFl,biweekAvFl,pntlayer,ridF,siteid,yearF))
  RSclient::RS.close(conn)
  return(means)
}
