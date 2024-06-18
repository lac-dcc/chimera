// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module	pkt_in_buf(
input							clk,
input							reset,

input							pkt_metadata_nocut_out_valid,
input				[359:0]	pkt_metadata_nocut_out,

input				[138:0]	pkt_nocut_data,
input							pkt_nocut_data_valid,
output			[7:0]		pkt_nocut_data_usedw,

input							buf_addr_wr,
input				[3:0]		buf_addr,

output	reg	[339:0]	pkt_metadata_nocut,
output	reg				pkt_metadata_nocut_valid,
/*
output	reg	[138:0]	nocut_pkt_ram_data_in,
output	reg	[10:0]	nocut_pkt_ram_wr_addr,
output	reg				nocut_pkt_ram_wr,
*/

input				[10:0]	nocut_pkt_ram_rd_addr,
input						nocut_pkt_ram_rd,
output			[138:0]	nocut_pkt_ram_data_q

);

reg	[359:0]	pkt_metadata_nocut_out_q_r;
reg	[10:0]		buf_addr_q_r;

wire	[3:0]		buf_addr_q;
reg				buf_addr_rd;
wire				buf_addr_empty;

wire	[359:0] 	pkt_metadata_nocut_out_q;
reg				pkt_metadata_nocut_out_rdreq;
wire				pkt_metadata_nocut_out_empty;

reg	[138:0]	nocut_pkt_ram_data_in;
reg	[10:0]	nocut_pkt_ram_wr_addr;
reg				nocut_pkt_ram_wr;

wire	[138:0]	pkt_nocut_data_q;
reg				pkt_nocut_data_rdreq;
reg	[3:0]	count;
reg [2:0] current_state;

parameter	idle_s				=	3'd0,
				initial_s			=	3'd1,
            parse_metadata_s  =	3'd2,
				trans_b_s			=	3'd3,
				delete_5clock		=	3'd4;
always @ (posedge clk or negedge reset)
if(!reset)	begin
	pkt_metadata_nocut			<=	340'b0;
	pkt_metadata_nocut_valid	<=	1'b0;
	buf_addr_rd						<=	1'b0;
	pkt_metadata_nocut_out_rdreq	<=	1'b0;
	pkt_metadata_nocut_out_q_r	<=	360'b0;
	buf_addr_q_r					<=	11'b0;
	nocut_pkt_ram_data_in		<=	139'b0;
	nocut_pkt_ram_wr_addr		<=	11'b0;
	nocut_pkt_ram_wr				<=	1'b0;
	pkt_nocut_data_rdreq			<=	1'b0;
	count								<=	4'b0;
	current_state					<=	initial_s;
	end
	else	begin
		case(current_state)
			initial_s:	begin	
				if(count == 4'hf)	begin
					count			<=	4'b0;
					current_state	<=	idle_s;
					end
					else	begin
						count				<=	count + 1'b1;
						current_state	<=	initial_s;						
						end
				end
			idle_s:	begin
				pkt_metadata_nocut			<=	340'b0;
				pkt_metadata_nocut_valid	<=	1'b0;
				pkt_nocut_data_rdreq			<=	1'b0;
				nocut_pkt_ram_data_in		<=	139'b0;
				nocut_pkt_ram_wr_addr		<=	11'b0;
				nocut_pkt_ram_wr				<=	1'b0;
				count			<=	4'b0;				
				if((pkt_metadata_nocut_out_empty == 1'b0)&&(buf_addr_empty == 1'b0))	begin
					pkt_metadata_nocut_out_rdreq	<=	1'b1;
					buf_addr_rd						<=	1'b1;
					current_state					<=	parse_metadata_s;
					end
					else	begin
						current_state					<=	idle_s;
						end
				end
			parse_metadata_s:	begin
				pkt_metadata_nocut_out_rdreq	<=	1'b0;
				buf_addr_rd						<=	1'b0;
				pkt_metadata_nocut_out_q_r	<=	pkt_metadata_nocut_out_q;
				buf_addr_q_r					<=	{buf_addr_q[3:0],7'b0};
				pkt_nocut_data_rdreq			<=	1'b1;
				if(pkt_metadata_nocut_out_q[335:328] == 8'd0)	begin
					count							<=	4'b0;
					current_state					<=	delete_5clock;
					end
					else	begin
						current_state					<=	trans_b_s;
						end
				end
			delete_5clock:	begin					
				if(count	==	4'd4)	begin
					current_state	<=	trans_b_s;
					end
					else	begin
						count	<=	count + 1'b1;
						current_state	<=	delete_5clock;
						end
				end
			trans_b_s:	begin
					nocut_pkt_ram_data_in		<=	pkt_nocut_data_q;
					nocut_pkt_ram_wr_addr		<=	buf_addr_q_r;
					nocut_pkt_ram_wr			<=	1'b1;					
					if(pkt_nocut_data_q[138:136] == 3'b110)	begin
						pkt_nocut_data_rdreq				<=	1'b0;
						pkt_metadata_nocut_valid		<=	1'b1;
						pkt_metadata_nocut				<=	{buf_addr_q_r[10:7],pkt_metadata_nocut_out_q_r[335:0]};
						current_state						<=	idle_s;
						
						end
						else	begin
							buf_addr_q_r	<=	buf_addr_q_r +	1'b1;
							current_state	<=	trans_b_s;
							end
					
				end
			endcase
		end
				
fifo_4_16	fifo_4_16_addr (
.aclr			(!reset),
.clock		(clk),
.data			(buf_addr),
.rdreq		(buf_addr_rd),
.wrreq		(buf_addr_wr),
.empty		(buf_addr_empty),
.q				(buf_addr_q));	

ram_2048_139	ram_2048_139 (
.aclr			(!reset),
.clock		(clk),
.data			(nocut_pkt_ram_data_in),
.rdaddress	(nocut_pkt_ram_rd_addr),
.rden			(nocut_pkt_ram_rd),
.wraddress	(nocut_pkt_ram_wr_addr),
.wren			(nocut_pkt_ram_wr),
.q				(nocut_pkt_ram_data_q));

fifo_139_256 pkt_cut_data_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(pkt_nocut_data),
.rdreq		(pkt_nocut_data_rdreq),
.wrreq		(pkt_nocut_data_valid),
.q				(pkt_nocut_data_q),
.usedw		(pkt_nocut_data_usedw));

fifo_360_64 pkt_metadata_nocut_out_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(pkt_metadata_nocut_out),
.rdreq		(pkt_metadata_nocut_out_rdreq),
.wrreq		(pkt_metadata_nocut_out_valid),
.empty		(pkt_metadata_nocut_out_empty),
.q				(pkt_metadata_nocut_out_q));
endmodule	