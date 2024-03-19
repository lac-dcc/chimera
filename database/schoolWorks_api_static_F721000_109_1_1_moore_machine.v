`define TimeExpire 32'd25000000
module clk_div (clk,rst,counter,div_clk);
input clk,rst;
input [31:0]counter;
output div_clk;
reg div_clk;
reg [31:0]count;
always @ (posedge clk)
begin 
	if (!rst)
	begin 
	count <= 32'd0;
	div_clk <=1'b0;
	end
	else
	begin 
	if (count == `TimeExpire)
	begin 
	count<=32'd0;
	div_clk <=~div_clk;
	end
	else
	begin 
	count <= count + 32'd1;
end
end
end
endmodule

module moore_machine (clk,reset,in,pause,out);
input clk,reset,pause,in;
output [6:0]out;
reg [2:0] state, nextstate;
reg [6:0]out;
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010; 
parameter S3 = 3'b011; 
parameter S4 = 3'b100; 
parameter S5 = 3'b101;
clk_div myclk (clk,reset,div_clk);
always @ (posedge div_clk or negedge reset)
begin 
	if (!reset)
		state <= S0;
	else
		state <= nextstate;
end
always @ (in or pause or state)
begin 
	if (pause)
		nextstate <= state;
	else
		case (state)
		S0: begin 
			if (in==1)
				nextstate <= S1;
			else
				nextstate <= S0;
		end
		S1: begin 
			if (in==1)
				nextstate <= S2;
			else
				nextstate <= S0;
		end
		S2: begin 
			if (in==1)
				nextstate <= S4;
			else
				nextstate <= S3;
		end
		S3: begin 
			if (in==1)
				nextstate <= S3;
			else
				nextstate <= S4;
		end
		S4: begin 
			if (in==1)
				nextstate <= S5;
			else
				nextstate <= S1;
		end
		S5: begin 
			if (in==1)
				nextstate <= S5;
			else
				nextstate <= S2;
		end
		endcase

end
always @ (state)
begin 
	case (state)
	S0: out = 7'b1000000;
	S1: out = 7'b1111001;
	S2: out = 7'b0100100;
	S3: out = 7'b0110000;
	S4: out = 7'b0011001;
	S5: out = 7'b0010010;
	endcase
end 
endmodule

