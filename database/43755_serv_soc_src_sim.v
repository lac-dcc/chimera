// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none

   /*
    *
    */

module sp_ram 
(   
    input wire ck,
    input wire cyc,
    input wire we,
    input wire [3:0] sel,
    /* verilator lint_off UNUSED */
    input wire [31:0] addr,
    /* verilator lint_on UNUSED */
    input wire [31:0] wdata,
    output reg [31:0] rdata
);

    wire [3:0] w_enable;

    assign w_enable = (cyc & we) ? sel : 4'b0;

    parameter WORDS = 256;

    reg [31:0] mem [0:WORDS-1];

    always @(posedge ck) begin
        rdata <= mem[addr];
        if (w_enable[0]) mem[addr][ 7: 0] <= wdata[ 7: 0];
        if (w_enable[1]) mem[addr][15: 8] <= wdata[15: 8];
        if (w_enable[2]) mem[addr][23:16] <= wdata[23:16];
        if (w_enable[3]) mem[addr][31:24] <= wdata[31:24];
    end

endmodule

