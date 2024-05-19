// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : Ahmad Adel <github.com/ahmadadel8>
*						Dina  Elsokary <github.com/dinaelsokary>
*
*	Date: September 2018
* 
* Description: Calculates mod used in MixColumns.
* Language: Verilog
*
*/

task Mod;
input  [14:0]x;
output [7:0] y;

reg    [8:0] con;
reg    [14:0] z;
integer i;
 
begin
  con = 9'd283;
  z = x;
  for (i=14; i>=8; i =i-1)
	 if (z > 8'd255)
	   begin
			if(z[i] == 1)
				z[i -: 9] = z[i -: 9] ^ con[8:0];
				//$display("z = %b",z[14:0]);
				end
	 else begin
		y =z;
		end
		y = z;
end

endtask



