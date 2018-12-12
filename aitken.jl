const N=1000000

Sn(n)=sum([(-1)^k/(2k+1) for k=0:n]) #収束の遅いnumber series

S_real=π/4 #theoretical value
S_slow=Sn(N) #slow number series
err1=abs(S_real-S_slow)

S=zeros(100,100)

for n=0:10
  global m
  m=n+1
  S[m,1]=Sn(n) #1列目の計算
  global err2
  err2=abs(S[m,1]-S_real)
  for k=0:(div(n,2)-1) #2列目以降は1列目の要素が十分にないと計算できない
    if err2<=err1
      break
    end
    global h
    h=k+1 #列指定
    m=m-1 #要素が計算されている1列目の下から2つめを選ぶ
    S[m,h+1]=(S[m+1,h]*S[m-1,h]-S[m,h]^2)/(S[m+1,h]+S[m-1,h]-2*S[m,h])
    err2=abs(S[m,h+1]-S_real) #誤差の更新
  end
  if err2<=err1
    break
  end
end

println(S)

println("error1=",err1)
println("error2=",err2)
println("S_real=",S_real)
println("S_slow=",S_slow)
println("S(",m-1,",",h,")",S[m,h+1])
