with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Myloop is
    i,k : integer;
    j : integer := 15;
begin
    k := (j + 13) / 27;
    while k <= 10 loop
        k := k + 1;
        i := 3 * k - 1;
        Put("i = ");
        Put(i);
        New_Line(1);
        Put("j = ");
        Put(j);
        New_Line(1);
        Put("k = ");
        Put(k);
        New_Line(1);
    end loop;
end Myloop;
