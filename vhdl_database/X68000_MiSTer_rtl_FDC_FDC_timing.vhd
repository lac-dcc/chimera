LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

package FDC_timing is
--bit rate(in nsec) at fm (mfm is half)
constant BR_300_D	:integer	:=4000;
constant BR_300_H	:integer	:=2400;
constant BR_300_I	:integer	:=2000;		--IBM(1.44M) format
constant BR_360_D	:integer	:=3333;
constant BR_360_H	:integer	:=2000;
constant BR_360_I	:integer	:=1667;		--IBM(1.44M) format
--signal width(in nsec)
constant WR_WIDTH	:integer	:=200;

end FDC_timing;

