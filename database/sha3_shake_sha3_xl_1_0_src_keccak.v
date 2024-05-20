// This program was cloned from: https://github.com/ErosCamacho/sha3_shake
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 19:49:22
// Design Name: 
// Module Name: keccak
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


module keccak 
    (
    input               clk,
    input               rst,
    input   [575:0]     S,
    output  [511:0]     S_o,
    input               ini,
    output              fin
    );
    
    wire    [7:0]       round;
    reg     [7:0]       round_clk;
    wire    [1599:0]    S_o_au;
    
    reg   [1599:0]    S_input;
    reg   [1599:0]    S_output;
    
    assign S_o = S_output[511:0];
    
    //keccak_au   keccak_au   (.clk(clk), .rst(rst),  .S(S_input), .S_o(S_o_au),  .round(round_clk));
    keccak_au   keccak_au   (.S(S_input), .S_o(S_o_au),  .round(round_clk));
    keccak_ctl  keccak_ctl  (.clk(clk), .rst(rst),  .ini(ini),  .fin(fin),  .round(round));
    
    //assign S_input = (round == 0) ? S : S_o;
    
    always @(posedge clk) begin
        if(!rst) begin 
            S_input     <= 0;
            S_output    <= 0;
        end
        else begin
            if      (round == 0)                    S_input <= {S_output[1599:576], S ^ S_output[575:0]};
            else if (round_clk == 8'b00010111)      S_input <= S_input;
            else                                    S_input <= S_o_au;
            
            if(fin)                             S_output <= S_o_au;
            else                                S_output <= S_output;
            
            round_clk <= round;
            
        end
        //$display(round);   
    end
    
    /*
    always @(posedge clk) begin
        if(!rst) begin 
            S_input     <= 0;
            S_output    <= 0;
            round_clk   <= 0;
            counter     <= 0;
            flag_store  <= 0;
        end
        else begin
            if(round == 0)                      S_input <= S;
            else if (round[1:0] == 0)           S_input <= S_o_au;
            else                                S_input <= S_input;
            
            if(round_clk == 23) counter <= counter + 1;
            else                counter <= counter;
            
            
            if(counter == 4 & !flag_store)  S_output <= S_o_au[511:0];
            else                            S_output <= S_output;
            
            if(counter == 4) flag_store <= 1;
            else             flag_store <= flag_store;
            
            round_clk <= (round >> 2);
            
        end
        //$display(round);   
    end
    */
    
endmodule


module keccak_stages #(
    parameter STAGES = 2
    )
    (
    input               clk,
    input               rst,
    input   [575:0]     S,
    output  [511:0]     S_o,
    input               load,
    input               ini,
    output              fin
    );
    
    wire    [7:0]       round;
    reg     [7:0]       round_clk;
    wire    [1599:0]    S_o_au [0:STAGES-1];
    
    wire   [1599:0]    S_input;
    reg   [1599:0]    S_output;
    
    wire [1599:0] S_in [0:STAGES-1];
    reg ope_clk;
    
    assign S_o = S_output[511:0];
    assign S_in[0] = S_input;
    
    genvar i;
    generate
        for (i = 0; i < STAGES; i = i + 1) begin
            keccak_au   keccak_au   (.S(S_in[i]), .S_o(S_o_au[i]),  .round(round + i));
            assign S_in[i+1] = S_o_au[i];
        end
    endgenerate

    keccak_ctl_stages #(.STAGES(STAGES)) keccak_ctl_stages (.clk(clk), .rst(rst), .load(load), .ini(ini),  .fin(fin), .ope(ope), .round(round));
   
    assign S_input = (!(ope_clk)) ? {S_output[1599:576], S ^ S_output[575:0]} : S_output;
    
    always @(posedge clk) begin
        if(!rst) begin 
            S_output    <= 0;
        end
        else begin
            
            if(ope) S_output <= S_o_au[STAGES-1];
            else    S_output <= S_output;
            
            round_clk <= round;
            ope_clk <= ope;
            
        end

    end
    
endmodule

