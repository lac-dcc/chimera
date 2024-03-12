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

reg [31:0]x[31:0]; /* Array of registers x0-x31 */

genvar i;
generate
for (i = 0; i < 32; i = i + 1)
begin : reg_init
    initial
        x[i] = 32'b0; /* Set initial value of x[i] to 0 */
end
endgenerate

/*
* Problem 2:
* Describe read logic here.
* Don't forget about x0 register.
*/

always @(posedge clk) begin
    /*
    * Problem 2:
    * Describe write logic here.
    */
    $strobe("CPUv1: x0: %h x4: %h  x8: %h x12: %h\nCPUv1: x1: %h x5: %h  x9: %h x13: %h\nCPUv1: x2: %h x6: %h x10: %h x14: %h\nCPUv1: x3: %h x7: %h x11: %h x15: %h",
            32'b0, x[4],   x[8],  x[12],   x[1],  x[5],   x[9],  x[13],   x[2],  x[6],  x[10],  x[14],   x[3],  x[7],  x[11],  x[15]);
end

endmodule
