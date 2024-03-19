`timescale 1ns / 1ps


module t_process #(
	// Slave AXI parameters
	parameter C_S_AXI_DATA_WIDTH = 32,
	parameter C_S_AXI_ADDR_WIDTH = 12,
	parameter C_BASEADDR = 32'h80000000,
	// AXI Stream parameters
	// Slave
	parameter C_S_AXIS_DATA_WIDTH = 256,
	parameter C_S_AXIS_TUSER_WIDTH = 128,
	// Master
	parameter C_M_AXIS_DATA_WIDTH = 256,
	// self-defined
	parameter PHV_ADDR_WIDTH = 4
)
(
	input									clk,		// axis clk
	input									aresetn,	

	// input Slave AXI Stream
	input [C_S_AXIS_DATA_WIDTH-1:0]			s_axis_tdata,
	input [((C_S_AXIS_DATA_WIDTH/8))-1:0]	s_axis_tkeep,
	input [C_S_AXIS_TUSER_WIDTH-1:0]		s_axis_tuser,
	input									s_axis_tvalid,
	output									s_axis_tready,
	input									s_axis_tlast,

	// output Master AXI Stream
	output [C_S_AXIS_DATA_WIDTH-1:0]		m_axis_tdata,
	output [((C_S_AXIS_DATA_WIDTH/8))-1:0]	m_axis_tkeep,
	output [C_S_AXIS_TUSER_WIDTH-1:0]		m_axis_tuser,
	output									m_axis_tvalid,
	input									m_axis_tready,
	output									m_axis_tlast

	// for debug use
	
);

integer idx;

/*=================================================*/
localparam PKT_VEC_WIDTH = (6+4+2)*8*8+20*5+256;
// pkt fifo
wire								pkt_fifo_rd_en;
wire								pkt_fifo_nearly_full;
wire								pkt_fifo_empty;
wire [C_S_AXIS_DATA_WIDTH-1:0]		tdata_fifo;
wire [C_S_AXIS_TUSER_WIDTH-1:0]		tuser_fifo;
wire [C_S_AXIS_DATA_WIDTH/8-1:0]	tkeep_fifo;
wire								tlast_fifo;
// phv fifo
wire								phv_fifo_rd_en;
wire								phv_fifo_nearly_full;
wire								phv_fifo_empty;
wire [PKT_VEC_WIDTH-1:0]			phv_fifo_in;
wire [PKT_VEC_WIDTH-1:0]			phv_fifo_out_w;
wire								phv_valid;
// 
wire								stg0_phv_in_valid;
wire								stg0_phv_in_valid_w;
reg									stg0_phv_in_valid_r;
wire [PKT_VEC_WIDTH-1:0]			stg0_phv_in;
// stage-related
wire [PKT_VEC_WIDTH-1:0]			stg0_phv_out;
wire								stg0_phv_out_valid;
wire								stg0_phv_out_valid_w;
reg									stg0_phv_out_valid_r;
wire [PKT_VEC_WIDTH-1:0]			stg1_phv_out;
wire								stg1_phv_out_valid;
wire								stg1_phv_out_valid_w;
reg									stg1_phv_out_valid_r;
wire [PKT_VEC_WIDTH-1:0]			stg2_phv_out;
wire								stg2_phv_out_valid;
wire								stg2_phv_out_valid_w;
reg									stg2_phv_out_valid_r;
wire [PKT_VEC_WIDTH-1:0]			stg3_phv_out;
wire								stg3_phv_out_valid;
wire								stg3_phv_out_valid_w;
reg									stg3_phv_out_valid_r;
wire [PKT_VEC_WIDTH-1:0]			stg4_phv_out;
wire								stg4_phv_out_valid;
wire								stg4_phv_out_valid_w;
reg									stg4_phv_out_valid_r;
/*=================================================*/
assign s_axis_tready = !pkt_fifo_nearly_full;




fallthrough_small_fifo #(
	.WIDTH(C_S_AXIS_DATA_WIDTH + C_S_AXIS_TUSER_WIDTH + C_S_AXIS_DATA_WIDTH/8 + 1),
	.MAX_DEPTH_BITS(8)
)
pkt_fifo
(
	.din									({s_axis_tdata, s_axis_tuser, s_axis_tkeep, s_axis_tlast}),
	.wr_en									(s_axis_tvalid & ~pkt_fifo_nearly_full),
	.rd_en									(pkt_fifo_rd_en),
	.dout									({tdata_fifo, tuser_fifo, tkeep_fifo, tlast_fifo}),
	.full									(),
	.prog_full								(),
	.nearly_full							(pkt_fifo_nearly_full),
	.empty									(pkt_fifo_empty),
	.reset									(~aresetn),
	.clk									(clk)
);

fallthrough_small_fifo #(
	.WIDTH(PKT_VEC_WIDTH),
	.MAX_DEPTH_BITS(8)
)
phv_fifo
(
	// .din			(phv_fifo_in),
	// .wr_en			(phv_valid),
	// .din			(stg4_phv_out),
	// .wr_en			(stg4_phv_out_valid_w),
	.din			(stg0_phv_out),
	.wr_en			(stg0_phv_out_valid_w),

	.rd_en			(phv_fifo_rd_en),
	.dout			(phv_fifo_out_w),

	.full			(),
	.prog_full		(),
	.nearly_full	(phv_fifo_nearly_full),
	.empty			(phv_fifo_empty),
	.reset			(~aresetn),
	.clk			(clk)
);

packet_header_parser
phv_parser
(
	.axis_clk		(clk),
	.aresetn		(aresetn),
	// input slvae axi stream
	.s_axis_tdata	(s_axis_tdata),
	.s_axis_tuser	(s_axis_tuser),
	.s_axis_tkeep	(s_axis_tkeep),
	.s_axis_tvalid	(s_axis_tvalid & s_axis_tready),
	.s_axis_tlast	(s_axis_tlast),

	// output
	// .parser_valid	(phv_valid),
	// .pkt_hdr_vec	(phv_fifo_in)
	.parser_valid	(stg0_phv_in_valid),
	.pkt_hdr_vec	(stg0_phv_in)
);

stage #(
	.STAGE(0)
)
stage0
(
	.axis_clk				(clk),
    .aresetn				(aresetn),

	// input
    .phv_in					(stg0_phv_in),
    .phv_in_valid			(stg0_phv_in_valid_w),
	// output
    .phv_out				(stg0_phv_out),
    .phv_out_valid			(stg0_phv_out_valid)
);

// deparser
deparser
depar (
	.clk					(clk),
	.aresetn				(aresetn),

	.pkt_fifo_tdata			(tdata_fifo),
	.pkt_fifo_tkeep			(tkeep_fifo),
	.pkt_fifo_tuser			(tuser_fifo),
	.pkt_fifo_tlast			(tlast_fifo),
	.pkt_fifo_empty			(pkt_fifo_empty),
	// output
	.pkt_fifo_rd_en			(pkt_fifo_rd_en),

	.phv_fifo_out			(phv_fifo_out_w),
	.phv_fifo_empty			(phv_fifo_empty),
	// output
	.phv_fifo_rd_en			(phv_fifo_rd_en),
	.depar_out_tdata		(m_axis_tdata),
	.depar_out_tkeep		(m_axis_tkeep),
	.depar_out_tuser		(m_axis_tuser),
	.depar_out_tvalid		(m_axis_tvalid),
	.depar_out_tlast		(m_axis_tlast),
	// input
	.depar_out_tready		(m_axis_tready)
);

/*
stage #(
	.STAGE(1)
)
stage1
(
	.axis_clk				(clk),
    .aresetn				(aresetn),

	// input
    .phv_in					(stg0_phv_out),
    .phv_in_valid			(stg0_phv_out_valid_w),
	// output
    .phv_out				(stg1_phv_out),
    .phv_out_valid			(stg1_phv_out_valid)
);

stage #(
	.STAGE(2)
)
stage2
(
	.axis_clk				(clk),
    .aresetn				(aresetn),

	// input
    .phv_in					(stg1_phv_out),
    .phv_in_valid			(stg1_phv_out_valid_w),
	// output
    .phv_out				(stg2_phv_out),
    .phv_out_valid			(stg2_phv_out_valid)
);

stage #(
	.STAGE(3)
)
stage3
(
	.axis_clk				(clk),
    .aresetn				(aresetn),

	// input
    .phv_in					(stg2_phv_out),
    .phv_in_valid			(stg2_phv_out_valid_w),
	// output
    .phv_out				(stg3_phv_out),
    .phv_out_valid			(stg3_phv_out_valid)
);

stage #(
	.STAGE(4)
)
stage4
(
	.axis_clk				(clk),
    .aresetn				(aresetn),

	// input
    .phv_in					(stg3_phv_out),
    .phv_in_valid			(stg3_phv_out_valid_w),
	// output
    .phv_out				(stg4_phv_out),
    .phv_out_valid			(stg4_phv_out_valid)
);*/

always @(posedge clk) begin
	if (~aresetn) begin
		stg0_phv_in_valid_r <= 0;
		stg0_phv_out_valid_r <= 0;
		stg1_phv_out_valid_r <= 0;
		stg2_phv_out_valid_r <= 0;
		stg3_phv_out_valid_r <= 0;
		stg4_phv_out_valid_r <= 0;
	end
	else begin
		stg0_phv_in_valid_r <= stg0_phv_in_valid;
		stg0_phv_out_valid_r <= stg0_phv_out_valid;
		stg1_phv_out_valid_r <= stg1_phv_out_valid;
		stg2_phv_out_valid_r <= stg2_phv_out_valid;
		stg3_phv_out_valid_r <= stg3_phv_out_valid;
		stg4_phv_out_valid_r <= stg4_phv_out_valid;
	end
end

assign stg0_phv_in_valid_w = stg0_phv_in_valid & ~stg0_phv_in_valid_r;
assign stg0_phv_out_valid_w = stg0_phv_out_valid & ~stg0_phv_out_valid_r;
assign stg1_phv_out_valid_w = stg1_phv_out_valid & ~stg1_phv_out_valid_r;
assign stg2_phv_out_valid_w = stg2_phv_out_valid & ~stg2_phv_out_valid_r;
assign stg3_phv_out_valid_w = stg3_phv_out_valid & ~stg3_phv_out_valid_r;
assign stg4_phv_out_valid_w = stg4_phv_out_valid & ~stg4_phv_out_valid_r;


// debug

endmodule