module keccak_stages_v2 #(
    parameter STAGES = 2
    )
    (
    input               clk,
    input               rst,
    input   [575:0]     S,
    output  [511:0]     S_o,
    input               load,
    input               ini,
    output              fin
    );
    
    wire    [7:0]       round;
    reg     [7:0]       round_clk;
    wire    [1599:0]    S_o_au [0:STAGES-1];
    
    wire   [1599:0]    S_input;
    reg   [1599:0]    S_REG;
    
    wire [1599:0] S_in [0:STAGES-1];
    reg ope_clk;
    
    assign S_o = S_REG[511:0];
    assign S_in[0] = S_REG;
    
    genvar i;
    generate
        for (i = 0; i < STAGES; i = i + 1) begin
            keccak_au   keccak_au   (.S(S_in[i]), .S_o(S_o_au[i]),  .round(round_clk + i));
            assign S_in[i+1] = S_o_au[i];
        end
    endgenerate

    keccak_ctl_stages #(.STAGES(STAGES)) keccak_ctl_stages (.clk(clk), .rst(rst), .load(load), .ini(ini),  .fin(fin), .ope(ope), .round(round));
   
    assign S_input = (!(ope_clk)) ? {S_REG[1599:576], S ^ S_REG[575:0]} : S_o_au[STAGES-1];
    
    always @(posedge clk) begin
        if(!rst) begin 
            S_REG    <= 0;
        end
        else begin
            
            if(ope | ope_clk)   S_REG <= S_input;
            else                S_REG <= S_REG;
            
            round_clk <= round;
            ope_clk <= ope;
            
        end

    end
    
endmodule

