library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

package arithmetic_pkg is

	function clog2(arg: natural) return natural;
	
	function dividor_round_to_ceil(divisor	: integer; dividend : integer) return integer;

end package arithmetic_pkg;

package body arithmetic_pkg is
	function clog2(arg: natural) return natural is
    begin
        if    arg <= 1 then return 0;
        elsif arg <= 2 then return 1;
        elsif arg <= 4 then return 2;
        elsif arg <= 8 then return 3;
        elsif arg <= 16 then return 4;
        elsif arg <= 32 then return 5;
        elsif arg <= 64 then return 6;
        elsif arg <= 128 then return 7;
        elsif arg <= 256 then return 8;
        elsif arg <= 512 then return 9;
        elsif arg <= 1024 then return 10;
        elsif arg <= 2048 then return 11;
        elsif arg <= 4096 then return 12;
        elsif arg <= 8192 then return 13;
        elsif arg <= 16384 then return 14;
        elsif arg <= 32768 then return 15;
        elsif arg <= 65536 then return 16;
        elsif arg <= 131072 then return 17;
        elsif arg <= 262144 then return 18;
        elsif arg <= 524288 then return 19;
        elsif arg <= 1048576 then return 20;
        elsif arg <= 2097152 then return 21;
        elsif arg <= 4194304 then return 22;
        elsif arg <= 8388608 then return 23;
        elsif arg <= 16777216 then return 24;
        elsif arg <= 33554432 then return 25;
        elsif arg <= 67108864 then return 26;
        elsif arg <= 134217728 then return 27;
        elsif arg <= 268435456 then return 28;
        elsif arg <= 536870912 then return 29;
        elsif arg <= 1073741824 then return 30;
        else
            return 31;
        end if;
    end;
	
	function dividor_round_to_ceil(divisor	: integer;
		dividend : integer) return integer is
	begin
		if((dividend mod divisor) = 0)then
			return (dividend/divisor);
		else
			return (dividend/divisor + 1);
		end if;
	end;
	

end package body arithmetic_pkg;