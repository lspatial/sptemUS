

weiA2EnsFlag=function(flag,pol="no2",preF="preno2",idF="geoid_latlongt",dateF="s_date"){
  #
  conn=RSclient::RS.connect(host="noxchs2.usc.edu",port =5501)
  RSclient::RS.assign(conn,"flag",flag)
  RSclient::RS.assign(conn,"pol",pol)
  RSclient::RS.assign(conn,"preF",preF)
  RSclient::RS.assign(conn,"idF",idF)
  RSclient::RS.assign(conn,"dateF",dateF)
  res=RSclient::RS.eval(conn,predict_srv(flag=flag,pol=pol, preStr=preF,idStr=idF,dateStr=dateF))
  RSclient::RS.close(conn)
  return(res)
}
