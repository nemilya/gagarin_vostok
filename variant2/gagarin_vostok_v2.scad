// http://kik-sssr.ru/Hist_3_Vostok.htm
// коффициент "плавности" поверхностей, 
// чем выше - тем дольше расчёт
$fn=50;

// основание
translate([0, 0, -25])
  cylinder(25, d1=10, d2=56, $fn=10);

// переход на сферу
cylinder(23, d1=55, d2=30);

// люк, иллюминатор
translate([0, 0, 40]){
    difference(){
    // сфера
    sphere(d=50);
    // люк, поворачиваем и "вычитаем"
    rotate(a=50, v=[1,0,0]){
      translate([0, 0, 20])
        // сам люк
        cylinder(10, 12, 12);
     }
    // иллюминатор смотрит на Землю
    rotate(a=180, v=[0,0,1])
      rotate(a=90, v=[1,0,0]){
      translate([0, 0, 22])
        // сам иллюминатор
        cylinder(5, 5, 5);
     }
  }
}


// шарики по периметру
// радиус окружности по которой будут размещаться шарики

$r=20;
// угол поворота, от 0 до 360, шагом 45/2
for ($a = [0:45/2:360-45/2]){
  // высчитываем x и y координаты и
  // поднимаем на 19.5 вверх (z)
  translate([cos($a)*$r, sin($a)*$r, 19.5])
  {
    // один шарик
    sphere(r=4, $fn=30);
  }
}
// "поддержка" снизу для шариков
cylinder(16, d1=0, d2=46);
