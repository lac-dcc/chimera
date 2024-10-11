// This program was cloned from: https://github.com/ErosCamacho/sha3_shake
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2023 19:02:06
// Design Name: 
// Module Name: keccak_au
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


module keccak_au(
    //input               clk,
    //input               rst,
    input   [1599:0]    S,
    output  [1599:0]    S_o,
    input   [7:0]       round
    );
    
    wire [1599:0] S_theta;
    //reg  [1599:0] S_theta_reg;
    wire [1599:0] S_rho_pi;
    //reg  [1599:0] S_rho_pi_reg;
    wire [1599:0] S_chi;
    //reg  [1599:0] S_chi_reg;
    
    //reg [7:0] round_1;
    //reg [7:0] round_2;
    //reg [7:0] round_3;
    
    theta   theta   (.S(S),         .S_o(S_theta));
    //rho_pi  rho_pi  (.S(S_theta_reg),   .S_o(S_rho_pi));
    rho_pi  rho_pi  (.S(S_theta),   .S_o(S_rho_pi));
    //chi     chi     (.S(S_rho_pi_reg),  .S_o(S_chi));
    chi     chi     (.S(S_rho_pi),  .S_o(S_chi));
    //iota    iota    (.S(S_chi_reg),     .S_o(S_o),      .round(round_3));
    iota    iota    (.S(S_chi),     .S_o(S_o),      .round(round));
    
    // Si hay que añadir una etapa de pipeline se podría hacer entre (theta+rho_pi) y (chi+iota)
    
    /*
    always @(posedge clk) begin
        if(!rst) begin
            S_theta_reg     <= 0;
            S_rho_pi_reg    <= 0;
            S_chi_reg       <= 0;
            
            round_1         <= 0;
            round_2         <= 0;
            round_3         <= 0;
        end
        else begin
            S_theta_reg     <= S_theta;
            S_rho_pi_reg    <= S_rho_pi;
            S_chi_reg       <= S_chi;
            
            round_1         <= round;
            round_2         <= round_1;
            round_3         <= round_2;
        end
    
    end
    */
    
endmodule
