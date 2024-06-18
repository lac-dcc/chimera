// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module	pkt_mux(
input							clk,
input							reset,

input				[339:0]	pkt_metadata_nocut,
input							pkt_metadata_nocut_valid,

input				[339:0]	pkt_metadata_out,  //[349:336]==pkt_addr,[335:0] 
input							pkt_metadata_out_valid,

output	reg	[4:0]		pkt_addr,
output	reg				pkt_addr_wr,

output	reg	[63:0]	metadata_data,
output	reg				metadata_data_wr,

output  reg					p2k_valid,
output  reg		[7:0] 	p2k_ingress,
output  reg		[127:0] 	p2k_rloc_src,
output  reg		[127:0] 	p2k_eid_dst,
output  reg		[71:0]  	p2k_metadata
);

reg	pkt_metadata_nocut_rdreq,pkt_metadata_out_rdreq;
wire	pkt_metadata_nocut_empty,pkt_metadata_out_empty;
wire	[339:0]	pkt_metadata_nocut_q,pkt_metadata_out_q;

reg [2:0] current_state;

parameter	idle_s				=	3'd0,
				idle_s1				=	3'd1,
            trans_s  			=	3'd2,
				trans_s1				=	3'd3;

always @ (posedge clk or negedge reset)
if(!reset)	begin
	pkt_metadata_nocut_rdreq	<=	1'b0;
	pkt_metadata_out_rdreq		<=	1'b0;
	pkt_addr							<=	5'b0;
	pkt_addr_wr						<=	1'b0;
	p2k_valid						<=	1'b0;
	p2k_ingress						<=	8'b0;
	p2k_rloc_src					<=	128'b0;
	p2k_eid_dst						<=	128'b0;
	p2k_metadata					<=	72'b0;
	
	metadata_data_wr				<=	1'b0;
	metadata_data					<=	64'b0;
	
	current_state					<=	idle_s;
	end
	else	begin
		case(current_state)
			idle_s:	begin
				pkt_addr							<=	5'b0;
				pkt_addr_wr						<=	1'b0;
				p2k_valid						<=	1'b0;
				p2k_ingress						<=	8'b0;
				p2k_rloc_src					<=	128'b0;
				p2k_eid_dst						<=	128'b0;
				p2k_metadata					<=	72'b0;
				metadata_data_wr				<=	1'b0;
				metadata_data					<=	64'b0;
				
				if(pkt_metadata_nocut_empty == 1'b1)	begin
					current_state					<=	idle_s1;
					end
					else	begin
						pkt_metadata_nocut_rdreq	<=	1'b1;
						current_state					<=	trans_s;
						end
				end
			idle_s1:	begin
				pkt_addr							<=	5'b0;
				pkt_addr_wr						<=	1'b0;
				p2k_valid						<=	1'b0;
				p2k_ingress						<=	8'b0;
				p2k_rloc_src					<=	128'b0;
				p2k_eid_dst						<=	128'b0;
				p2k_metadata					<=	72'b0;
				
				metadata_data_wr				<=	1'b0;
				metadata_data					<=	64'b0;
				
				if(pkt_metadata_out_empty == 1'b1)	begin
					current_state					<=	idle_s;
					end
					else	begin
						pkt_metadata_out_rdreq		<=	1'b1;
						current_state					<=	trans_s1;
						end
				end
			trans_s:	begin
				pkt_metadata_nocut_rdreq	<=	1'b0;
				pkt_addr							<=	{1'b0,pkt_metadata_nocut_q[339:336]};
				pkt_addr_wr						<=	1'b1;
				p2k_valid						<=	1'b1;
				p2k_ingress						<=	pkt_metadata_nocut_q[335:328];
				p2k_rloc_src					<=	pkt_metadata_nocut_q[327:200];
				p2k_eid_dst						<=	pkt_metadata_nocut_q[199:72];
				p2k_metadata					<=	pkt_metadata_nocut_q[71:0];
				
				metadata_data_wr				<=	1'b1;
				metadata_data					<=	pkt_metadata_nocut_q[63:0];
				current_state					<=	idle_s1;
				end
			trans_s1:	begin
				pkt_metadata_out_rdreq	<=	1'b0;
				pkt_addr							<=	{1'b1,pkt_metadata_out_q[339:336]};
				pkt_addr_wr						<=	1'b1;
				p2k_valid						<=	1'b1;
				p2k_ingress						<=	pkt_metadata_out_q[335:328];
				p2k_rloc_src					<=	pkt_metadata_out_q[327:200];
				p2k_eid_dst						<=	pkt_metadata_out_q[199:72];
				p2k_metadata					<=	pkt_metadata_out_q[71:0];
				
				metadata_data_wr				<=	1'b1;
				metadata_data					<=	pkt_metadata_out_q[63:0];
				
				current_state					<=	idle_s;
				end
			endcase
		end
fifo_340_16 pkt_metadata_nocut_fifo(
.aclr(!reset),
.clock(clk),
.data(pkt_metadata_nocut),
.rdreq(pkt_metadata_nocut_rdreq),
.wrreq(pkt_metadata_nocut_valid),
.empty(pkt_metadata_nocut_empty),
.q(pkt_metadata_nocut_q)
);	
fifo_340_16 pkt_metadata_out_fifo(
.aclr(!reset),
.clock(clk),
.data(pkt_metadata_out),
.rdreq(pkt_metadata_out_rdreq),
.wrreq(pkt_metadata_out_valid),
.empty(pkt_metadata_out_empty),
.q(pkt_metadata_out_q)
);	

endmodule	