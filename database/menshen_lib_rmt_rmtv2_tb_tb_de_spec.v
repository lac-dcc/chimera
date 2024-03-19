`timescale 1ns / 1ps

module tb_demo #(
    // parameters declared here.
	parameter C_S_AXI_DATA_WIDTH = 32,
	parameter C_S_AXI_ADDR_WIDTH = 12,
	parameter C_BASEADDR = 32'h80000000,
	// AXI Stream parameters
	// Slave
	parameter C_S_AXIS_DATA_WIDTH = 512,
	parameter C_S_AXIS_TUSER_WIDTH = 128,
	// Master
	parameter C_M_AXIS_DATA_WIDTH = 512,
	// self-defined
	parameter PHV_ADDR_WIDTH = 4,
    parameter PHV_LEN = 48*8+32*8+16*8+5*20+256
)();

//stimulates (regs) and oputputs(wires) declared here
reg                                 clk;
reg                                 aresetn;

reg [C_S_AXIS_DATA_WIDTH-1:0]			s_axis_tdata;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]		s_axis_tkeep;
reg [C_S_AXIS_TUSER_WIDTH-1:0]			s_axis_tuser;
reg										s_axis_tvalid;
wire									s_axis_tready;
reg										s_axis_tlast;

wire [C_S_AXIS_DATA_WIDTH-1:0]		    m_axis_tdata;
wire [((C_S_AXIS_DATA_WIDTH/8))-1:0]    m_axis_tkeep;
wire [C_S_AXIS_TUSER_WIDTH-1:0]		    m_axis_tuser;
wire								    m_axis_tvalid;
reg										m_axis_tready;
wire									m_axis_tlast;


reg [PHV_LEN-1:0]        phv_in;
reg                      phv_in_valid;

wire [PHV_LEN-1:0]       phv_out;
wire					 phv_out_valid;

//clk signal
localparam CYCLE = 10;

always begin
    #(CYCLE/2) clk = ~clk;
end

//reset signal
initial begin
    clk = 0;
    aresetn = 1;
    #(10);
    aresetn = 0; //reset all the values
    #(10);
    aresetn = 1;
end

initial begin
    m_axis_tready <= 1'b1;
    s_axis_tdata <= 512'b0; 
    s_axis_tkeep <= 64'h0;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(2*CYCLE+CYCLE/2)
    /*
        here you give values to stimulates per CYCLE
    */

    // test for rmt_wrapper
    m_axis_tready <= 1'b1;
    s_axis_tdata <= 512'b0; 
    s_axis_tkeep <= 64'h0;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;


    // deparser
     #(20*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000010005b8cf3b00f2f1d204dededede6f6f6f6f01de1140000001004f00004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000000000000000000000000000000000000000000000000000000300000030030000003003000000000000000000000250e230d210c910b3100; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;



    // 2
	// deparser
     #(20*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000020005d1dc3b00f2f1d204dededede6f6f6f6f01de1140000001004f00004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000030000003003000000300300000000000000000000000002f0d910b210c3100; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;


end

rmt_wrapper #(
	.C_S_AXI_DATA_WIDTH(),
	.C_S_AXI_ADDR_WIDTH(),
	.C_BASEADDR(),
	.C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH),
	.C_S_AXIS_TUSER_WIDTH(),
	.C_M_AXIS_DATA_WIDTH(C_M_AXIS_DATA_WIDTH),
	.PHV_ADDR_WIDTH()
)rmt_wrapper_ins
(
	.clk(clk),		// axis clk
	.aresetn(aresetn),	

	// input Slave AXI Stream
	.s_axis_tdata(s_axis_tdata),
	.s_axis_tkeep(s_axis_tkeep),
	.s_axis_tuser(s_axis_tuser),
	.s_axis_tvalid(s_axis_tvalid),
	.s_axis_tready(s_axis_tready),
	.s_axis_tlast(s_axis_tlast),

	// output Master AXI Stream
	.m_axis_tdata(m_axis_tdata),
	.m_axis_tkeep(m_axis_tkeep),
	.m_axis_tuser(m_axis_tuser),
	.m_axis_tvalid(m_axis_tvalid),
	.m_axis_tready(m_axis_tready),
	.m_axis_tlast(m_axis_tlast)
	
);

endmodule