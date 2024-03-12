module microcode(
    input clk,
    input enable,
    input reset,
    input [8:0] addr,
    output reg [31:0] data );

localparam RESET = 9'b111111111;

reg [31:0] rom[0:511];

initial $readmemb( "microcode.hex", rom, 0 );

always @(posedge clk)
    if( enable )
        data <= rom[reset ? RESET : addr];

endmodule
