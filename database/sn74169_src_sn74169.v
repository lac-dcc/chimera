// This program was cloned from: https://github.com/andychip1/sn74169
// License: Apache License 2.0

module sn74169(
           input  [3:0] A,  
           input  U_DB, input CLK, input ENPB, input ENTB, input LOADB,
	   output reg [3:0] Q,
	   output RCOB
    );

 // loadb=0: load
 // NOR(enpb, entb) and U_DB: count up
 //                and !U_DB: count down

    always @(posedge CLK)
	begin
        if(!LOADB)
     		Q = A;
	else
		if (!ENPB && !ENTB)
			if(U_DB)
				Q=Q+1;
			else
				Q=Q-1;
		end

	assign RCOB = !( (Q[3]&Q[2]&Q[1]&Q[0]&U_DB) | (!Q[3]&!Q[2]&!Q[1]&!Q[0]&!U_DB));


endmodule
