module RDP(byte_op,half_op,unsigned_op,lwr,byte_addr,RD_RAW,V2,RD); //RD's processor
//input
    input byte_op;
    input half_op;
    input unsigned_op;
	
	input lwr;

    input [1:0] byte_addr;
    
    input [31:0] RD_RAW;
	input [31:0] V2;
//output
    output reg [31:0] RD;

//load
	always @(*)
		begin
			if(lwr)
				begin
					case(byte_addr)
						0:RD=RD_RAW;
						1:RD={V2[31:24],RD_RAW[31:8]};
						2:RD={V2[31:16],RD_RAW[31:16]};
						3:RD={V2[31:8],RD_RAW[31:24]};
					endcase
				end
			else if(byte_op)
				begin
					if(unsigned_op)RD=RD_RAW[(byte_addr*8)+:8];
					else RD=$signed(RD_RAW[(byte_addr*8)+:8]);
				end
			else if(half_op)
				begin
					if(unsigned_op)RD=RD_RAW[(byte_addr*8)+:16];
					else RD=$signed(RD_RAW[(byte_addr*8)+:16]);
				end
			else RD=RD_RAW;
		end
    
endmodule

