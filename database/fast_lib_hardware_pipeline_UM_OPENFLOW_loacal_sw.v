// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module loacal_sw(
input				clk,
input				reset,
output	reg	[31:0]	data_out,
input		[64:0] 	command,
input				command_wr,
output	reg			ale,
output	reg			cs_n,
output	reg			rd_wr,
output	reg	[31:0]	data,
input				ack_n_um,
input		[31:0]	rdata_um
);
reg	command_rd;
reg		[64:0] command_q_r;
wire	[64:0]	command_q;
wire	command_wr_empty;
reg	[7:0]	count;
reg		[2:0]	current_state;
localparam	
            idle_s = 'd1,
            ale_s = 'd2,
			cs_s = 'd3,
			wait_ack_s = 'd4,
			wait_addr_s = 'd5,
			wait_addr_s1 = 'd6;
			
always @(posedge clk or negedge reset) 
if(!reset)	begin
	ale	<=	1'b0;
	cs_n	<=	1'b1;
	rd_wr	<=	1'b1;
	data	<=	32'b0;
	command_rd	<=	1'b0;
	command_q_r	<=	65'b0;
	data_out	<=	32'b0;
	count	<=	8'b0;
	current_state	<=	idle_s;
	end
	else	begin
		case(current_state)
			idle_s:	begin
			ale	<=	1'b0;
			cs_n	<=	1'b1;
			rd_wr	<=	1'b1;
			count	<=	8'b0;
			command_rd	<=	1'b0;
			if(command_wr_empty == 1'b1)	begin
				current_state	<=	idle_s;
				end
				else	begin
					command_rd	<=	1'b1;
					command_q_r	<=	command_q;
					data	<=	command_q[63:32];
					rd_wr	<=	command_q[64];  //0:wr  1:read
					current_state	<=	ale_s;
					end
			end
			ale_s	:	begin
				ale	<=	1'b1;
				command_rd	<=	1'b0;
				current_state	<=	cs_s;
				end
			cs_s:	begin
				ale	<=	1'b0;
				//cs_n	<=	1'b0;
				//data	<=	command_q_r[31:0];
				current_state	<=	wait_addr_s;
				end
			wait_addr_s:begin
				current_state	<=	wait_addr_s1;
				end
			wait_addr_s1:	begin
				data	<=	command_q_r[31:0];
				cs_n	<=	1'b0;
				current_state	<=	wait_ack_s;
				end
			wait_ack_s:	begin
				if(ack_n_um	==	1'b0)	begin
					cs_n	<=	1'b0;					
					data_out	<=	rdata_um;
					current_state	<=	idle_s;
					end
					else	begin
						count		<=	count	+ 1'b1;
						if(count[7:4] == 4'b1111)	begin
						current_state	<=	idle_s;
						end
						else	begin
							current_state	<=	wait_ack_s;
							end
						end
				end
			endcase
		
		end
	fifo_65_256 command_fifo(//crc check result fifo;
	.aclr(!reset),
	.clock(clk),
	.data(command),
	.rdreq(command_rd),
	.wrreq(command_wr),
	.empty(command_wr_empty),
	.q(command_q)
   );
endmodule 