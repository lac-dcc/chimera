// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

module ama_riscv_dmem (
    input  wire        clk,
    input  wire        en,
    input  wire [ 3:0] we,
    input  wire [13:0] addr,
    input  wire [31:0] din,
    output reg  [31:0] dout
);

reg  [31:0] mem[16384-1:0];

// dmem read
always @(posedge clk) begin
    if (en) dout <= mem[addr];
end

// dmem write with byte enable
genvar i;
generate for (i = 0; i < 4; i = i+1) begin
    always @(posedge clk) begin
        if (we[i] && en) mem[addr][i*8 +: 8] <= din[i*8 +: 8];
        end
    end 
endgenerate

endmodule
