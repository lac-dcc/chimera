// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top(f, a);	//bcd to 7segment decoder
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
    f[6] = a	f[5] = b	f[4] = c
    f[3] = d	f[2] = e	f[1] = f
				f[0]= g
*/
	input [3:0] a; //bcd number
	output [6:0] f;
	reg [6:0] f;
	always@(*)
	begin
		case (a)
			0: f = 7'b0000001;
			1: f = 7'b1001111;
			2: f = 7'b0010010;
			3: f = 7'b0000110;
			4: f = 7'b1001100;
			5: f = 7'b0100100;
			6: f = 7'b0100000;
			7: f = 7'b0001111;
			8: f = 7'b0000000;
			9: f = 7'b0000100;
		endcase
	end
endmodule 
