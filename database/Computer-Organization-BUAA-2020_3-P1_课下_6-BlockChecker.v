`timescale 1ns / 1ps

// Create Date:    09:54:36 10/27/2020 


`define	s0	0
`define	s1	1
`define	s2	2
`define	s3	3
`define	s4	4
`define	s5	5
`define	s6	6
`define	s7	7
`define	s8	8


module BlockChecker(
    input clk,
    input reset,
    input [7:0] in,
    output result
    );
	 
// upper --> lower
// lower stay
// others --> 0
function [7:0] low;
	input [7:0] in;
	begin
		if((in >= "A")&&(in <="Z")) begin	// if in is upper
			low = in - "A" + "a";
		end
		else if((in >= "a")&&(in <= "z")) begin	// if in is lower
			low = in;
		end
		else begin
			low = 0;
		end
	end
endfunction

reg[3:0]		state;// state
reg cnt;				// is the first char?? (cnt == 0) no char have been input
reg[7:0] 	bfb;	// what's the char before "begin"
reg[7:0] 	bfe;	// what's the char before "end"
reg[31:0]	lef;	// left "(", # of "begin"
reg[31:0]	rit;	// right ")", # of "end" 
reg err;	
reg prerr;
// ")" before "(", never right!
//	as a ")" is gennerated, it would have a look on the # of "(", if there is no "(",
// err was set to 1
						

initial begin
	state <= 0;
	cnt <= 0;
	bfb <= " ";
	bfe <= " ";
	lef <= 0;
	rit <= 0;
	err <= 0;
	prerr <= 0;
end

always@(posedge clk or posedge reset) begin
	if(reset == 1) begin
		state <= 0;
		cnt <= 0;
		bfb <= " ";
		bfe <= " ";
		lef <= 0;
		rit <= 0;
		err <= 0;
		prerr <= 0;
	end
	else begin
		case(state)
			`s0 : begin
				if(in == " ") begin
					cnt <= 1;
					state <= 0;
					bfb <= " ";
					bfe <= " ";
				end
				else if(low(in)== "b") begin
					if((cnt == 0)||(bfb == " ")) begin
						state <= 1;
						bfb <= "b";
						bfe <= "b";
						cnt <= 1;
					end
					else begin
						bfb <= in;
						bfe <= in;
						cnt <= 1;
					end
				end
				else if(low(in)=="e") begin
					if((cnt == 0)||(bfe == " ")) begin
						state <= 6;
						cnt <= 1;
						bfb <= in;
						bfe <= in;
					end
					else begin
						cnt <= 1;
						bfb <= in;
						bfe <= in;
					end
				end
				else begin
					bfb <= in;
					bfe <= in;
					cnt <= 1;
				end
			end
			`s1 : begin
				if(low(in) == "e") begin
					state <= 2;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
				end
				else begin
					state <= 0;
					bfb <= in;
					bfe <= in;
					cnt <=1;
				end
			end
			`s2 : begin
				if(low(in) == "g") begin
					state <= 3;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
				end
				else begin
					state <= 0;
					bfb <= in;
					bfe <= in;
					cnt <=1;
				end
			end
			`s3 : begin
				if(low(in) == "i") begin
					state <= 4;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
				end
				else begin
					state <= 0;
					bfb <= in;
					bfe <= in;
					cnt <=1;
				end
			end
			`s4 : begin
				if(low(in) == "n") begin
					state <= 5;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
					lef <= lef +1;
				end
				else begin
					state <= 0;
					bfb <= in;
					bfe <= in;
					cnt <=1;
				end
			end
			`s5 : begin
				if(in == " ") begin
					state <= 0;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
				end
				else begin
					state <= 0;
					cnt <= 1;
					lef <= lef -1;
					bfb <= in;
					bfe <= in;
				end	
			end
			`s6 : begin
				if(low(in) == "n") begin
					state <= 7;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
				end
				else begin
					state <= 0;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
				end	
			end
			`s7 : begin
				if(low(in) == "d") begin
					state <= 8;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
					rit <= rit +1;
					if(lef == rit) begin
						prerr <= err;
						err <= 1;
					end
					else begin
					end
				end
				else begin
					state <= 0;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
				end	
			end
			`s8 : begin
				if(in == " ") begin
					state <= 0;
					cnt <=1;
					bfb <= in;
					bfe <= in;
				end
				else begin
					state <= 0;
					cnt <= 1;
					bfb <= in;
					bfe <= in;
					rit <= rit -1;
					if((rit == (lef+1))&&(prerr == 0)) begin
						prerr <= err;
						err <= 0;
					end
					else begin
					end
				end
			end
		endcase
	end
end
assign result =	(err == 1)? 0 :
						(lef == rit)? 1 :0;
endmodule
