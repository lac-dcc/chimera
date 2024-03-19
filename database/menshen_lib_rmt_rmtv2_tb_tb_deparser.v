`timescale 1ns / 1ps

module tb_deparser #(
    //in corundum with 100g ports, data width is 512b
	parameter	C_S_AXIS_DATA_WIDTH = 512,
	parameter	C_S_AXIS_TUSER_WIDTH = 128,
	parameter	C_PKT_VEC_WIDTH = (6+4+2)*8*8+20*5+256,
    parameter   DEPARSER_ID = 5
)();

reg									clk;
reg									aresetn;

reg [C_S_AXIS_DATA_WIDTH-1:0]		pkt_fifo_tdata;
reg [C_S_AXIS_DATA_WIDTH/8-1:0]		pkt_fifo_tkeep;
reg [C_S_AXIS_TUSER_WIDTH-1:0]		pkt_fifo_tuser;

reg									pkt_fifo_tlast;
reg									pkt_fifo_empty;
wire							    pkt_fifo_rd_en;

reg [C_PKT_VEC_WIDTH-1:0]			phv_fifo_out;
reg									phv_fifo_empty;
wire								phv_fifo_rd_en;

wire [C_S_AXIS_DATA_WIDTH-1:0]		depar_out_tdata;
wire [C_S_AXIS_DATA_WIDTH/8-1:0]	depar_out_tkeep;
wire [C_S_AXIS_TUSER_WIDTH-1:0]		depar_out_tuser;
wire								depar_out_tvalid;
wire								depar_out_tlast;
reg									depar_out_tready;

    //control path
reg [C_S_AXIS_DATA_WIDTH-1:0]		c_s_axis_tdata;
reg [C_S_AXIS_TUSER_WIDTH-1:0]		c_s_axis_tuser;
reg [C_S_AXIS_DATA_WIDTH/8-1:0]		c_s_axis_tkeep;
reg									c_s_axis_tvalid;
reg									c_s_axis_tlast;


localparam CYCLE = 10;

always begin
    clk = 0;
    aresetn = 1;
    #(10);
    aresetn = 0;
    #(10);
    aresetn = 1;
end
//NOTE: 512b testcase
integer i;
initial begin
    #(2*CYCLE);
    #(CYCLE/2);
    for (i = 0; i<20; i=i+1) begin
        //for action table
        c_s_axis_tdata <= {128'b0, 4'b0001, 4'b10, 5'b00000, 3'b101, 368'b0};
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 64'hffffffffffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        #(CYCLE)
        c_s_axis_tdata <= {494'hfffffffffffffffffffffff,18'hffff};
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 64'hffffffffffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        #(CYCLE)
        c_s_axis_tdata <= {494'heeeeeeeeeeeeeeeeeeeeeee,18'hffff};
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 64'hffffffffffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE)
        c_s_axis_tdata <= {494'hdddddddddddddddddddddddd,18'hffff};
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 64'hffffffffffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b1;

        #(CYCLE)
        c_s_axis_tdata <= 512'b0;
        c_s_axis_tvalid <= 1'b0;
        c_s_axis_tkeep <= 64'h0;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        #(8*CYCLE);

        // //for action table
        // c_s_axis_tdata <= {128'b0, 4'b0001, 4'b10, 5'b00000, 3'b000, 368'b0};
        // c_s_axis_tvalid <= 1'b1;
        // c_s_axis_tkeep <= 64'hffffffffffffffff;
        // c_s_axis_tuser <= 128'b0;
        // c_s_axis_tlast <= 1'b0;
        // #(CYCLE)
        // c_s_axis_tdata <= {494'hfffffffffffffffffffffff,18'hffff};
        // c_s_axis_tvalid <= 1'b1;
        // c_s_axis_tkeep <= 64'hffffffffffffffff;
        // c_s_axis_tuser <= 128'b0;
        // c_s_axis_tlast <= 1'b0;
        // #(CYCLE)
        // c_s_axis_tdata <= {494'heeeeeeeeeeeeeeeeeeeeeee,18'hffff};
        // c_s_axis_tvalid <= 1'b1;
        // c_s_axis_tkeep <= 64'hffffffffffffffff;
        // c_s_axis_tuser <= 128'b0;
        // c_s_axis_tlast <= 1'b0;

        // #(CYCLE)
        // c_s_axis_tdata <= {494'heeeeeeeeeeeeeeeeeeeeeee,18'hffff};
        // c_s_axis_tvalid <= 1'b1;
        // c_s_axis_tkeep <= 64'hffffffffffffffff;
        // c_s_axis_tuser <= 128'b0;
        // c_s_axis_tlast <= 1'b1;

        // #(CYCLE)
        // c_s_axis_tdata <= 512'b0;
        // c_s_axis_tvalid <= 1'b0;
        // c_s_axis_tkeep <= 64'h0;
        // c_s_axis_tuser <= 128'b0;
        // c_s_axis_tlast <= 1'b0;
        // #(8*CYCLE);
    end
end

deparser #(
	.C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH),
	.C_S_AXIS_TUSER_WIDTH(C_S_AXIS_TUSER_WIDTH),
	.C_PKT_VEC_WIDTH(),
    .DEPARSER_ID()
)
phv_deparser (
	.clk					(clk),
	.aresetn				(aresetn),

	//data plane
	.pkt_fifo_tdata			(pkt_fifo_tdata),
	.pkt_fifo_tkeep			(pkt_fifo_tkeep),
	.pkt_fifo_tuser			(pkt_fifo_tuser),
	.pkt_fifo_tlast			(pkt_fifo_tlast),
	.pkt_fifo_empty			(pkt_fifo_empty),
	// output from STAGE
	.pkt_fifo_rd_en			(pkt_fifo_rd_en),

	.phv_fifo_out			(phv_fifo_out),
	.phv_fifo_empty			(phv_fifo_empty),
	.phv_fifo_rd_en			(phv_fifo_rd_en),
	// output
	.depar_out_tdata		(depar_out_tdata),
	.depar_out_tkeep		(depar_out_tkeep),
	.depar_out_tuser		(depar_out_tuser),
	.depar_out_tvalid		(depar_out_tvalid),
	.depar_out_tlast		(depar_out_tlast),
	// input
	.depar_out_tready		(depar_out_tready),

	//control path
	.c_s_axis_tdata(c_s_axis_tdata),
	.c_s_axis_tuser(c_s_axis_tuser),
	.c_s_axis_tkeep(c_s_axis_tkeep),
	.c_s_axis_tvalid(c_s_axis_tvalid),
	.c_s_axis_tlast(c_s_axis_tlast)
);

endmodule