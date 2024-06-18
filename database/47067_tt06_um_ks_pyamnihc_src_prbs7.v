// This program was cloned from: https://github.com/pyamnihc/tt06_um_ks_pyamnihc
// License: Apache License 2.0

module prbs7 (
    input clk_i,
    input rst_ni,
    input [6:0] lfsr_init_i,
    input load_prbs_i,
    input freeze_i,
    output prbs_o,
    output [6:0] prbs_frame_o
);
// referenced from, https://en.wikipedia.org/wiki/Pseudorandom_binary_sequence
//                  PRBS7 = x^7 + x^6 + 1

    reg [6:0] lfsr_reg;
    always @(posedge clk_i) begin
        if (!rst_ni) begin
            lfsr_reg <= 'b0;
        end else if (load_prbs_i == 1) begin
            lfsr_reg <= lfsr_init_i;
        end else if (freeze_i == 1) begin
            lfsr_reg <= lfsr_reg;
        end else begin
            lfsr_reg <= {lfsr_reg[5:0], lfsr_reg[6] ^ lfsr_reg[5]};
        end
    end
    
    assign prbs_o = lfsr_reg[6];
    assign prbs_frame_o = lfsr_reg;

endmodule
