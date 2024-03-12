`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: Ridotech
// Engineer: Juan Manuel Rico
//
// Create Date: 21:30:38 26/04/2018
// Module Name: fontROM
//
// Description: Font ROM for numbers (16x19 bits for numbers 0 to 9).
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
//
//-----------------------------------------------------------------------------
//-- GPL license
//-----------------------------------------------------------------------------
module fontROM 
#(
    parameter FONT_FILE = "font.list",
    parameter addr_width = 6,
    parameter data_width = 4
)
(
    input wire                  clk,
    input wire [addr_width-1:0] addr,
    output reg [data_width-1:0] dout
);

    reg [data_width-1:0] mem [(1 << addr_width)-1:0];

    initial begin
        /* verilator lint_off WIDTH */
        if (FONT_FILE) $readmemb(FONT_FILE, mem);
        /* verilator lint_on WIDTH */
    end

    always @(posedge clk)
        begin
            dout <= mem[addr];
        end

endmodule
`default_nettype wire
