
module top (
    // Clocks
    //input  wire           CLK50M,
    input  wire           CLK27M,
    // LED
    output wire [ 3:0]    LED,
    // USB-UART
    input  wire           UART_RX,
    output wire           UART_TX,
    // EPCS
    //output wire           EPCS_NCS, EPCS_DCLK, EPCS_ASDO,
    //input  wire           EPCS_DATA0,
    // SPI-Flash
    output wire           FLASH_CS, FLASH_SCK, FLASH_MOSI,
    input  wire           FLASH_MISO, 
    // SD-card
    output wire           SD_CLK,
    inout                 SD_CMD,
    inout       [ 3:0]    SD_DAT,
    // USER IO Group A,
    inout       [13:0]    IOA,
    // USER IO Group B and C
    inout       [23:0]    IOB, IOC
);


// --------------------------------------------------------------------------------------------------------------
//  set unused pins
// --------------------------------------------------------------------------------------------------------------
assign FLASH_CS   = 1'bz;
assign FLASH_SCK  = 1'bz;
assign FLASH_MOSI = 1'bz;

assign SD_CLK = 1'bz;
assign SD_CMD = 1'bz;
assign SD_DAT = 4'bzzzz;

assign IOA = 7'hz;
assign IOB = 18'hz;
assign IOC = 18'hz;


localparam  [7:0] CHAR_A = "A",
                  CHAR_Z = "Z";

wire        rxvalid;
wire [ 7:0] rxdata;

reg         txvalid = 1'b0;
reg  [ 7:0] txdata  = 8'h0;


// --------------------------------------------------------------------------------------------------------------
//  UART RX : receive bytes
// --------------------------------------------------------------------------------------------------------------
uart_rx #(
    .CLK_FREQ                  ( 27000000               ),
    .BAUD_RATE                 ( 115200                 ),
    .PARITY                    ( "NONE"                 ),
    .FIFO_EA                   ( 0                      )
) u_uart_rx (
    .rstn                      ( 1'b1                   ),
    .clk                       ( CLK27M                 ),
    .i_uart_rx                 ( UART_RX                ),
    .o_tready                  ( 1'b1                   ),
    .o_tvalid                  ( rxvalid                ),
    .o_tdata                   ( rxdata                 ),
    .o_overflow                (                        )
);


// --------------------------------------------------------------------------------------------------------------
//  convert received bytes from upper case to lower case
// --------------------------------------------------------------------------------------------------------------
always @ (posedge CLK27M) begin
    txvalid <= rxvalid;
    txdata  <= (rxdata >= CHAR_A && rxdata <= CHAR_Z) ? (rxdata + 8'd32) : rxdata;
end


// --------------------------------------------------------------------------------------------------------------
//  UART TX : send bytes
// --------------------------------------------------------------------------------------------------------------
uart_tx #(
    .CLK_FREQ                  ( 27000000               ),
    .BAUD_RATE                 ( 115200                 ),
    .PARITY                    ( "NONE"                 ),
    .STOP_BITS                 ( 4                      ),
    .BYTE_WIDTH                ( 1                      ),
    .FIFO_EA                   ( 8                      ),
    .EXTRA_BYTE_AFTER_TRANSFER ( ""                     ),
    .EXTRA_BYTE_AFTER_PACKET   ( ""                     )
) u_uart_tx (
    .rstn                      ( 1'b1                   ),
    .clk                       ( CLK27M                 ),
    .i_tready                  (                        ),
    .i_tvalid                  ( txvalid                ),
    .i_tdata                   ( txdata                 ),
    .i_tkeep                   ( 1'b1                   ),
    .i_tlast                   ( 1'b0                   ),
    .o_uart_tx                 ( UART_TX                )
);


assign LED = {2'b0, UART_RX, UART_TX};


endmodule
