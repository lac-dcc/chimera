
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
    parameter PHV_LEN = 48*8+32*8+16*8+256
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
wire						phv_out_valid;

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
	// configure stateful page table
	// stage 2, page table for vid 1 and 2
	//ctrl 1
    #CYCLE
    s_axis_tdata <= 512'h000000000000000000000000000000010000902f2e00f2f1d204dededede6f6f6f6f0ede1140000001004200004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000270e250d230c910ba108; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;
	// ctrl 2
    #(20*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000010005902a2e00f2f1d204dededede6f6f6f6f0ede1140000001004200004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000270e250d230c910ba108; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;

    // ctrl 3
    #(20*CYCLE)
    s_axis_tdata <= 512'h0000000000000000000000000000000100014f5e1f00f2f1d204dededede6f6f6f6f1dde1140000001003300004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0000; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;

    // ctrl 4
    #(20*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000010f0117ea3300f2f1d204dededede6f6f6f6f09de1140000001004700004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000080ffff0000ffffffffffffffffffffffffffffffffffffffff; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;

    // ctrl 5
    #(20*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000000000275683400f2f1d204dededede6f6f6f6f08de1140000001004800004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000a00100000000000000000000000000000000000000001000; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;

    // ctrl 6
    #(20*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000000f02e83c6900f2f1d204dededede6f6f6f6fd3dd1140000001007d00004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000f00001e00003c0000780000f00000e00100c003008007808c0200001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f0; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #CYCLE
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f00000e00100c00300800700; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;


    // ctrl 7
    #(20*CYCLE)
    s_axis_tdata <= 512'h00000000000000000000000000000001000245683400f2f1d204dededede6f6f6f6f08de1140000001004800004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #CYCLE
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000d00000000000000000000000000000000000000000001000; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;

    // ctrl 8
    #(20*CYCLE)
    s_axis_tdata <= 512'h000000000000000000000000000000010f02e93b6900f2f1d204dededede6f6f6f6fd3dd1140000001007d00004500080f0000810504030201000b0a09080706; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
	#CYCLE
    s_axis_tdata <= 512'h000f00001e00003c0000780000f00000e00100c003008007808c0100001e00003c0000780000f00000e00100c00300800700000f00001e00003c0000780000f0; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #CYCLE
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f00000e00100c00300800700; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;

    // data 1
    #(20*CYCLE)
    s_axis_tdata <= 512'h000000000000000004000000020000000d001a205a0013001300090000006f6f6f6f979b1140000001006e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'hffffffffffffffff;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b0;
    #CYCLE
    s_axis_tdata <= 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;

    // data 2
    #(20*CYCLE)
    s_axis_tdata <= 512'h000000000000000002000000040000001a008d201a0013001300090000006f6f6f6fd79b1140000001002e000045000801000081a401bdfefd3c050000000000; 
    s_axis_tkeep <= 64'h0000000000000003;
    s_axis_tuser <= 128'h00000000000000000000000000000040;
    s_axis_tvalid <= 1'b1;
    s_axis_tlast <= 1'b1;
    #CYCLE
	s_axis_tvalid <= 1'b0;
	s_axis_tlast <= 1'b0;



    #(10*CYCLE)
    s_axis_tdata <= 512'b0; 
    s_axis_tkeep <= 64'h0;
    s_axis_tuser <= 128'h0;
    s_axis_tvalid <= 1'b0;
    s_axis_tlast <= 1'b0;

end

/*
stage #(
    .STAGE(0),  //valid: 0-4
    .PHV_LEN(),
    .KEY_LEN(),
    .ACT_LEN(),
    .KEY_OFF()
)
stage0
(
    .axis_clk			(clk),
    .aresetn			(aresetn),

    .phv_in				(phv_in),
    .phv_in_valid		(phv_in_valid),
    .phv_out			(phv_out),
    .phv_out_valid		(phv_out_valid),

	.stg_ready			()

    //input for the key extractor RAM
    // input  [KEY_OFF-1:0]         key_offset_in,
    // input                        key_offset_valid_in

    //TODO need control channel
);*/

rmt_wrapper #(
	.C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH)
)rmt_wrapper_ins
(
	.clk(clk),		// axis clk
	.aresetn(aresetn),	

	.vlan_drop_flags(0),
	.cookie_val(),
	.ctrl_token(),

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
