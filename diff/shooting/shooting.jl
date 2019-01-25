#y''+μ^2y=0
#y(0)=0, y(1)=1
#
#初期条件に書き換えると
#y(0)=0, y'(0)=1
#一次に変形すると
#z=y', z'+μ^2y=0 

function yc(y,μ,N,x)#離散の座標を連続の関数に近似
  flag=2
  for i in 2:100
    if μ[i]>x
      flag=i
      break
    end
  end
  println(flag)
  println( (y[N,flag]-y[N,flag-1])/(μ[flag]-μ[flag-1])*(x-μ[flag-1])+y[N,flag-1] )
  return (y[N,flag]-y[N,flag-1])/(μ[flag]-μ[flag-1])*(x-μ[flag-1])+y[N,flag-1]
end

function shooting(N=50)#N:オイラー法の分割数
  h=1/(N-1)
  x=[i for i in 0:h:1] #区間[0,1]をN等分
  μ=[i for i in 0.1:0.1:10]
  y=zeros(N,length(μ))
  z=zeros(N,length(μ))

  for i in 1:length(μ)
    y[1,i]=0
    z[1,i]=1
  end
  for j in 1:length(μ)  #μの値を変化させながらすべてのμについて初期値問題を解く
    for i in 2:N  #初期値問題を解く 
      y[i,j]=y[i-1,j]+h*z[i-1,j]
      z[i,j]=z[i-1,j]-h*μ[j]^2*y[i-1,j]
    end
  end
  plot(μ,y(N,:))

  #ここから割線法で(μ,y[μ,N])においてy[μ,N]=0となるμを求める
  #グラフから初期値を推測する
  x=zeros(50,3)
  x[1,1]=2.5
  x[2,1]=1.0
  x[1,2]=5.0
  x[2,2]=7.0
  x[1,3]=9.0
  x[2,3]=9.7
  for j in 1:3
    for i in 2:50
      #y(μ)がμの刻み幅0.1の離散的な値しか存在しないので線分で近似する
      if abs(yc(y,μ,N,x[i,j]))<1.0e-6
        break
      end
      x[i+1,j]=(x[i,j]*yc(y,μ,N,x[i-1,j])-x[i-1,j]*yc(y,μ,N,x[i,j]))/(yc(y,μ,N,x[i-1,j])-yc(y,μ,N,x[i,j]))
    end
  end
  print(x)
end 
