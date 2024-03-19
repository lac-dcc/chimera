`timescale 1ns / 1ps

module tb_parser #(
    //for 100g MAC, the AXIS width is 512b
	parameter C_S_AXIS_DATA_WIDTH = 512,
	parameter C_S_AXIS_TUSER_WIDTH = 128,
	parameter PKT_HDR_LEN = (6+4+2)*8*8+20*5+256, // check with the doc
	parameter PARSE_ACT_RAM_WIDTH = 167,
    parameter PARSER_ID = 0
)();

reg									axis_clk;
reg									aresetn;

// input slvae axi stream
reg [C_S_AXIS_DATA_WIDTH-1:0]		s_axis_tdata;
reg [C_S_AXIS_TUSER_WIDTH-1:0]		s_axis_tuser;
reg [C_S_AXIS_DATA_WIDTH/8-1:0]		s_axis_tkeep;
reg									s_axis_tvalid;
reg									s_axis_tlast;
// output
wire   								phv_valid_out;
wire [PKT_HDR_LEN-1:0]			    phv_out;

//control path
reg  [C_S_AXIS_DATA_WIDTH-1:0]		c_s_axis_tdata;
reg  [C_S_AXIS_TUSER_WIDTH-1:0]		c_s_axis_tuser;
reg  [C_S_AXIS_DATA_WIDTH/8-1:0]	c_s_axis_tkeep;
reg									c_s_axis_tvalid;
reg									c_s_axis_tlast;

wire [C_S_AXIS_DATA_WIDTH-1:0]		c_m_axis_tdata;
wire [C_S_AXIS_TUSER_WIDTH-1:0]		c_m_axis_tuser;
wire [C_S_AXIS_DATA_WIDTH/8-1:0]	c_m_axis_tkeep;
wire								c_m_axis_tvalid;
wire								c_m_axis_tlast;


localparam CYCLE = 10;

always begin
    #(CYCLE/2) axis_clk = ~axis_clk;
end

initial begin
    axis_clk = 0;
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
        c_s_axis_tdata <= {128'b0, 4'b0001, 4'b10, 5'b00000, 3'b000, 368'b0};
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
        c_s_axis_tdata <= {494'heeeeeeeeeeeeeeeeeeeeeee,18'hffff};
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


parser #(
    .C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH), //for 100g mac exclusively
	.C_S_AXIS_TUSER_WIDTH(),
	.PKT_HDR_LEN(),
	.PARSE_ACT_RAM_WIDTH(),
	.PARSER_ID()
)
phv_parser
(
	.axis_clk		(axis_clk),
	.aresetn		(aresetn),
	//data path
	.s_axis_tdata	(s_axis_tdata),
	.s_axis_tuser	(s_axis_tuser),
	.s_axis_tkeep	(s_axis_tkeep),
	.s_axis_tvalid	(s_axis_tvalid),
	.s_axis_tlast	(s_axis_tlast),

	.phv_valid_out	(phv_valid_out),
	.phv_out	    (phv_out),

	//control path
    .c_s_axis_tdata(c_s_axis_tdata),
	.c_s_axis_tuser(c_s_axis_tuser),
	.c_s_axis_tkeep(c_s_axis_tkeep),
	.c_s_axis_tvalid(c_s_axis_tvalid),
	.c_s_axis_tlast(c_s_axis_tlast),

    .c_m_axis_tdata(c_m_axis_tdata),
	.c_m_axis_tuser(c_m_axis_tuser),
	.c_m_axis_tkeep(c_m_axis_tkeep),
	.c_m_axis_tvalid(c_m_axis_tvalid),
	.c_m_axis_tlast(c_m_axis_tlast)

);

endmodule