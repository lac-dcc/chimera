`timescale 1ns / 1ps

module tb_alu_1 #(
    parameter STAGE_ID = 0,
    parameter ACTION_LEN = 25,
    parameter DATA_WIDTH = 48
)();

localparam STAGE_P = 0;


reg clk;
reg rst_n;
//input from sub_action
reg [ACTION_LEN-1:0]            action_in;
reg                             action_valid;
reg [DATA_WIDTH-1:0]            operand_1_in;
reg [DATA_WIDTH-1:0]            operand_2_in;
//output to form PHV
wire [DATA_WIDTH-1:0]           container_out;
wire                            container_out_valid;

//clk signal
localparam CYCLE = 10;
localparam width_6B = 48;

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
    operand_1_in <= 48'b1;
    operand_2_in <= 48'd3;
    #(CYCLE)
    action_in <= 25'b0;
    action_valid <= 1'b0;
    operand_1_in <= 48'b0;
    operand_2_in <= 48'd3;
    #(5*CYCLE)

    /*
        SUB ---> 0010
    */
    action_in <= {4'b0010, 21'b0010001001};
    action_valid <= 1'b1;
    operand_1_in <= 48'd20;
    operand_2_in <= 48'd3;
    #(CYCLE)
    action_in <= 25'b0;
    action_valid <= 1'b0;
    operand_1_in <= 48'b0;
    operand_2_in <= 48'd3;
    #(5*CYCLE)

    /*
        illegitimate action
    */
    action_in <= {4'b0011, 21'b0010001001};
    action_valid <= 1'b1;
    operand_1_in <= 48'd20;
    operand_2_in <= 48'd3;
    #(CYCLE)
    action_in <= 25'b0;
    action_valid <= 1'b0;
    operand_1_in <= 48'b0;
    operand_2_in <= 48'd3;
    #(CYCLE);

end


alu_1  #(
    .STAGE_ID(STAGE_ID),
    .ACTION_LEN(),
    .DATA_WIDTH(width_6B)
)alu_1_0(
    .clk(clk),
    .rst_n(rst_n),
    .action_in(action_in),
    .action_valid(action_valid),
    .operand_1_in(operand_1_in),
    .operand_2_in(operand_2_in),
    .container_out(container_out),
    .container_out_valid(container_out_valid)
);

endmodule