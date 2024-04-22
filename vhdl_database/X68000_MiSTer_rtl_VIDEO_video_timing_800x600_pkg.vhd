library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package VIDEO_TIMING_800x600_pkg is
	constant DOTPU	:integer	:=8;
	constant HWIDTH	:integer	:=1056;
	constant HUWIDTH :integer	:=HWIDTH/DOTPU;
	constant VWIDTH	:integer	:=628;
	constant HVIS	:integer	:=800;
	constant HUVIS	:integer	:=HVIS/DOTPU;
	constant VVIS	:integer	:=600;
	constant CPD	:integer	:=2;		--clocks per dot
	constant HFP	:integer	:=5;
	constant HSY	:integer	:=16;
	constant HBP	:integer	:=HUWIDTH-HUVIS-HFP-HSY;
	constant HIV	:integer	:=HFP+HSY+HBP;
	constant VFP	:integer	:=1;
	constant VSY	:integer	:=4;
	constant VBP	:integer	:=VWIDTH-VVIS-VFP-VSY;
	constant VIV	:integer	:=VFP+VSY+VBP;
	
end VIDEO_TIMING_800x600_pkg;
