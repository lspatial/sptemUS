

getTrainCov=function(flag,acov){
  #
  conn=RSclient::RS.connect(host="noxchs2.usc.edu",port =5501)
  RSclient::RS.assign(conn,"flag",flag)
  RSclient::RS.assign(conn,"acov",acov)
  res=RSclient::RS.eval(conn,getTrainCovSrv(flag=flag,acov=acov))
  RSclient::RS.close(conn)
  return(res)
}


getTSeries=function(flag){
  #
  conn=RSclient::RS.connect(host="noxchs2.usc.edu",port =5501)
  RSclient::RS.assign(conn,"flag",flag)
  res=RSclient::RS.eval(conn,getTSeriesSrv(flag=flag))
  RSclient::RS.close(conn)
  return(res)
}
