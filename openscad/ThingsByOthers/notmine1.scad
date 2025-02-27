module manyballs(n)
{
    $fn=25;
    delta = 45;
    for(i=[0:1:n-1]) {
       x = i*delta;
       for(j=[0:1:n-1]) {
          y = j*delta;
          for(k=[0:1:n-1]) {
             z = k*delta;
             translate([x,y,z])sphere(25);
          }
       }
    }
}

manyballs(n=7); 
