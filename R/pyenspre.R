

pyenspre=function(flag,pol="no2", preStr="preno2",idStr="geoid_latlongt",dateStr="s_date" ){
  sublocs_prj=spTransform(sublocs,"+proj=longlat +datum=WGS84")
  conn=RSclient::RS.connect(host="noxchs2.usc.edu",port =5501)
  RSclient::RS.assign(conn,"sublocs_prj",sublocs_prj)
  resRSclient::RS.eval(conn,predict_srv(flag,pol, preStr,idStr,dateStr="s_date"))
  RS.close(conn)
}
