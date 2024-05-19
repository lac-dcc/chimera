// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module	parser(
input						clk,
input						reset,

input      				ip_src_valid,
input 		[130:0] 	ip_src,


input 					cdp2um_data_valid,
input 		[138:0] 	cdp2um_data,
output					um2cdp_tx_enable,
output					um2cdp_path,

output					pkt_ctl_valid, //contorl
output		[138:0]	pkt_ctl,
input			[7:0]		pkt_ctl_usedw,

output					pkt_metadata_cut_out_valid,
output		[359:0]	pkt_metadata_cut_out,

output		[138:0]	pkt_cut_data,
output					pkt_cut_data_valid,
input			[7:0]		pkt_cut_data_usedw,

output					pkt_metadata_nocut_out_valid,
output		[359:0]	pkt_metadata_nocut_out,

output		[138:0]	pkt_nocut_data,
output					pkt_nocut_data_valid,
input			[7:0]		pkt_nocut_data_usedw);


wire					buf_addr_full;
wire					pkt_head_valid;
wire		[138:0] 	pkt_head;
wire					pkt_payload_valid;
wire		[138:0] 	pkt_payload;
wire					pkt_metadata_valid;
wire		[359:0] 	pkt_metadata; //wait to define;8bit-action; 16bit-identify;8bit-ingress; 128bit-rloc_src; 128bit-eid_dst; 72bit-metadata;

parser_h	parser_h(
.ip_src_valid							(ip_src_valid),
.ip_src									(ip_src),
.clk										(clk),
.reset									(reset),
.buf_addr_full							(buf_addr_full),
.cdp2um_data_valid					(cdp2um_data_valid),
.cdp2um_data							(cdp2um_data),
.um2cdp_tx_enable						(um2cdp_tx_enable),
.um2cdp_path							(um2cdp_path),				
.pkt_head_valid						(pkt_head_valid),
.pkt_head								(pkt_head),
.pkt_payload_valid					(pkt_payload_valid),
.pkt_payload							(pkt_payload),
.pkt_metadata_valid					(pkt_metadata_valid),
.pkt_metadata							(pkt_metadata)); //wait to define;8bit-action; 16bit-identify;8bit-ingress; 128bit-rloc_src; 128bit-eid_dst; 72bit-metadata;


parse_pkt_disp	parse_pkt_disp(
.clk										(clk),
.reset									(reset),
				
.pkt_head_valid						(pkt_head_valid),
.pkt_head								(pkt_head),
.pkt_payload_valid					(pkt_payload_valid),
.pkt_payload							(pkt_payload),
.pkt_metadata_valid					(pkt_metadata_valid),
.pkt_metadata							(pkt_metadata), //wait to define;8bit-action; 16bit-identify;8bit-ingress; 128bit-rloc_src; 128bit-eid_dst; 72bit-metadata;
				
.pkt_ctl_valid							(pkt_ctl_valid), //contorl
.pkt_ctl									(pkt_ctl),
.pkt_ctl_usedw							(pkt_ctl_usedw),

.pkt_metadata_cut_out_valid		(pkt_metadata_cut_out_valid),
.pkt_metadata_cut_out				(pkt_metadata_cut_out),

.pkt_cut_data							(pkt_cut_data),
.pkt_cut_data_valid					(pkt_cut_data_valid),
.pkt_cut_data_usedw					(pkt_cut_data_usedw),

.pkt_metadata_nocut_out_valid		(pkt_metadata_nocut_out_valid),
.pkt_metadata_nocut_out				(pkt_metadata_nocut_out),

.pkt_nocut_data						(pkt_nocut_data),
.pkt_nocut_data_valid				(pkt_nocut_data_valid),
.pkt_nocut_data_usedw				(pkt_nocut_data_usedw),

.buf_addr_full							(buf_addr_full));
endmodule	