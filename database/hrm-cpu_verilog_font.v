`default_nettype none

// ROM with synchonous read (inferring Block RAM)
//  - 8-i_bit ASCII font (2^8=256 characters)
//  - 8-by-8 characters
//  - ROM size: 256x8x8 bits

// INSTANTIATION TEMPLATE BEGIN
//
//     font font0 (
//       .i_clk(  ),
//       .i_addr(  ),
//       .i_bit(  ),
//       .o_data(  )
//     );
//
// INSTANTIATION TEMPLATE END

module font (
    input  wire         i_clk,         // Pixel clock.
    input  wire [10:0]  i_addr,        // i_addr in rom (row)
    input  wire [ 2:0]  i_bit,         // 
    output wire         o_data         // output (1bit)
);

    parameter FONT_FILE = "font256x8x8.rom";

    reg [7:0] rom [0:256*8-1];
    
    initial begin
        $readmemb(FONT_FILE, rom);
    end

    reg [7:0] data_r;
    reg [2:0] bit_r; // we save the i_bit number for after the bram read
    always @(posedge i_clk) begin
        data_r <= rom[i_addr];
        bit_r <= i_bit;
    end

    // here we use the bit_r number, we saved earlier (previous i_clk)
    assign o_data = data_r[bit_r];
    
endmodule
