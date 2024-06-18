// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module parse_pkt_disp(
input								clk,
input								reset,


input  							pkt_head_valid,
input  				[138:0] 	pkt_head,
input  							pkt_payload_valid,
input  				[138:0] 	pkt_payload,
input 							pkt_metadata_valid,
input  				[359:0] 	pkt_metadata, //wait to define;8bit-action; 16bit-identify;8bit-ingress; 128bit-rloc_src; 128bit-eid_dst; 72bit-metadata;

output	reg					pkt_ctl_valid,
output	reg		[138:0]	pkt_ctl,
input					[7:0]		pkt_ctl_usedw,

output	reg					pkt_metadata_cut_out_valid,
output	reg		[359:0]	pkt_metadata_cut_out,

output	reg		[138:0]	pkt_cut_data,
output	reg					pkt_cut_data_valid,
input					[7:0]		pkt_cut_data_usedw,

output	reg					pkt_metadata_nocut_out_valid,
output	reg		[359:0]	pkt_metadata_nocut_out,

output	reg		[138:0]	pkt_nocut_data,
output	reg					pkt_nocut_data_valid,
input					[7:0]		pkt_nocut_data_usedw,

output	reg					buf_addr_full);

reg				flag;
wire	[7:0]		 pkt_head_usedw, pkt_payload_usedw;
wire	[3:0]		pkt_metadata_usedw;

reg	pkt_head_rdreq,pkt_payload_rdreq, pkt_metadata_rdreq;
wire	[138:0]	pkt_head_q,pkt_payload_q;
wire	[359:0]	pkt_metadata_q;
wire	pkt_metadata_empty;

reg [2:0] current_state;
parameter	idle_s				=	3'd0,
            parse_metadata_s  =	3'd1,
				discard_h_s			=	3'd2,
				trans_ctl_s			=	3'd3,
				trans_h_s			=	3'd4,
				trans_b_s			=	3'd5;
