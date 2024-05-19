// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module reg_file(
    input clk,
    input [4:0]raddr0,   /* Read address #0 */
    input [4:0]raddr1,   /* Read address #1 */
    input [4:0]waddr,    /* Write address */
    input [31:0]wdata,   /* Write data */
    input we,            /* Write enable */

    output [31:0]rdata0, /* Read data #0 */
    output [31:0]rdata1  /* Read data #1 */
);

reg [31:0]x[31:0];

`ifdef __ICARUS__
genvar i;
generate
for (i = 0; i < 32; i = i + 1)
begin : reg_init
    initial
        x[i] = 32'b0;
end
endgenerate
`endif

assign rdata0 = (raddr0 != 32'b0) ? x[raddr0] : 32'b0;
assign rdata1 = (raddr1 != 32'b0) ? x[raddr1] : 32'b0;

always @(posedge clk) begin
    if (we) begin
        x[waddr] <= wdata;
    end
end

endmodule
