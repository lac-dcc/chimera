// This program was cloned from: https://github.com/suyashmahar/RISC-processor
// License: MIT License

`timescale 1ns / 1ps

module RegisterFile (
    input wire 		 clk_i,
    
    input wire [4 : 0] 	 w_add_i,
    input wire [31 : 0]  w_dat_i,
    input wire 		 write_en_i,
    
    input wire [4 : 0] 	 a_add_sel,
    input wire [4 : 0] 	 b_add_sel,

    output wire [31 : 0] r_port_a_o,
    output wire [31 : 0] r_port_b_o
);

    reg [31 : 0] mem [31 : 0];  // 32, 32-bit registers

    // Write to particular register at posedge clk
    always @(posedge clk_i) begin
        if (write_en_i) begin
            if (w_add_i != 5'b11111) begin
                mem[w_add_i] = w_dat_i;
            end
        end
    end

   assign r_port_a_o = (a_add_sel != 5'b11111) ? mem[a_add_sel] : 32'h00000000;
   assign r_port_b_o = (b_add_sel != 5'b11111) ? mem[b_add_sel] : 32'h00000000;
   
endmodule
