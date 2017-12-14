

#Constrained Optimization Results for Nox
## getPredictionTimeSeries2=function(no2x_season_trends,asite_dt,predId="preno2")

conOptNox=function(no2x_season_trends,asite_dt,no2Series,predId="prenox",no2Id="sim"){
  ## asite_dt=asite_d ; no2Series=tseries_no2;predId="prenoxM" ;no2Id="sim"
  #use output from previous function to ensure that nox > no2
  asite_dt1=asite_dt[which(asite_dt[,predId]>0),]
  basis_tindex=match(asite_dt1$biweekid,no2x_season_trends$biweekid)
  lmdset=data.frame(biweekid=asite_dt1$biweekid,b0=rep(1,nrow(asite_dt1)),
                    b1=no2x_season_trends[basis_tindex,"noxV1"],
                    b2=no2x_season_trends[basis_tindex,"noxV2"],
                    nox_m=log(asite_dt1[,predId]))

  lc_A=as.matrix(lmdset[,c("b0","b1","b2")])
  lc_B=as.vector(lmdset$nox_m)
  lc_G=matrix(nrow=6,ncol=3,byrow=TRUE,data=c(1,0,0,  0,-1,0,  -1,0,0,  0,1,0,  0,0,1,  0,0,-1))
  lc_H=c(0,0.05,-5.1,-0.91,-0.4,-0.5)
  for(j in c(1:nrow(no2x_season_trends))){
    arow=c(1,no2x_season_trends[j,"noxV1"],no2x_season_trends[j,"noxV2"])
    lc_G=rbind(lc_G,arow)
    lc_H=c(lc_H,log(no2Series[which(no2Series$start_date==no2x_season_trends[j,"s_date"]),no2Id]))
  }

  for(j in c(1:nrow(no2x_season_trends))){
    arow=c(-1,-no2x_season_trends[j,"noxV1"],-no2x_season_trends[j,"noxV2"])
    lc_G=rbind(lc_G,arow)
    lc_H=c(lc_H,-log(3000))
  }

  years=as.numeric(format(no2x_season_trends$s_date,'%Y'))
  start_year=min(years)
  end_year=max(years)
  fromDt=as.Date("1992-01-01")
  start_date=as.Date(paste(start_year,"-01-01",sep=""))
  end_date=as.Date(paste(end_year,"-01-01",sep=""))
  bkId1=as.numeric(floor((start_date-fromDt)/14)+1)
  bkId2=as.numeric(floor((end_date-fromDt)/14)+1)
  ## no2x_season_trends$bbiwkId=as.numeric(no2x_season_trends$s_date-fromDt)/14+1
  bkId1=as.numeric(floor((start_date-fromDt)/14)+1)
  bkId2=as.numeric(floor((end_date-fromDt)/14)+1)
  arow=c(0,no2x_season_trends[bkId1,"noxV1"]-no2x_season_trends[bkId2,"noxV1"],
         no2x_season_trends[bkId1,"noxV2"]-no2x_season_trends[bkId2,"noxV2"])
  if(!is.na(arow[2]) && !is.na(arow[3])){
    lc_G=rbind(lc_G,arow)
    lc_H=c(lc_H,0)
  }
  try_res=try((lm_cons=limSolve::lsei(A =lc_A, B =lc_B, G =lc_G, H=lc_H,type=2)),silent=T)
  if(class(try_res)=="try-error"){
    return(NULL)
  }
  beta_para=data.frame(b0=lm_cons$X["b0"],b1=lm_cons$X["b1"],  b2=lm_cons$X["b2"])
  series=exp(beta_para[1,"b0"]+beta_para[1,"b1"]*no2x_season_trends$noxV1
             +beta_para[1,"b2"]*no2x_season_trends$noxV2)
  return(list(bpara=beta_para,series=data.frame(start_date=no2x_season_trends$s_date,sim=series)))
}
