#y''+μ^2y=0
#y(0)=0, y(1)=1
#
#初期条件に書き換えると
#y(0)=0, y'(0)=1
#一次に変形すると
#z=y', z'+μ^2y=0 

function mu_euler(N=50)#N:オイラー法の分割数
  h=1/(N-1)
  x=[i for i in 0:h:1] #区間[0,1]をN等分
  y=zeros(N,3)
  z=zeros(N,3)
  μ=[3.14654,6.31791,9.54256]
  for i in 1:3
    y[1,i]=0
    z[1,i]=1
  end
  for j in 1:3
    for i in 2:N  #初期値問題を解く 
      y[i,j]=y[i-1,j]+h*z[i-1,j]
      z[i,j]=z[i-1,j]-h*μ[j]^2*y[i-1,j]
    end
  end

  return x,y[:,1],y[:,2],y[:,3]

end 
