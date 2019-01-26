with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

procedure Myloop is
    i,k : float;
    j : float := 15.0;
begin
    k := (j + 13.0) / 27.0;
    while k <= 10.0 loop
        k := k + 1.2;
        i := 3.0 * k - 1.0;
        Put("i = ");
        Put(i);
        New_Line(1);
        Put("k = ");
        Put(k);
        New_Line(1);
        Put("j = ");
        Put(j);
        New_Line(1);
    end loop;
end Myloop;

