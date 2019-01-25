function euler(f, x0, y0, ;h=0.5, N=100) #f(x,y):関数(dy/dx), x0 y0:初期値, h:刻み幅, N:点の数
  x=[x0+i for i in 0:h:(N-1)h]
  y=zeros(N)
  y[1]=y0

  for i in 1:N-1
    y[i+1]=y[i]+h*f(x[i],y[i])
  end
  
  return x,y

end
