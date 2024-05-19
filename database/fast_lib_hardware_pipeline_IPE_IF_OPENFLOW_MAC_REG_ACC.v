// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module MAC_REG_ACC(
input				clk,
input				reset,
input				waitrequest,
input		[31:0]	readdata,

output	reg	[7:0]	address,
output	reg			write,
output	reg			read,
output	reg	[31:0]	writedata);
reg			[2:0]		reg_count;
reg			[3:0]		count;
reg 		[1:0]		current_state;
parameter		idle_s	=	2'b00,
				wait_clk_s	=	2'b01,
				write_s	=	2'b10,	
				wait_s	=	2'b11;
always@(posedge clk or negedge reset)
if(!reset)	begin
	address		<=	8'b0;
	write		<=	1'b0;
	read		<=	1'b0;
	writedata	<=	32'b0;
	reg_count	<=	3'b0;
	count		<=	4'b0;
	
	current_state	<=	wait_clk_s;
	end 
	else	begin
		case(current_state)
			wait_clk_s:begin
				reg_count	<=	3'b0;
				count			<=count	+1'b1;
				if(count[3] == 1'b1)
					current_state	<=	idle_s;
					else
						current_state	<=	wait_clk_s;
				end
			idle_s:	begin
				address		<=	8'b0;
				write		<=	1'b0;
				read		<=	1'b0;
				writedata	<=	32'b0;
				count		<=	4'b0;
				if(reg_count	<	3'd4)begin
					reg_count	<=	reg_count	+	3'b1;
					current_state	<=	write_s;
					end
					else	begin						
						current_state	<=	idle_s;
						end
				end
			write_s:	begin
				
				current_state	<=	wait_s;
				case(reg_count)
					3'd1:	begin
						address		<=	8'h2;
						write	<=	1'b1;
						writedata	<=	32'h1000093;
						end
					3'd2:	begin
						address		<=	8'he;
						write	<=	1'b1;
						writedata	<=	32'h4;
						end
					3'd3:	begin
						address		<=	8'h94;
						write	<=	1'b1;
						writedata	<=	32'h7;
						end
					default:	begin
						address		<=	8'h2;
						writedata	<=	32'h1000093;	
						end
					endcase
				end
			wait_s:	begin
				write	<=	1'b1;
				if(waitrequest	==	1'b0)begin
					current_state	<=	idle_s;
					write	<=	1'b1;
					end
					else	begin
						current_state	<=	wait_s;
						end
				end
			endcase
		end 
		
		endmodule 