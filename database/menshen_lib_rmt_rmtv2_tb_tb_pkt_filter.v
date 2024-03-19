`timescale 1ns / 1ps

`define ETH_TYPE_IPV4	16'h0008
`define IPPROT_UDP		8'h11
`define CONTROL_PORT    16'hf1f2

module tb_pkt_filter #(
	parameter C_S_AXIS_DATA_WIDTH = 512,
	parameter C_S_AXIS_TUSER_WIDTH = 128
)
();
reg				                        clk;
reg				                        aresetn;
// input Slave AXI Stream
reg [C_S_AXIS_DATA_WIDTH-1:0]			s_axis_tdata;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]	    s_axis_tkeep;
reg [C_S_AXIS_TUSER_WIDTH-1:0]		    s_axis_tuser;
reg									    s_axis_tvalid;
wire								    s_axis_tready;
reg									    s_axis_tlast;
// output Master AXI Stream
wire   [C_S_AXIS_DATA_WIDTH-1:0]		m_axis_tdata;
wire   [((C_S_AXIS_DATA_WIDTH/8))-1:0]	m_axis_tkeep;
wire   [C_S_AXIS_TUSER_WIDTH-1:0]		m_axis_tuser;
wire  									m_axis_tvalid;
reg										m_axis_tready;
wire									m_axis_tlast;
//TODO a back-pressure is needed?
wire   [C_S_AXIS_DATA_WIDTH-1:0]		c_m_axis_tdata;
wire   [((C_S_AXIS_DATA_WIDTH/8))-1:0]  c_m_axis_tkeep;
wire   [C_S_AXIS_TUSER_WIDTH-1:0]		c_m_axis_tuser;
wire   								    c_m_axis_tvalid;
wire    								c_m_axis_tlast;




assign s_axis_tready = 1'b1;

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
    #(3*CYCLE+CYCLE/2)
    m_axis_tready <= 1'b1;
    s_axis_tdata <= 512'b0; 
    s_axis_tkeep <= 64'h0;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #CYCLE;
    s_axis_tdata <= {65'hffffffffffffffff,64'hffffffff81000002,16'h0002,143'b0, 8'h11, 24'hffff, 16'hf1f2, 32'b0, 16'h0008, 128'hfffffffffffffff}; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #CYCLE
    s_axis_tdata <= {64'hefffffffffffffff,64'hffffffffffffffff,384'hfffffffffffffffffffff}; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #CYCLE
    s_axis_tdata <= {64'hdfffffffffffffff,64'hffffffffffffffff,384'b0}; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #CYCLE
    s_axis_tdata <= {64'hcfffffffffffffff,64'hffffffffffffffff,384'b0}; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #(CYCLE)
    s_axis_tdata <= 512'b0; 
    s_axis_tkeep <= 64'h0;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;
    #(10*CYCLE)

    // s_axis_tdata <= {64'hffffffffffffffff,64'hffffffffffffffff,159'b0, 8'h11, 72'b0, 16'h0008, 128'b0}; 
    // s_axis_tkeep <= 64'hffffffffffffffff;
    // s_axis_tuser <= 128'h0;
    // s_axis_tvalid <= 1'b1;
    // s_axis_tlast <= 1'b0;
    // #CYCLE
    // s_axis_tdata <= {64'hefffffffffffffff,64'hffffffffffffffff,384'b0}; 
    // s_axis_tkeep <= 64'hffffffffffffffff;
    // s_axis_tuser <= 128'h0;
    // s_axis_tvalid <= 1'b1;
    // s_axis_tlast <= 1'b0;
    // #CYCLE
    // s_axis_tdata <= {64'hdfffffffffffffff,64'hffffffffffffffff,384'b0}; 
    // s_axis_tkeep <= 64'hffffffffffffffff;
    // s_axis_tuser <= 128'h0;
    // s_axis_tvalid <= 1'b1;
    // s_axis_tlast <= 1'b0;
    // #CYCLE
    // s_axis_tdata <= {64'hcfffffffffffffff,64'hffffffffffffffff,384'b0}; 
    // s_axis_tkeep <= 64'hffffffffffffffff;
    // s_axis_tuser <= 128'h0;
    // s_axis_tvalid <= 1'b1;
    // s_axis_tlast <= 1'b1;

    #(CYCLE)
    s_axis_tdata <= 512'b0; 
    s_axis_tkeep <= 64'h0;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;

    #(10*CYCLE);
    // s_axis_tdata <= {64'hffffffffffffffff,64'hffffffffffffffff,159'b0, 8'h11, 72'b0, 16'h0008, 128'b0}; 
    // s_axis_tkeep <= 64'hffffffffffffffff;
    // s_axis_tuser <= 128'h0;
    // s_axis_tvalid <= 1'b1;
    // s_axis_tlast <= 1'b0;
    // #CYCLE
    // s_axis_tdata <= {64'hefffffffffffffff,64'hffffffffffffffff,384'b0}; 
    // s_axis_tkeep <= 64'hffffffffffffffff;
    // s_axis_tuser <= 128'h0;
    // s_axis_tvalid <= 1'b1;
    // s_axis_tlast <= 1'b0;
    // #CYCLE
    // s_axis_tdata <= {64'hdfffffffffffffff,64'hffffffffffffffff,384'b0}; 
    // s_axis_tkeep <= 64'hffffffffffffffff;
    // s_axis_tuser <= 128'h0;
    // s_axis_tvalid <= 1'b1;
    // s_axis_tlast <= 1'b0;
    // #CYCLE
    // s_axis_tdata <= {64'hcfffffffffffffff,64'hffffffffffffffff,384'b0}; 
    // s_axis_tkeep <= 64'hffffffffffffffff;
    // s_axis_tuser <= 128'h0;
    // s_axis_tvalid <= 1'b1;
    // s_axis_tlast <= 1'b1;

    #(CYCLE)
    s_axis_tdata <= 512'b0; 
    s_axis_tkeep <= 64'h0;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;

    #(40*CYCLE);
end


pkt_filter_1 #(
	.C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH),
	.C_S_AXIS_TUSER_WIDTH(C_S_AXIS_TUSER_WIDTH)
)pkt_filter
(
	.clk(clk),
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
	.m_axis_tlast(m_axis_tlast),

	//TODO a back-pressure is needed?
	.c_m_axis_tdata(c_m_axis_tdata),
	.c_m_axis_tkeep(c_m_axis_tkeep),
	.c_m_axis_tuser(c_m_axis_tuser),
	.c_m_axis_tvalid(c_m_axis_tvalid),
	.c_m_axis_tlast(c_m_axis_tlast)
);

endmodule