`timescale 1ns / 1ps

module tb_alu_2 #(
    parameter C_S_AXIS_DATA_WIDTH = 512,
	parameter C_S_AXIS_TUSER_WIDTH = 128,
    parameter STAGE_ID = 0,
    parameter ACTION_LEN = 25,
    parameter DATA_WIDTH = 32
)();


reg                             clk;
reg                             rst_n;
//input from sub_action
reg [11:0]                      vlan_id;
reg [ACTION_LEN-1:0]            action_in;
reg                             action_valid;
reg [DATA_WIDTH-1:0]            operand_1_in;
reg [DATA_WIDTH-1:0]            operand_2_in;
reg [DATA_WIDTH-1:0]            operand_3_in;

//output to form PHV
wire [DATA_WIDTH-1:0]           container_out;
wire                            container_out_valid;

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
        ADD ---> 0001
    */
    action_in <= {4'b0001, 21'b0010001001};
    action_valid <= 1'b1;
    operand_1_in <= 32'b1;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;
    vlan_id <= {4'b0, 4'd2, 4'b0};
    #(CYCLE)
    action_in <= 25'b0;
    action_valid <= 1'b0;
    operand_1_in <= 32'b0;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'b0;
    vlan_id <= {4'b0, 4'd0, 4'b0};
    #(4*CYCLE)

    /*
        SUB ---> 0010
    */
    action_in <= {4'b0010, 21'b0010001001};
    action_valid <= 1'b1;
    operand_1_in <= 32'd20;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;
    vlan_id <= {4'b0, 4'd2, 4'b0};

    #(CYCLE)
    action_in <= 25'b0;
    action_valid <= 1'b0;
    operand_1_in <= 32'b0;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;
    #(4*CYCLE)

    /*
        illegitimate action
    */
    action_in <= {4'b0011, 21'b0010001001};
    action_valid <= 1'b1;
    vlan_id <= {4'b0, 4'd3, 4'b0};
    operand_1_in <= 32'd20;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;
    #(CYCLE)
    action_in <= 25'b0;
    action_valid <= 1'b0;
    vlan_id <= {4'b0, 4'd0, 4'b0};
    operand_1_in <= 32'b0;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;
    #(4*CYCLE)

    /*
        store action
    */
    action_in <= {4'b1000, 5'b00100, 16'b11111111};
    action_valid <= 1'b1;
    vlan_id <= {4'b0, 4'd4, 4'b0};
    operand_1_in <= 32'd20;
    operand_2_in <= 32'd0;
    operand_3_in <= 32'd12;
    #(CYCLE)
    action_in <= 25'b0;
    action_valid <= 1'b0;
    vlan_id <= {4'b0, 4'd0, 4'b0};
    operand_1_in <= 32'b0;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;
    #(4*CYCLE)

    /*
        load action
    */
    action_in <= {4'b1011, 5'b00100, 16'b11111111};
    action_valid <= 1'b1;
    vlan_id <= {4'b0, 4'd5, 4'b0};
    operand_1_in <= 32'd20;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;
    #(CYCLE)
    action_in <= 25'b0;
    action_valid <= 1'b0;
    vlan_id <= {4'b0, 4'd0, 4'b0};
    operand_1_in <= 32'b0;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;
    #(4*CYCLE)

    /*
        loadd action
    */
    action_in <= {4'b0111, 5'b00100, 16'b11111111};
    action_valid <= 1'b1;
    vlan_id <= {4'b0, 4'd5, 4'b0};
    operand_1_in <= 32'd20;  
    operand_2_in <= 32'd0;  //load virtual addr
    operand_3_in <= 32'd12;
    #(CYCLE)
    action_in <= 25'b0;
    action_valid <= 1'b0;
    vlan_id <= {4'b0, 4'd0, 4'b0};
    operand_1_in <= 32'b0;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;
    #(4*CYCLE)

    /*
        reset to IDLE
    */
    action_in <= 25'b0;
    action_valid <= 1'b0;
    operand_1_in <= 32'b0;
    operand_2_in <= 32'd3;
    operand_3_in <= 32'd12;

    #(30*CYCLE);
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


alu_2 #(
    .STAGE_ID(STAGE_ID),
    .ACTION_LEN(),
    .DATA_WIDTH(),  //data width of the ALU
	.C_S_AXIS_DATA_WIDTH(),
	.C_S_AXIS_TUSER_WIDTH()
)alu_2_0(
    .clk(clk),
    .rst_n(rst_n),

    //input from sub_action
    .action_in(action_in),
    .action_valid(action_valid),
    .operand_1_in(operand_1_in),
    .operand_2_in(operand_2_in),
    .operand_3_in(operand_3_in),

    .vlan_id(vlan_id),
    .container_out(container_out),
    .container_out_valid(container_out_valid),

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