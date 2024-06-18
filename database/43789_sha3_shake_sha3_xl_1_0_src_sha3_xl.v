// This program was cloned from: https://github.com/ErosCamacho/sha3_shake
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2023 12:06:55
// Design Name: 
// Module Name: sha3_xl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sha3_xl#(
    parameter SHAKE = 1,
    parameter OUTPUT_LENGTH = 256, 
    parameter BLOCK_LENGTH = 1600 - (2*OUTPUT_LENGTH), 
    parameter OUTPUT_LENGTH_CEIL = ceil(OUTPUT_LENGTH,64),
    parameter STAGES = 1,
    parameter STAGES_REG = 0,
    parameter D_WIDTH = 64
    )(
    input                   i_clk,
    input                   i_reset,
    input   [D_WIDTH-1:0]   i_data_in,
    input   [4:0]           i_add,
    input   [7:0]           i_control,
    output  [D_WIDTH-1:0]   o_data_out,
    output                  o_end_op
    );
    
    wire    [BLOCK_LENGTH - 1:0] P;
    
    wire fin;
    
    wire rst;
    wire load_padding;
    wire start_padding;
    wire load;
    wire start;
    wire read;
    wire start_padding_double;
    wire start_shake;
    
    assign rst                  = ~i_control[0] && i_reset;
    assign load_padding         = i_control[1];
    assign start_padding        = i_control[2];
    assign load                 = i_control[3];
    assign start                = i_control[4];
    assign read                 = i_control[5];
    assign start_padding_double = i_control[6];
    assign start_shake          = i_control[7];
    
    assign o_end_op = fin;
    
    //input_module    #(.BLOCK_LENGTH(BLOCK_LENGTH), .D_WIDTH(D_WIDTH)) 
    //input_module     (.clk(i_clk), .reset(i_reset), .data_in(i_data_in), .add(i_add), .control(i_control), .P(P));
    
    genvar i;
    generate
        if(SHAKE == 0) begin
                
                wire    [64*OUTPUT_LENGTH_CEIL - 1:0] P_o;
                wire    [63:0]  P_out [0:(OUTPUT_LENGTH_CEIL - 1)];
                
                for (i = 0; i < OUTPUT_LENGTH_CEIL; i = i + 1) begin
                    assign P_out[i] = P_o[(((i+1)*64)-1):(i*64)];
                end
                
                input_module_GEN    #(.BLOCK_LENGTH(BLOCK_LENGTH), .D_WIDTH(D_WIDTH)) 
                input_module_GEN     (.clk(i_clk), .reset(i_reset), .data_in(i_data_in), .add(i_add), .control(i_control), .P(P));
                
                keccak_stages_v4    #(.BLOCK_LENGTH(BLOCK_LENGTH), .OUTPUT_LENGTH(OUTPUT_LENGTH), .STAGES(STAGES), .STAGES_REG(STAGES_REG)) 
                keccak               (.clk(i_clk), .rst(rst), .S(P), .S_o(P_o), .load(load), .ini(start), .fin(fin));
                
                assign o_data_out = P_out[i_add];
        end
        else begin
        
                wire    [BLOCK_LENGTH - 1:0] P_o;
                wire    [63:0]  P_out [0:((BLOCK_LENGTH/64) - 1)];
        
                for (i = 0; i < (BLOCK_LENGTH/64); i = i + 1) begin
                    assign P_out[i] = P_o[(((i+1)*64)-1):(i*64)];
                end
        
                input_module_GEN_SHAKE    #(.BLOCK_LENGTH(BLOCK_LENGTH), .D_WIDTH(D_WIDTH)) 
                input_module_GEN_SHAKE     (.clk(i_clk), .reset(i_reset), .data_in(i_data_in), .add(i_add), .control(i_control), .P(P));
                
                keccak_stages_v4_SHAKE    #(.BLOCK_LENGTH(BLOCK_LENGTH), .OUTPUT_LENGTH(OUTPUT_LENGTH), .STAGES(STAGES), .STAGES_REG(STAGES_REG)) 
                keccak                     (.clk(i_clk), .rst(rst), .S(P), .S_o(P_o), .load(load), .ini(start), .ini_shake(start_shake), .fin(fin));
        
                assign o_data_out = P_out[i_add];
        end
    endgenerate
    // clog2 function 
    function integer clog2;
      input integer n;
        for (clog2=0; n>0; clog2=clog2+1)
          n = n >> 1;
    endfunction
    
    // ceil function 
    function integer ceil;
      input integer n;
      input integer b;
        for (ceil=0; n>0; ceil=ceil+1)
          n = n - b;
    endfunction
     
endmodule
