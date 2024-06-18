// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none

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
    output wire [31:0] rdata
);

    parameter WORDS = 32768; // (128 kB)

    wire [31:0] rd_data;
    wire [3:0] w_enable;

    assign w_enable = (cyc & we) ? sel : 4'b0;

    ice40up5k_spram #(.WORDS(WORDS))
        ram (
        .clk(ck),
        .wen(w_enable),
        .addr(addr[21:0]),
        .wdata(wdata),
        .rdata(rd_data)
        );

    assign rdata = cyc ? rd_data : 0;

endmodule 


