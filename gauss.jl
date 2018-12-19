#solve linear equation by Gaussian elimination
#input:   A:(n,n)matrix
#         b:(n,1)vector
#output:  x:(n,1)vector
function gaussian_elim(A,b)
  
(m,n)=size(A)

if m!=n && m==size(b)
  println("matrix must be square")
  exit(1)
end
x=zeros(n,1) #initialize

for i=1:n-1
  maxline=argmax(A[i:n,:])[1] #最大値を含む行A[i:n,:]のmaxline行目なのでAのmaxline+i-1行目
  
  if maxline>1 #行を入れ替える必要がある場合
    #i行目とmaxline+i-1(最大値を含む行)を入れ替える
    tmp1=A[i,:]
    tmp2=b[i]
    A[i,:]=A[maxline+i-1,:]
    b[i]=b[maxline+i-1]
    A[maxline+i-1,:]=tmp1
    b[maxline+i-1]=tmp2
  end

  for h=i+1:n #i+1行目以降に対して掃き出し法を適用
    rate=A[h,i]/A[i,i]
    A[h,:]=A[h,:]-rate*A[i,:]
    b[h]=b[h]-rate*b[i]
  end
end

x[n]=b[n]/A[n,n]

for i=n-1:-1:1
#  println(A[i:i,i+1:n])
#  println(typeof(A[i:i,i+1:n]*x[i+1:n,1]))
#  println(typeof(b[i]))
#  b[i]-A[i:i,i+1:n]*x[i+1:n,1]
#  println(typeof(A[i,i+1:n]))
#  println(typeof(A[i,i+1:n]'))
#  println(typeof(x[i+1:n,1]))
#  println(typeof(A[i,i+1:n]'*x[i+1:n,1]))
  x[i]=(b[i]-A[i,i+1:n]'*x[i+1:n,1])/A[i,i] #A[i,i+1:n]が一次元の配列になってしまい横ベクトルになってしまうので転置している
  #  x[i]=(b[i]-A[i:i,i+1:n]*x[i+1:n,1])/A[i,i] #A[i,i+1:n]ではなくA[i:i,i+1:n]と書くことで次元を落とさない と思ったがこれだと要素1の配列になってしまいb[i]-A[i:i,i+1:n]*x[i+1:n,1]が計算できない
 
end  


return x

end

#A=[1.0 100 3; 1 3 4; 50 1 3]
#b=[4.0 3 2]
#x=gaussian_elim(A,b)
#println(x)
