`default_nettype none
`define MMIO_SUPPORT

module mem_wrapper #(
        parameter data_width = 8,
        parameter addr_width=8
    ) (
        input  wire                  clk,
        input  wire [addr_width-1:0] addr,
        input  wire [data_width-1:0] din,
        input  wire                  write_en,
        input  wire                  mmio,
        input  wire                  rst,
        output reg  [data_width-1:0] dout,
        output reg  [7:0]            o_leds
    );

`ifdef MMIO_SUPPORT
    wire cs_RAM0 = ~mmio;
    wire cs_XALU =  mmio & ( addr[7:4] == 4'h0 );
    wire cs_LEDS =  mmio & ( addr == 8'h10 );
    wire cs_RAND =  mmio & ( addr == 8'h11 );
`else
    wire cs_RAM0 = 1'b 1;
`endif

    // ---------------------------------------- //
    // RAM
    //
    parameter ROMFILE = "";

    wire [data_width-1:0] ram0_dout;
    ram #( .addr_width( 8 ), .data_width( 8 ) ) ram0 (
    // read port
        .clk( clk ),
        .addr( addr ),
        .dout( ram0_dout ),
    // write port
        .write_en( write_en & cs_RAM0 ),
        .din( din )
    );
    defparam ram0.ROMFILE = ROMFILE;
    // ---------------------------------------- //

`ifdef MMIO_SUPPORT
    // ---------------------------------------- //
    // XALU - Extended ALU
    //
    wire [data_width-1:0] xalu_dout;
    XALU #( .BASE_ADDR( 8'h00 ), .data_width( 8 ) ) xalu0 (
        .clk( clk ),
        .addr( addr ),
        .dout( xalu_dout ),
        .write_en( write_en & cs_XALU ),
        .din( din ),
        .rst( rst )
    );
    // ---------------------------------------- //

    // ---------------------------------------- //
    // LEDS (convenience module to have consistent 
    // modules topology)
    //
    wire [data_width-1:0] leds_dout;
    LEDS #( .BASE_ADDR( 8'h10 ), .data_width( 8 ) ) leds0 (
        .clk( clk ),
        .addr( addr ),
        .dout( leds_dout ),
        .write_en( write_en & cs_LEDS ),
        .din( din ),
        .rst( rst )
    );
    // ---------------------------------------- //

    // ---------------------------------------- //
    // RANDOM 
    //
    wire [data_width-1:0] rand_dout;
    RAND rand0 (
        .clk( clk ),
        .addr( addr ),
        .dout( rand_dout ),
        .write_en( write_en & cs_RAND ),
        .din( din ),
        .rst( rst )
    );
    // ---------------------------------------- //
`endif

    // ---------------------------------------- //
    // MUX mem_wrapper output
    always @*
    begin
        case (1'b1)
            cs_RAM0: dout = ram0_dout;
`ifdef MMIO_SUPPORT
            cs_XALU: dout = xalu_dout;
            cs_LEDS: dout = leds_dout;
            cs_RAND: dout = rand_dout;
`endif

            default: dout = {(data_width){1'b 0}};
        endcase

`ifdef MMIO_SUPPORT
        o_leds = leds_dout;
`else
        o_leds = 8'b 0;
`endif
    end
    // ---------------------------------------- //

endmodule
