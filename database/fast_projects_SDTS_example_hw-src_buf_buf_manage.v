module	buf_manage(
input							clk,
input							reset,
//cut pkt
input							pkt_metadata_cut_out_valid,
input				[359:0]	pkt_metadata_cut_out,

input				[138:0]	pkt_cut_data,
input							pkt_cut_data_valid,
output			[7:0]		pkt_cut_data_usedw,

input				[10:0]	ram_rd_addr,
input							ram_rd,
output			[138:0]	ram_data_q,

input				[3:0]		pkt_out_recycle_addr,
input							pkt_out_recycle_addr_wr,
//no cut pkt 
input							pkt_metadata_nocut_out_valid,
input				[359:0]	pkt_metadata_nocut_out,

input				[138:0]	pkt_nocut_data,
input							pkt_nocut_data_valid,
output			[7:0]		pkt_nocut_data_usedw,

input				[10:0]	nocut_pkt_ram_rd_addr,
input							nocut_pkt_ram_rd,
output			[138:0]	nocut_pkt_ram_data_q,

input				[3:0]		nocutpkt_out_recycle_addr,
input							nocutpkt_out_recycle_addr_wr,	
//result
output			[4:0]		pkt_addr,  //[4] == cutpkt  0 nocut pkt
output						pkt_addr_wr,

output			[63:0]	metadata_data,
output						metadata_data_wr,
		
output  						p2k_valid,
output  			[7:0] 	p2k_ingress,
output  			[127:0] 	p2k_rloc_src,
output  			[127:0] 	p2k_eid_dst,
output  			[71:0]  	p2k_metadata
);

wire				[3:0]		aging_recycle_addr;
wire							aging_recycle_addr_wr;
wire							buf_addr_wr;
wire				[3:0]		buf_addr;
wire				[339:0]	pkt_metadata_nocut;
wire							pkt_metadata_nocut_valid;

wire				[339:0]	pkt_metadata_out;
wire							pkt_metadata_out_valid;

wire							nocutbuf_addr_wr;
wire				[3:0]		nocutbuf_addr;

pkt_recomb	pkt_recomb(
.clk										(clk),
.reset									(reset),

.pkt_metadata_cut_out_valid		(pkt_metadata_cut_out_valid),
.pkt_metadata_cut_out				(pkt_metadata_cut_out),

.pkt_cut_data							(pkt_cut_data),
.pkt_cut_data_valid					(pkt_cut_data_valid),
.pkt_cut_data_usedw					(pkt_cut_data_usedw),

.buf_addr_wr							(buf_addr_wr),
.buf_addr								(buf_addr),

.aging_recycle_addr					(aging_recycle_addr),
.aging_recycle_addr_wr				(aging_recycle_addr_wr),

.pkt_metadata_out						(pkt_metadata_out),  //[339:336]==pkt_addr,[335:0] 
.pkt_metadata_out_valid				(pkt_metadata_out_valid),

.ram_rd_addr							(ram_rd_addr),
.ram_rd									(ram_rd),
.ram_data_q								(ram_data_q));

buf_add_manage	cutpkt_buf_add_manage(
.clk									(clk),
.reset								(reset),

.aging_recycle_addr				(aging_recycle_addr),
.aging_recycle_addr_wr			(aging_recycle_addr_wr),

.pkt_out_recycle_addr			(pkt_out_recycle_addr),
.pkt_out_recycle_addr_wr		(pkt_out_recycle_addr_wr),

.buf_addr_wr						(buf_addr_wr),
.buf_addr							(buf_addr));

pkt_mux	pkt_mux(
.clk									(clk),
.reset								(reset),

.pkt_metadata_nocut				(pkt_metadata_nocut),
.pkt_metadata_nocut_valid		(pkt_metadata_nocut_valid),

.pkt_metadata_out					(pkt_metadata_out),  //[349:336]==pkt_addr,[335:0] 
.pkt_metadata_out_valid			(pkt_metadata_out_valid),

.pkt_addr							(pkt_addr),
.pkt_addr_wr						(pkt_addr_wr),

.metadata_data						(metadata_data),
.metadata_data_wr					(metadata_data_wr),
			
.p2k_valid							(p2k_valid),
.p2k_ingress						(p2k_ingress),
.p2k_rloc_src						(p2k_rloc_src),
.p2k_eid_dst						(p2k_eid_dst),
.p2k_metadata						(p2k_metadata));

pkt_in_buf	pkt_in_buf(
.clk									(clk),
.reset								(reset),

.pkt_metadata_nocut_out_valid	(pkt_metadata_nocut_out_valid),
.pkt_metadata_nocut_out			(pkt_metadata_nocut_out),

.pkt_nocut_data						(pkt_nocut_data),
.pkt_nocut_data_valid				(pkt_nocut_data_valid),
.pkt_nocut_data_usedw				(pkt_nocut_data_usedw),

.buf_addr_wr						(nocutbuf_addr_wr),
.buf_addr							(nocutbuf_addr),

.pkt_metadata_nocut				(pkt_metadata_nocut),
.pkt_metadata_nocut_valid		(pkt_metadata_nocut_valid),

.nocut_pkt_ram_rd_addr			(nocut_pkt_ram_rd_addr),
.nocut_pkt_ram_rd					(nocut_pkt_ram_rd),
.nocut_pkt_ram_data_q			(nocut_pkt_ram_data_q));

buf_add_manage	nocutpkt_buf_add_manage(
.clk									(clk),
.reset								(reset),

.aging_recycle_addr				(4'b0),
.aging_recycle_addr_wr			(1'b0),

.pkt_out_recycle_addr			(nocutpkt_out_recycle_addr),
.pkt_out_recycle_addr_wr		(nocutpkt_out_recycle_addr_wr),

.buf_addr_wr						(nocutbuf_addr_wr),
.buf_addr							(nocutbuf_addr));
endmodule	