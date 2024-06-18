// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top(BCD, seg);	//bcd to 7segment decoder
							//** the design is for ACTIVE LOW 7 segment
/*
7 segment view
	----a----		Pin		Segment
   |         |		1		e
   |         |		2		d
   f         b		3		common anode
   |         |		4		c
    ----g----		5		dot point
   |         |		6		b
   e         c		7		a
   |         |		8		common anode
   |         |		9		f
    ----d----		10		g
    
    =====================================
            OUTPUT OF THIS CODE
    =====================================
    seg[6] = a	seg[5] = b	seg[4] = c
    seg[3] = d	seg[2] = e	seg[1] = f
				seg[0]= g
*/
input wire [3:0] BCD;
output reg [6:0] seg;

always@(BCD)
begin
	case(BCD)
		4'b0000: seg = 7'b0000001;
		4'b0001: seg = 7'b1001111;
		4'b0010: seg = 7'b0010010;
		4'b0011: seg = 7'b0000110;
		4'b0100: seg = 7'b1001100;
		4'b0101: seg = 7'b0100100;
		4'b0110: seg = 7'b0100000;
		4'b0111: seg = 7'b0001111;
		4'b1000: seg = 7'b0000000;
		4'b1001: seg = 7'b0000100;
		default: seg = 7'b0110000;
		endcase
end
endmodule