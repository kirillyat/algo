program genetic;

{
    ищем максимум
    Критерий останова: выполнение заданного числа итераций
    Турнирная селекция
    Одноточечное скрещивание
    Мутация реверс
}


const
    n = 12;         {Число особей}
    OSTANOV = 4000;  {Проходов до остановы}
    EXACT = 16384;  {Точность}
    v1 = 0.30;

type
    ArrF = array[1..n] of real;            {Значения функции}
    individ = array[1..n] of integer;      {Двоичная запись одного гена}
    population = array[1..n] of individ;   {Массив все генов}

var
    pop: population;
    mx: real;


function F(x: real): real;
begin
    F := (x-2)*(x-2.5)*(x-3)*(x-3.5)*(1-exp(x-1.5))*ln(x+0.5);
end;


procedure dec2bin(x: real; var a: individ);
var i: integer;
begin
    case trunc(x) of
        1: begin a[1] := 0; a[2] := 1; end;
        2: begin a[1] := 1; a[2] := 0; end;
        3: begin a[1] := 1; a[2] := 1; end;
    end;
    x := x - trunc(x);
    for i := 3 to n do begin
        a[i] := trunc(2 * x);
        x := 2 * x - trunc(2 * x);
    end;
end;


function rand(x: real): boolean;
begin
  if x=0 then rand:=false else rand := random(maxint)/maxint < x;
end;


function pow(a : real; b : integer): real;
var p : real;
    i: integer;
begin
    p := 1;
    if b = 0 then pow := 1
    else if b > 0 then
        for i := 1 to b do begin
            p := p*a;
            pow := p;
        end
    else pow := 1/pow(a, -b);
end;


function bin2dec(a: individ): real;
var
    i: integer;
    x: real;
begin
    x := 2*a[1] + a[2];
    for i := 3 to n do
        x := x + a[i]*pow(2, 2-i);

    bin2dec := x;
end;


{Одноточечное скрещивание}
procedure crossbreeding(var A, B, C, D : individ);
var
    k : integer;
    i: integer;

begin
    randomize;
    k := random(n);
    for i:=1 to n do
        if i<=k then begin
            C[i] := A[i];
            D[i] := B[i];
        end
        else begin
            C[i] := B[i];
            D[i] := C[i];
        end;
end;



{Скрещивание}
procedure cross(var Pop: population);
    var i, l, s: integer;
    newpop : population;
begin
    for i:=1 to (n div 2) do
        crossbreeding(pop[random(3)+1], pop[2*i-1], newpop[2*i], newpop[2*i - 1]);
    for i:=1 to n do
        if F(bin2dec(pop[i])) < F(bin2dec(newpop[i])) then
            for l := 1 to n do
                pop[i][l] := newpop[i][l];
end;



{Мутация реверс}
procedure mutation(var pop: population);
var i, j, k, c : integer;
begin
    for i:=1 to n do begin
        randomize;
        k := random(n-1);
        if rand(i/n) then
          for j:= k to ((n+k) div 2) do begin
              c := pop[i][j];
              pop[i][j] := pop[i][n - j + k];
              pop[i][ n - j + k] := c;
        end;
    end;
end;



procedure selection(var pop: population);
var
    i, j, s, l: integer;

begin
    for i := 1 to n div 2 do
        for j := i + 1 to n do
            if F(bin2dec(pop[i])) < F(bin2dec(pop[j])) then begin
                for l := 1 to n do begin
                    s := pop[i][l];
                    pop[i][l] := pop[j][l];
                    pop[j][l] := s;
                end;
            end;
end;





procedure INIT(var pop: population);
    var i : integer;
begin
    randomize;
    for i := 1 to n do begin
        dec2bin(4*random(maxint)/maxint, pop[i]);
    end;

end;




procedure loop (var pop : population; var mx : real);
var i, j, w: integer;
begin
    for i:=1 to 100 do begin {это по количеству итераций болшая погрешность}
        selection(pop);
        cross(pop);
        mutation(pop);
        w:=1;
        for j:=1 to n do
          if F(bin2dec(pop[j]))>F(bin2dec(pop[w])) then
              w:=j;

        if F(bin2dec(pop[w]))>F(mx) then
            mx := bin2dec(pop[w]);

    end;
    if F(mx) < 1.6 then begin
      INIT(pop);
      loop(pop, mx);
    end;
end;









begin

    {
      Ответ
      x:= 0.779822;
      y:= 1.605418;
    }

    randomize;

    INIT(pop);

    mx := bin2dec(pop[1]);

    loop(pop, mx);
    writeln('x=', mx:3:6,' y=',F(mx):3:6);



end.