module keccak_stages_v3 #(
    parameter BLOCK_LENGTH = 1152,
    parameter OUTPUT_LENGTH = 224,  
    parameter STAGES = 2,
    parameter STAGES_REG = 1
    )
    (
    input                           clk,
    input                           rst,
    input   [BLOCK_LENGTH - 1:0]    S,
    output  [OUTPUT_LENGTH - 1:0]   S_o,
    input                           load,
    input                           ini,
    output                          fin
    );
    
    wire    [7:0]       round;
    reg     [7:0]       round_clk;
    wire    [1599:0]    S_o_au [0:STAGES-1];
    
    wire   [1599:0]    S_input;
    
    wire [1599:0] S_in [0:STAGES-1];
    reg ope_clk;
    
    genvar i;
    generate
        
        if(STAGES_REG) begin 
            reg  [1599:0] S_REG [0:STAGES-1];
            
            assign S_o = S_REG[STAGES-1][OUTPUT_LENGTH-1:0];
            
            assign S_input = (!(ope_clk)) ? {S_REG[STAGES-1][1599:BLOCK_LENGTH], S ^ S_REG[STAGES-1][BLOCK_LENGTH - 1:0]} : S_o_au[STAGES-1];
            
            for (i = 0; i < STAGES; i = i + 1) begin
                keccak_au   keccak_au   (.S(S_in[i]), .S_o(S_o_au[i]),  .round(round_clk));
                assign S_in[i] = S_REG[i];
            
                always @(posedge clk) begin
                    if(!rst) begin 
                        S_REG[i]    <= 0;
                    end
                    else begin
                        
                        if( i == 0) begin
                            if(ope | ope_clk)   S_REG[i] <= S_input;
                            else                S_REG[i] <= S_REG[i];
                        end
                        else begin
                            if(ope | ope_clk)   S_REG[i] <= S_o_au[i-1];
                            else                S_REG[i] <= S_REG[i];
                        end
                        
                        round_clk <= round;
                        ope_clk <= ope;
                        
                    end
                end
            end
            
            
        end
        else begin
            
            reg  [1599:0] S_REG;
            
            assign S_o = S_REG[OUTPUT_LENGTH-1:0];
            assign S_in[0] = S_REG;
        
            for (i = 0; i < STAGES; i = i + 1) begin
                keccak_au   keccak_au   (.S(S_in[i]), .S_o(S_o_au[i]),  .round(round_clk + i));
                assign S_in[i+1] = S_o_au[i];
            end
            
            assign S_input = (!(ope_clk)) ? {S_REG[1599:BLOCK_LENGTH], S ^ S_REG[(BLOCK_LENGTH-1):0]} : S_o_au[STAGES-1];
    
            always @(posedge clk) begin
                if(!rst) begin 
                    S_REG    <= 0;
                end
                else begin
                    
                    if(ope | ope_clk)   S_REG <= S_input;
                    else                S_REG <= S_REG;
                    
                    round_clk <= round;
                    ope_clk <= ope;
                    
                end
            end
        end
    endgenerate
    
    keccak_ctl_stages #(.STAGES(STAGES)) keccak_ctl_stages (.clk(clk), .rst(rst), .load(load), .ini(ini | ini_shake),  .fin(fin), .ope(ope), .round(round));
   
 endmodule
    
 module keccak_stages_v4 #(
    parameter BLOCK_LENGTH = 1152,
    parameter OUTPUT_LENGTH = 224,  
    parameter STAGES = 2,
    parameter STAGES_REG = 1
    )
    (
    input                           clk,
    input                           rst,
    input   [BLOCK_LENGTH - 1:0]    S,
    output  [OUTPUT_LENGTH - 1:0]   S_o,
    input                           load,
    input                           ini,
    output                          fin
    );
    
    wire    [7:0]       round;
    reg     [7:0]       round_clk;
    wire    [1599:0]    S_o_au [0:STAGES-1];
    
    wire   [1599:0]    S_input;
    
    wire [1599:0] S_in [0:STAGES-1];
    reg ope_clk;
    
    genvar i;
    generate
        
        if(STAGES_REG) begin 
            reg  [1599:0] S_REG [0:STAGES-1];
            
            assign S_o = S_REG[STAGES-1][OUTPUT_LENGTH-1:0];
            
            assign S_input = (!(ope_clk)) ? {S_REG[STAGES-1][1599:BLOCK_LENGTH], S ^ S_REG[STAGES-1][BLOCK_LENGTH - 1:0]} : S_o_au[STAGES-1];
            
            for (i = 0; i < STAGES; i = i + 1) begin
                keccak_au   keccak_au   (.S(S_in[i]), .S_o(S_o_au[i]),  .round(round_clk));
                assign S_in[i] = S_REG[i];
            
                always @(posedge clk) begin
                    if(!rst) begin 
                        S_REG[i]    <= 0;
                    end
                    else begin
                        
                        if( i == 0) begin
                            if(ope | ope_clk)   S_REG[i] <= S_input;
                            else                S_REG[i] <= S_REG[i];
                        end
                        else begin
                            if(ope | ope_clk)   S_REG[i] <= S_o_au[i-1];
                            else                S_REG[i] <= S_REG[i];
                        end
                        
                        round_clk <= round;
                        ope_clk <= ope;
                        
                        
                    end
                end
            end
            
            
        end
        else begin
            
            reg  [1599:0] S_REG;
            
            assign S_o = S_REG[OUTPUT_LENGTH-1:0];
            assign S_in[0] = S_REG;
        
            for (i = 0; i < STAGES; i = i + 1) begin
                keccak_au   keccak_au   (.S(S_in[i]), .S_o(S_o_au[i]),  .round(round_clk + i));
                assign S_in[i+1] = S_o_au[i];
            end
            
            assign S_input = (!(ope_clk)) ? {S_REG[1599:BLOCK_LENGTH], S ^ S_REG[(BLOCK_LENGTH-1):0]} : S_o_au[STAGES-1];
    
            always @(posedge clk) begin
                if(!rst) begin 
                    S_REG    <= 0;
                end
                else begin
                    
                    if(ope | ope_clk)   S_REG <= S_input;
                    else                S_REG <= S_REG;
                    
                    round_clk <= round;
                    ope_clk <= ope;
                    
                    
                end
            end
        end
    endgenerate

    keccak_ctl_stages #(.STAGES(STAGES)) keccak_ctl_stages (.clk(clk), .rst(rst), .load(load), .ini(ini),  .fin(fin), .ope(ope), .round(round));
   
    
