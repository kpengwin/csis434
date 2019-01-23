with Ada.Text_IO;
use Ada.Text_IO;

procedure Looper is
    i,k : integer;
    j : integer := 15;
begin
    Put_Line("Hello, world!");
    New_Line;
    Put_Line("I am an Ada program with package use.");
    while k <= 10 loop
        Put_Line("meh");
        k := k + 1;
    end loop;
end Looper;