always @ (posedge clk or negedge reset)
	if(!reset)	begin	
		pkt_head_rdreq						<=	1'b0;
		pkt_payload_rdreq					<=	1'b0;
		pkt_metadata_rdreq				<=	1'b0;
		pkt_metadata_nocut_out_valid	<=	1'b0;
		pkt_metadata_nocut_out			<=	360'b0;
		pkt_metadata_cut_out_valid		<=	1'b0;
		pkt_metadata_cut_out				<=	360'b0;
		pkt_ctl_valid						<=	1'b0;
		flag									<=	1'b0;
		pkt_ctl								<=	139'b0;
		pkt_cut_data_valid				<=	1'b0;
		pkt_cut_data						<=	139'b0;
		
		pkt_nocut_data_valid				<=	1'b0;
		pkt_nocut_data						<=	139'b0;
		
		current_state						<=	idle_s;
		end
		else	begin
			case(current_state)
				idle_s:	begin
					pkt_ctl_valid	<=	1'b0;
					flag				<=	1'b0;
					pkt_nocut_data_valid	<=	1'b0;
					pkt_metadata_cut_out_valid	<=	1'b0;
					pkt_cut_data_valid			<=	1'b0;
					pkt_metadata_nocut_out_valid	<=	1'b0;
					if(pkt_metadata_empty == 1'b1)	begin
						current_state			<=	idle_s;
						end
						else	begin
							pkt_head_rdreq	<=	1'b0;
							pkt_metadata_rdreq		<=	1'b1;
							pkt_metadata_nocut_out	<=	pkt_metadata_q;
							current_state	<=	parse_metadata_s;
							end
					end
				parse_metadata_s:	begin
					pkt_head_rdreq				<=	1'b0;	
					pkt_metadata_rdreq			<=	1'b0;					
					if(pkt_metadata_nocut_out[359] == 1'b1)	begin //discard
						pkt_head_rdreq			<=	1'b1;
						current_state			<=	discard_h_s;
						end
						else	if(pkt_metadata_nocut_out[358] == 1'b1)	begin //ctl							
							if(pkt_ctl_usedw < 8'd161)	begin
								pkt_head_rdreq			<=	1'b1;
								current_state			<=	trans_ctl_s;
								end
								else	begin
									current_state	<=	parse_metadata_s;
									end
							end
							else	if(pkt_metadata_nocut_out[355] == 1'b1) 	begin//cut
								pkt_metadata_cut_out	<=	pkt_metadata_nocut_out;
								if(pkt_cut_data_usedw < 8'd161)	begin
									pkt_head_rdreq			<=	1'b1;
									flag						<=	1'b0;
									current_state			<=	trans_h_s;
									end
									else	begin
										current_state			<=	idle_s;
										end
								
								end
								else	begin
									if(pkt_nocut_data_usedw < 8'd161)	begin
										pkt_head_rdreq			<=	1'b1;
										flag						<=	1'b1;
										current_state			<=	trans_h_s;
										end
										else	begin
											current_state			<=	idle_s;
											end
									
									end
					end
				trans_h_s:	begin
					if(pkt_head_q[138:136]	==	3'b110)	begin
						pkt_head_rdreq			<=	1'b0;
						if(flag == 1'b1)	begin								
								if(pkt_metadata_nocut_out[356])	begin //no body
									pkt_nocut_data_valid	<=	1'b1;
									pkt_nocut_data			<=	pkt_head_q;
									pkt_metadata_nocut_out_valid	<=	1'b1;
									current_state			<=	idle_s;
									end
									else	begin
										pkt_nocut_data_valid	<=	1'b1;
										pkt_nocut_data			<=	{3'b100,pkt_head_q[135:0]};
										pkt_payload_rdreq		<=	1'b1;
										current_state			<=	trans_b_s;
										end
								end
								else	begin
									if(pkt_metadata_nocut_out[356])	begin //no body
									pkt_cut_data_valid	<=	1'b1;
									pkt_cut_data			<=	pkt_head_q;
									pkt_metadata_cut_out_valid	<=	1'b1;
									current_state			<=	idle_s;
									end
									else	begin
										pkt_cut_data_valid	<=	1'b1;
										pkt_cut_data			<=	{3'b100,pkt_head_q[135:0]};
										pkt_payload_rdreq		<=	1'b1;
										current_state			<=	trans_b_s;
										end
									end
						end
						else	begin
							current_state			<=	trans_h_s;
							if(flag == 1'b1)	begin
								pkt_nocut_data_valid	<=	1'b1;
								pkt_nocut_data			<=	pkt_head_q;
								end
								else	begin
									pkt_cut_data_valid	<=	1'b1;
									pkt_cut_data			<=	pkt_head_q;
									end
							end
					end
				trans_b_s:	begin
					if(pkt_payload_q[138:136]  == 3'b110)	begin
						pkt_payload_rdreq		<=	1'b0;
						current_state			<=	idle_s;
							if(flag == 1'b1)	begin
								pkt_nocut_data_valid	<=	1'b1;
								pkt_metadata_nocut_out_valid	<=	1'b1;
								pkt_nocut_data			<=	pkt_payload_q;
								end
								else	begin
									pkt_cut_data_valid	<=	1'b1;
									pkt_metadata_cut_out_valid	<=	1'b1;
									pkt_cut_data			<=	pkt_payload_q;
									end
						end
						else 	begin
							current_state			<=	trans_b_s;
							if(flag == 1'b1)	begin
								pkt_nocut_data_valid	<=	1'b1;
								pkt_nocut_data			<=	pkt_payload_q;
								end
								else	begin
									pkt_cut_data_valid	<=	1'b1;
									pkt_cut_data			<=	pkt_payload_q;
									end
							end
					end
				trans_ctl_s:	begin
					pkt_ctl_valid	<=	1'b1;
					pkt_ctl			<=	pkt_head_q;
					if(pkt_head_q[138:136]	==	3'b110)	begin
						pkt_head_rdreq			<=	1'b0;
						current_state			<=	idle_s;
						end
						else	begin							
							current_state			<=	trans_ctl_s;
							end
					end
				discard_h_s:	begin
					if(pkt_head_q[138:136]	==	3'b110)	begin
						pkt_head_rdreq			<=	1'b0;
						current_state			<=	idle_s;
						end
						else	begin
							current_state			<=	discard_h_s;
							end
					end
				endcase
			end			
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
        buf_addr_full <= 1'b0;
      end
    else
      begin
			if((pkt_head_usedw < 8'd160) && (pkt_payload_usedw < 8'd160) &&(pkt_metadata_usedw < 4'd13)) 
			begin
				buf_addr_full <= 1'b0;
			end
			else	buf_addr_full <= 1'b1;
      end
end		

fifo_139_256 head_fifo(
.aclr(!reset),
.clock(clk),
.data(pkt_head),
.rdreq(pkt_head_rdreq),
.wrreq(pkt_head_valid),
.empty(),
.full(),
.q(pkt_head_q),
.usedw(pkt_head_usedw)
);

fifo_139_256 payload_fifo(
.aclr(!reset),
.clock(clk),
.data(pkt_payload),
.rdreq(pkt_payload_rdreq),
.wrreq(pkt_payload_valid),
.empty(),
.full(),
.q(pkt_payload_q),
.usedw(pkt_payload_usedw)
);

fifo_360_16 metadata_fifo(
.aclr(!reset),
.clock(clk),
.data(pkt_metadata),
.rdreq(pkt_metadata_rdreq),
.wrreq(pkt_metadata_valid),
.empty(pkt_metadata_empty),
.full(),
.q(pkt_metadata_q),
.usedw(pkt_metadata_usedw)
);		


endmodule 