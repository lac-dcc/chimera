`timescale 1ns / 1ps

module tb_action_engine #(
    parameter C_S_AXIS_DATA_WIDTH = 512,
	parameter C_S_AXIS_TUSER_WIDTH = 128,
    parameter STAGE_ID = 0,
    parameter PHV_LEN = 48*8+32*8+16*8+5*20+256,
    parameter ACT_LEN = 25
)();

reg         clk;
reg         rst_n;
//signals from lookup to ALUs
reg [PHV_LEN-1:0]       phv_in;
reg                     phv_valid_in;
reg [ACT_LEN*25-1:0]    action_in;
reg                     action_valid_in;
//signals output from ALUs
wire [PHV_LEN-1:0]      phv_out;
wire                    phv_valid_out;

reg [C_S_AXIS_DATA_WIDTH-1:0]			c_s_axis_tdata;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]		c_s_axis_tkeep;
reg [C_S_AXIS_TUSER_WIDTH-1:0]			c_s_axis_tuser;
reg										c_s_axis_tvalid;
//wire									s_axis_tready;
reg										c_s_axis_tlast;

wire [C_S_AXIS_DATA_WIDTH-1:0]		    c_m_axis_tdata;
wire [((C_S_AXIS_DATA_WIDTH/8))-1:0]    c_m_axis_tkeep;
wire [C_S_AXIS_TUSER_WIDTH-1:0]		    c_m_axis_tuser;
wire								    c_m_axis_tvalid;
//reg										m_axis_tready;
wire									c_m_axis_tlast;


//clk signal
localparam CYCLE = 10;


always begin
    #(CYCLE/2) clk = ~clk;
end

//reset signal
initial begin
    clk = 0;
    rst_n = 1;
    #(10);
    rst_n = 0; //reset all the values
    #(10);
    rst_n = 1;
end


initial begin
    #(2*CYCLE); //after the rst_n, start the test
    #(5) //posedge of clk    
    /*
        setup new
    */
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    action_in <= 625'b0;
    action_valid_in <= 1'b0;

    #(2*CYCLE)

    /*
        extract values from PHV
    */
    phv_in <= {48'h111111111111,48'h222222222222,172'b1,100'hfffffffffffffffffffffffff,400'b0,356'b0};
    phv_valid_in <= 1'b1;
    //switch the con_6B_7 with con_6B_6
    // action_in <= {4'b0001, 5'd6, 5'd7, 11'b0, 600'b0};
    action_in <= 625'b0;
    action_valid_in <= 1'b1;
    #(CYCLE)
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    action_in <= 625'b0;
    action_valid_in <= 1'b0;
    #(4*CYCLE)
    /*
        extract values from imm
    */
    phv_in <= {48'hffffffffffff,48'heeeeeeeeeeee,672'b0,356'b0};
    //vlan_id
    phv_in[140:129] <= {4'b0,4'd3,4'd0};
    phv_valid_in <= 1'b1;
    //switch the con_6B_7 with con_6B_6
    action_in <= {4'b1010, 5'd6, 16'hffff, 600'b0};
    action_valid_in <= 1'b1;
    #(CYCLE)
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    action_in <= 625'b0;
    action_valid_in <= 1'b0;
    #(4*CYCLE)

    /*
        test store action
    */
    phv_in <= {384'b0,32'hffffffff,224'b0,128'b0,356'b0};
    phv_valid_in <= 1'b1;
    //switch the con_6B_7 with con_6B_6
    action_in <= {200'b0,4'b1000, 5'd7,16'd7,400'b0};
    action_valid_in <= 1'b1;
    #(CYCLE)
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    action_in <= 625'b0;
    action_valid_in <= 1'b0;
    #(4*CYCLE)

    /*
        empty actions to take (return the original value)
    */
    phv_in <= {48'hffffffffffff,48'heeeeeeeeeeee,672'b0,356'b0};
    phv_valid_in <= 1'b1;
    //this is an invalid action
    action_in <= {4'b0000, 5'd6, 16'hffff, 600'b0};
    action_valid_in <= 1'b1;
    #(CYCLE)
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    action_in <= 625'b0;
    action_valid_in <= 1'b0;
    #(4*CYCLE)

    //reset to zeros.
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    action_in <= 625'b0;
    action_valid_in <= 1'b0;

    #(2*CYCLE);
end

initial begin
    #(2*CYCLE); //after the rst_n, start the test
    #(5) //posedge of clk    
    c_s_axis_tdata <= {494'b0,18'hffff};
    c_s_axis_tvalid <= 1'b0;
    c_s_axis_tkeep <= 64'hffffffffffffffff;
    c_s_axis_tuser <= 128'b0;
    c_s_axis_tlast <= 1'b0;

    #(3*CYCLE)
    c_s_axis_tdata <= {128'b0, 4'b0001, 4'b0, 5'b00000, 3'b001, 368'b0};
    c_s_axis_tdata[143:128] <= 16'h0008;
    c_s_axis_tdata[223:216] <= 8'h11;
    c_s_axis_tdata[335:320] <= 16'hf2f1;
    //index
    c_s_axis_tdata[391:384] <= 8'hf;
    //mod id
    c_s_axis_tdata[368+:8] <= 8'd03;
    //resv
    c_s_axis_tdata[380+:4] <= 4'b1;
    c_s_axis_tvalid <= 1'b1;
    c_s_axis_tkeep <= 64'hffffffffffffffff;
    c_s_axis_tuser <= 128'b0;
    c_s_axis_tlast <= 1'b0;
    #(CYCLE)
    c_s_axis_tdata <= {494'b0,18'hffff};
    c_s_axis_tvalid <= 1'b1;
    c_s_axis_tkeep <= 64'hffffffffffffffff;
    c_s_axis_tuser <= 128'b0;
    c_s_axis_tlast <= 1'b1;

    #(CYCLE)
    c_s_axis_tdata <= 512'b0;
    c_s_axis_tvalid <= 1'b0;
    c_s_axis_tkeep <= 64'hffffffffffffffff;
    c_s_axis_tuser <= 128'b0;
    c_s_axis_tlast <= 1'b0;
    
    #(20*CYCLE);
end

action_engine #(
    .STAGE_ID(STAGE_ID),
    .PHV_LEN(),
    .ACT_LEN()
)action_engine(
    .clk(clk),
    .rst_n(rst_n),

    //signals from lookup to ALUs
    .phv_in(phv_in),
    .phv_valid_in(phv_valid_in),
    .action_in(action_in),
    .action_valid_in(action_valid_in),

    //signals output from ALUs
    .phv_out(phv_out),
    .phv_valid_out(phv_valid_out),
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