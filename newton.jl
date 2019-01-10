const MAX=10000
x=[0.0 for i in 1:MAX]

f(x)=x^3-3
df(x)=3x^2
x[1]=2.0

for i in 2:MAX
  Fx=f(x[i-1])
  DFx=df(x[i-1])
  x[i]=x[i-1]-Fx/DFx
  
  println("x$([i-1])=$(x[i-1]), f(x[$(i-1)])=$(Fx), f'(x[$(i-1)])=$(DFx), x[$(i)]=$(x[i])")

  if abs(x[i]-x[i-1])<10^(-4)
    break;
  end
end
