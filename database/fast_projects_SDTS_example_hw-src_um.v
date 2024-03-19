`timescale 1ns/1ps

module um(
input 				clk,
input 				reset,
output  	  			um2cdp_path,
input         		cdp2um_data_valid,
input		[138:0] 	cdp2um_data,
output    			um2cdp_tx_enable,

output    			um2cdp_data_valid,
output	[138:0]	um2cdp_data,
input     			cdp2um_tx_enable,
output    			um2cdp_rule_wrreq,
output   [29:0]  	um2cdp_rule,
input 	[4:0]   	cdp2um_rule_usedw, 


input 				localbus_cs_n,
input 				localbus_rd_wr,
input 	[31:0]  	localbus_data,
input 				localbus_ale,
output    			localbus_ack_n,
output    [31:0]  localbus_data_out);


wire  						cs_n;
wire  						rd_wr;
wire  			[31:0]  	data;
wire  						ale;
wire  						ack_n;
wire  			[31:0]  	data_out;
wire  						mode;
wire  						ip_src_valid;
wire  			[130:0] 	ip_src;
wire  			[7:0] 	xtr_id;

wire							pkt_metadata_cut_out_valid;
wire				[359:0]	pkt_metadata_cut_out;

wire				[138:0]	pkt_cut_data;
wire							pkt_cut_data_valid;
wire				[7:0]		pkt_cut_data_usedw;

wire							pkt_metadata_nocut_out_valid;
wire				[359:0]	pkt_metadata_nocut_out;

wire				[138:0]	pkt_nocut_data;
wire							pkt_nocut_data_valid;
wire				[7:0]		pkt_nocut_data_usedw;

wire				[4:0]		pkt_addr;  //[4] == cutpkt  0 nocut pkt
wire							pkt_addr_wr;

wire				[63:0]	metadata_data;
wire							metadata_data_wr;

wire				[3:0]		pkt_out_recycle_addr;
wire							pkt_out_recycle_addr_wr;

wire				[3:0]		nocutpkt_out_recycle_addr;
wire							nocutpkt_out_recycle_addr_wr;	

wire				[10:0]	nocut_pkt_ram_rd_addr;
wire							nocut_pkt_ram_rd;
wire				[138:0]	nocut_pkt_ram_data_q;

wire				[10:0]	ram_rd_addr;
wire							ram_rd;
wire				[138:0]	ram_data_q;

wire  						p2k_valid;
wire  			[7:0] 	p2k_ingress;
wire  			[127:0] 	p2k_rloc_src;
wire  			[127:0] 	p2k_eid_dst;
wire  			[71:0]  	p2k_metadata;

wire  						k2m_metadata_valid;
wire  			[107:0] 	k2m_metadata;
wire  						action_valid;
wire  			[15:0]  	action;
wire  						action_data_valid;
wire  			[351:0] 	action_data;

wire							pkt_ctl_valid; //contorl
wire				[138:0]	pkt_ctl;
wire				[7:0]		pkt_ctl_usedw;

wire							rule_wr;
wire				[19:0]	rule; //  [19] lisp pkt capsulate flag  [18:8] length  [7:0] out port;

wire							pkt_out_valid;
wire				[138:0]	pkt_out;
wire				[7:0]		pkt_out_usedw;
localbus_manage localbus_manage(
.clk										(clk),
.reset									(reset),
.localbus_cs_n							(localbus_cs_n),
.localbus_rd_wr						(localbus_rd_wr),
.localbus_data							(localbus_data),
.localbus_ale							(localbus_ale), 
.localbus_ack_n						(localbus_ack_n),  
.localbus_data_out					(localbus_data_out),
				
.cs_n										(cs_n),
.rd_wr									(rd_wr),
.data										(data),
.ale										(ale), 
.ack_n									(ack_n),  
.data_out								(data_out),
				
.set_ip_src_valid						(ip_src_valid),
.set_ip_src								(ip_src),
				
.mode										(mode),
.xtr_id									(xtr_id));

parser	parser(
.clk										(clk),
.reset									(reset),
				
.ip_src_valid							(ip_src_valid),
.ip_src									(ip_src),
				
.cdp2um_data_valid					(cdp2um_data_valid),
.cdp2um_data							(cdp2um_data),
.um2cdp_tx_enable						(um2cdp_tx_enable),
.um2cdp_path							(um2cdp_path),
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
.pkt_nocut_data_usedw				(pkt_nocut_data_usedw));

buf_manage	buf_manage(
.clk										(clk),
.reset									(reset),
//cut pkt
.pkt_metadata_cut_out_valid		(pkt_metadata_cut_out_valid),
.pkt_metadata_cut_out				(pkt_metadata_cut_out),

.pkt_cut_data							(pkt_cut_data),
.pkt_cut_data_valid					(pkt_cut_data_valid),
.pkt_cut_data_usedw					(pkt_cut_data_usedw),

.ram_rd_addr							(ram_rd_addr),
.ram_rd									(ram_rd),
.ram_data_q								(ram_data_q),

.pkt_out_recycle_addr				(pkt_out_recycle_addr),
.pkt_out_recycle_addr_wr			(pkt_out_recycle_addr_wr),
//no cut pkt 
.pkt_metadata_nocut_out_valid		(pkt_metadata_nocut_out_valid),
.pkt_metadata_nocut_out				(pkt_metadata_nocut_out),

.pkt_nocut_data						(pkt_nocut_data),
.pkt_nocut_data_valid				(pkt_nocut_data_valid),
.pkt_nocut_data_usedw				(pkt_nocut_data_usedw),

.nocut_pkt_ram_rd_addr				(nocut_pkt_ram_rd_addr),
.nocut_pkt_ram_rd						(nocut_pkt_ram_rd),
.nocut_pkt_ram_data_q				(nocut_pkt_ram_data_q),

.nocutpkt_out_recycle_addr			(nocutpkt_out_recycle_addr),
.nocutpkt_out_recycle_addr_wr		(nocutpkt_out_recycle_addr_wr),	
//result
.pkt_addr								(pkt_addr),  //[4] == cutpkt  0 nocut pkt
.pkt_addr_wr							(pkt_addr_wr),

.metadata_data							(metadata_data),
.metadata_data_wr						(metadata_data_wr),
		
.p2k_valid								(p2k_valid),
.p2k_ingress							(p2k_ingress),
.p2k_rloc_src							(p2k_rloc_src),
.p2k_eid_dst							(p2k_eid_dst),
.p2k_metadata							(p2k_metadata));

key_gen key_gen(
.clk										(clk),
.reset									(reset),
.p2k_valid								(p2k_valid),
.p2k_ingress							(p2k_ingress),
.p2k_rloc_src							(p2k_rloc_src),
.p2k_eid_dst							(p2k_eid_dst),
.p2k_metadata							(p2k_metadata[71:64]),
			
.mode										(mode),
.k2m_metadata_valid					(k2m_metadata_valid),
.k2m_metadata							(k2m_metadata));

match match(
.clk										(clk),
.reset									(reset),
.metadata_valid						(k2m_metadata_valid),
.metadata								(k2m_metadata),
			
.localbus_cs_n							(cs_n),
.localbus_rd_wr						(rd_wr),
.localbus_data							(data),
.localbus_ale							(ale), 
.localbus_ack_n						(ack_n),  
.localbus_data_out					(data_out),
			
.action_valid							(action_valid),
.action									(action),
.action_data_valid					(action_data_valid),
.action_data							(action_data));

action	action_init(
.clk										(clk),
.reset									(reset),
.xtr_id									(xtr_id),
//act 			
.action_valid							(action_valid),
.action									(action),
.action_data_valid					(action_data_valid),
.action_data							(action_data),	

//pkt addr
.pkt_addr								(pkt_addr),  //[4] == cutpkt  0 nocut pkt
.pkt_addr_wr							(pkt_addr_wr),

.metadata_data							(metadata_data),
.metadata_data_wr						(metadata_data_wr),

// cut pkt addr recycle
.pkt_out_recycle_addr				(pkt_out_recycle_addr),
.pkt_out_recycle_addr_wr			(pkt_out_recycle_addr_wr),
//nopktcut pkt addr recycle
.nocutpkt_out_recycle_addr			(nocutpkt_out_recycle_addr),
.nocutpkt_out_recycle_addr_wr		(nocutpkt_out_recycle_addr_wr),

//no cut ram READ
.nocut_pkt_ram_rd_addr				(nocut_pkt_ram_rd_addr),
.nocut_pkt_ram_rd						(nocut_pkt_ram_rd),
.nocut_pkt_ram_data_q				(nocut_pkt_ram_data_q),
//cut pkt RAM READ
.ram_rd_addr							(ram_rd_addr),
.ram_rd									(ram_rd),
.ram_data_q								(ram_data_q),
//rule out
.rule_wr									(rule_wr),
.rule										(rule), //  [19] lisp pkt capsulate flag  [18:8] length  [7:0] out port;
//pkt out 
.pkt_out_valid							(pkt_out_valid),
.pkt_out									(pkt_out),
.pkt_out_usedw							(pkt_out_usedw));


transmit	transmit(
.clk										(clk),
.reset									(reset),
.mode										(mode), //1:cengdie wang   0:shi wang

.pkt_ctl_valid							(pkt_ctl_valid), //contorl
.pkt_ctl									(pkt_ctl),
.pkt_ctl_usedw							(pkt_ctl_usedw),
//rule 
.rule_wr									(rule_wr),
.rule										(rule), //  [19] lisp pkt capsulate flag  [18:8] length  [7:0] out port;
//pkt  
.pkt_out_valid							(pkt_out_valid),
.pkt_out									(pkt_out),
.pkt_out_usedw							(pkt_out_usedw),

.um2cdp_rule_wrreq					(um2cdp_rule_wrreq),
.um2cdp_rule							(um2cdp_rule),
.um2cdp_data_valid					(um2cdp_data_valid),
.um2cdp_data							(um2cdp_data),
.cdp2um_rule_usedw					(cdp2um_rule_usedw),
.cdp2um_tx_enable						(cdp2um_tx_enable));

endmodule


