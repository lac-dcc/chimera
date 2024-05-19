// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module	buf_add_manage(
input							clk,
input							reset,

input			[3:0]			aging_recycle_addr,
input							aging_recycle_addr_wr,

input			[3:0]			pkt_out_recycle_addr,
input							pkt_out_recycle_addr_wr,

output	reg				buf_addr_wr,
output	reg	[3:0]		buf_addr
);

reg	[3:0]	count;
wire	aging_recycle_addr_empty,pkt_out_recycle_addr_empty;
wire	[3:0] aging_recycle_addr_q,pkt_out_recycle_addr_q;
reg	aging_recycle_addr_rd,pkt_out_recycle_addr_rd;

reg [2:0] current_state;
parameter	idle_s		=	3'd0,
				idle_s1		=	3'd1,
				trans_s		=	3'd2,
				trans_s1		=	3'd3,
				initial_s	=	3'd4;
always @ (posedge clk or negedge reset)
if(!reset)	begin
	aging_recycle_addr_rd	<=	1'b0;
	pkt_out_recycle_addr_rd	<=	1'b0;
	buf_addr_wr					<=	1'b0;
	buf_addr						<=	4'b0;
	count							<=	4'b0;
	current_state				<=	initial_s;
	end
	else	begin
		case(current_state)
			initial_s:	begin
				if(count ==4'hf)	begin
					buf_addr_wr	<=	1'b1;
					buf_addr		<=	count;
					current_state	<=	idle_s;
					end
					else	begin
						buf_addr_wr	<=	1'b1;
						buf_addr		<=	count;
						count			<=	count +	1'b1;
						current_state	<=	initial_s;
						end
				end
			idle_s:	begin
				buf_addr_wr	<=	1'b0;
				if(aging_recycle_addr_empty == 1'b1)	begin
					current_state				<=	idle_s1;
					end
					else	begin
						aging_recycle_addr_rd	<=	1'b1;
						current_state				<=	trans_s;
						end
				end
			idle_s1:	begin
				buf_addr_wr	<=	1'b0;
				if(pkt_out_recycle_addr_empty == 1'b1)	begin
					current_state				<=	idle_s;
					end
					else	begin
						pkt_out_recycle_addr_rd	<=	1'b1;
						current_state				<=	trans_s1;
						end
				end
			trans_s:	begin
				buf_addr_wr					<=	1'b1;
				aging_recycle_addr_rd	<=	1'b0;
				buf_addr						<=	aging_recycle_addr_q;
				current_state				<=	idle_s1;
				end
			trans_s1:	begin
				buf_addr_wr					<=	1'b1;
				pkt_out_recycle_addr_rd	<=	1'b0;
				buf_addr						<=	pkt_out_recycle_addr_q;
				current_state				<=	idle_s;
				end
			endcase
		end

fifo_4_16	fifo_aging_recycle_addr (
.aclr			(!reset),
.clock		(clk),
.data			(aging_recycle_addr),
.rdreq		(aging_recycle_addr_rd),
.wrreq		(aging_recycle_addr_wr),
.empty		(aging_recycle_addr_empty),
.q				(aging_recycle_addr_q));	

fifo_4_16	fifo_pkt_out_recycle_addr (
.aclr			(!reset),
.clock		(clk),
.data			(pkt_out_recycle_addr),
.rdreq		(pkt_out_recycle_addr_rd),
.wrreq		(pkt_out_recycle_addr_wr),
.empty		(pkt_out_recycle_addr_empty),
.q				(pkt_out_recycle_addr_q));	
endmodule	