endmodule

module keccak_stages_v4_SHAKE #(
    parameter BLOCK_LENGTH = 1152,
    parameter OUTPUT_LENGTH = 224,  
    parameter STAGES = 2,
    parameter STAGES_REG = 1
    )
    (
    input                           clk,
    input                           rst,
    input   [BLOCK_LENGTH - 1:0]    S,
    output  [BLOCK_LENGTH - 1:0]    S_o,
    input                           load,
    input                           ini,
    input                           ini_shake,
    output                          fin
    );
    
    wire    [7:0]       round;
    reg     [7:0]       round_clk;
    wire    [1599:0]    S_o_au [0:STAGES-1];
    
    wire   [1599:0]    S_input;
    
    wire [1599:0] S_in [0:STAGES-1];
    reg ope_clk;
    reg shake;
    
    genvar i;
    generate
        
        if(STAGES_REG) begin 
            reg  [1599:0] S_REG [0:STAGES-1];
            
            assign S_o = S_REG[STAGES-1][BLOCK_LENGTH-1:0];
            
            assign S_input = (!(ope_clk)) ? (shake ? S_REG[STAGES-1] : {S_REG[STAGES-1][1599:BLOCK_LENGTH], S ^ S_REG[STAGES-1][BLOCK_LENGTH - 1:0]}) : S_o_au[STAGES-1];
            
            for (i = 0; i < STAGES; i = i + 1) begin
                keccak_au   keccak_au   (.S(S_in[i]), .S_o(S_o_au[i]),  .round(round_clk));
                assign S_in[i] = S_REG[i];
            
                always @(posedge clk) begin
                    if(!rst) begin 
                        S_REG[i]    <= 0;
                        shake       <= 0;
                    end
                    else begin
                        
                        if( i == 0) begin
                            if(ope | ope_clk)   S_REG[i] <= S_input;
                            else                S_REG[i] <= S_REG[i];
                        end
                        else begin
                            if(ope | ope_clk)   S_REG[i] <= S_o_au[i-1];
                            else                S_REG[i] <= S_REG[i];
                        end
                        
                        round_clk <= round;
                        ope_clk <= ope;
                        
                        if(ini_shake) shake <= 1;
                        else          shake <= shake;
                        
                    end
                end
            end
            
            
        end
        else begin
            
            reg  [1599:0] S_REG;
            
            assign S_o = S_REG[BLOCK_LENGTH-1:0];
            assign S_in[0] = S_REG;
        
            for (i = 0; i < STAGES; i = i + 1) begin
                keccak_au   keccak_au   (.S(S_in[i]), .S_o(S_o_au[i]),  .round(round_clk + i));
                assign S_in[i+1] = S_o_au[i];
            end
            
            assign S_input = (!(ope_clk)) ? (shake ? S_REG : {S_REG[1599:BLOCK_LENGTH], S ^ S_REG[(BLOCK_LENGTH-1):0]}) : S_o_au[STAGES-1];
            //assign S_input = (!(ope_clk)) ? {S_REG[1599:BLOCK_LENGTH], S ^ S_REG[(BLOCK_LENGTH-1):0]} : S_o_au[STAGES-1];
            
            always @(posedge clk) begin
                if(!rst) begin 
                    S_REG    <= 0;
                    shake    <= 0;
                end
                else begin
                    
                    if(ope | ope_clk)   S_REG <= S_input;
                    else                S_REG <= S_REG;
                    
                    round_clk <= round;
                    ope_clk <= ope;
                    
                    if(ini_shake) shake <= 1;
                    else          shake <= shake;
                    
                end
            end
        end
    endgenerate

    keccak_ctl_stages #(.STAGES(STAGES)) keccak_ctl_stages (.clk(clk), .rst(rst & ~ini_shake), .load(load), .ini(ini),  .fin(fin), .ope(ope), .round(round));
    //keccak_ctl_stages #(.STAGES(STAGES)) keccak_ctl_stages (.clk(clk), .rst(rst), .load(load), .ini(ini),  .fin(fin), .ope(ope), .round(round));
    
endmodule