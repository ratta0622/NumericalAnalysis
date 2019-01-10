function vander_euler(h=0.5, N=100, μ=10.0, x0=1.0, v0=0.0) #h:刻み幅, N:点の数, μ:Vanderporの式の中の定数

  x=zeros(N)
  v=zeros(N) #v=dx/dt

  x[1]=1.0
  v[1]=0.0

  for i in 1:N-1
    x[i+1]=x[i]+h*v[i]
    v[i+1]=(1+h*μ*(1-(x[i])^2))*v[i]-h*x[i]
  end
  
  t=[i for i in 0:h:(N-1)h]

  return t,x,v

end

#(t,x,v)=vander_euler()

#println(t)
#println(x)
