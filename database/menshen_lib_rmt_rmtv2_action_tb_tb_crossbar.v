`timescale 1ns / 1ps

module tb_crossbar #(
    parameter STAGE = 0,
    parameter PHV_LEN = 48*8+32*8+16*8+5*20+256,
    parameter ACT_LEN = 25,
    parameter width_2B = 16,
    parameter width_4B = 32,
    parameter width_6B = 48
)();


reg clk;
reg rst_n;
//input from PHV
reg [PHV_LEN-1:0]           phv_in;
reg                         phv_in_valid;
//input from action
reg [ACT_LEN*25-1:0]        action_in;
reg                         action_in_valid;
//output to the ALU
wire                    alu_in_valid;
wire [width_6B*8-1:0]   alu_in_6B_1;
wire [width_6B*8-1:0]   alu_in_6B_2;
wire [width_4B*8-1:0]   alu_in_4B_1;
wire [width_4B*8-1:0]   alu_in_4B_2;
wire [width_4B*8-1:0]   alu_in_4B_3;
wire [width_2B*8-1:0]   alu_in_2B_1;
wire [width_2B*8-1:0]   alu_in_2B_2;
wire [355:0]            phv_remain_data;

//clk signal
localparam CYCLE = 10;
wire [width_6B-1:0] con_6B_7_in;
wire [width_6B-1:0] con_6B_6_in;

assign con_6B_7_in = phv_in[PHV_LEN-1            -: width_6B];
assign con_6B_6_in = phv_in[PHV_LEN-1-width_6B   -: width_6B];


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
    phv_in_valid <= 1'b0;
    action_in <= 625'b0;
    action_in_valid <= 1'b0;

    #(2*CYCLE)

    /*
        extract values from PHV
    */
    phv_in <= {48'hfffffffffffe,48'heeeeeeeeeeef,672'b0,356'b0};
    phv_in_valid <= 1'b1;
    //switch the con_6B_7 with con_6B_6
    action_in <= {4'b0001, 5'd6, 5'd7, 11'b0, 600'b0};
    action_in_valid <= 1'b1;
    #(CYCLE)
    phv_in <= 1124'b0;
    phv_in_valid <= 1'b0;
    action_in <= 625'b0;
    action_in_valid <= 1'b0;
    #(CYCLE)
    /*
        extract values from imm
    */
    phv_in <= {48'hffffffffffff,48'heeeeeeeeeeee,672'b0,356'b0};
    phv_in_valid <= 1'b1;
    //switch the con_6B_7 with con_6B_6
    action_in <= {4'b1010, 5'd6, 16'hffff, 600'b0};
    action_in_valid <= 1'b1;
    #(CYCLE)
    phv_in <= 1124'b0;
    phv_in_valid <= 1'b0;
    action_in <= 625'b0;
    action_in_valid <= 1'b0;
    #(CYCLE)
    /*
        empty actions to take (return the original value)
    */
    phv_in <= {48'hffffffffffff,48'heeeeeeeeeeee,672'b0,356'b0};
    phv_in_valid <= 1'b1;
    //this is an invalid action
    action_in <= {4'b0000, 5'd6, 16'hffff, 600'b0};
    action_in_valid <= 1'b1;
    #(CYCLE)
    phv_in <= 1124'b0;
    phv_in_valid <= 1'b0;
    action_in <= 625'b0;
    action_in_valid <= 1'b0;
    #(CYCLE)

    //reset to zeros.
    phv_in <= 1124'b0;
    phv_in_valid <= 1'b0;
    action_in <= 625'b0;
    action_in_valid <= 1'b0;

    #(2*CYCLE);
end


crossbar #(
    .STAGE(STAGE),
    .PHV_LEN(),
    .ACT_LEN(),
    .width_2B(),
    .width_4B(),
    .width_6B()
)crossbar_1(
    .clk(clk),
    .rst_n(rst_n),
    //input from PHV
    .phv_in(phv_in),
    .phv_in_valid(phv_in_valid),
    //input from action
    .action_in(action_in),
    .action_in_valid(action_in_valid),
    //output to the ALU
    .vlan_id(vlan_id),
    .alu_in_valid(alu_in_valid),
    .alu_in_6B_1(alu_in_6B_1),
    .alu_in_6B_2(alu_in_6B_2),
    .alu_in_4B_1(alu_in_4B_1),
    .alu_in_4B_2(alu_in_4B_2),
    .alu_in_4B_3(alu_in_4B_3),
    .alu_in_2B_1(alu_in_2B_1),
    .alu_in_2B_2(alu_in_2B_2),
    .phv_remain_data(phv_remain_data)
);
endmodule