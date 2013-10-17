def gcd(u, v)
  u, v = u.abs, v.abs
 #while v == 0
  while v != 0
    u, v = v, u % v
  end
  u
end

puts gcd(6,3)
#Pruebas adicionales
puts gcd(5,2)
puts gcd(6,20)
