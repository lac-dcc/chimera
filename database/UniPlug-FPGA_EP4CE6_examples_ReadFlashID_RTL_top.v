
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
assign SD_CLK = 1'bz;
assign SD_CMD = 1'bz;
assign SD_DAT = 4'bzzzz;

assign IOA = 7'hz;
assign IOB = 18'hz;
assign IOC = 18'hz;


// --------------------------------------------------------------------------------------------------------------
//  signals
// --------------------------------------------------------------------------------------------------------------
reg         rstn = 1'b0;

wire        rxvalid;
wire [ 7:0] rxdata;

wire        flash_id_valid;
wire [15:0] flash_id;


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
//  when receiving a char "r" from UART, reset the system
// --------------------------------------------------------------------------------------------------------------
always @ (posedge CLK27M)
    rstn <= ~(rxvalid && rxdata=="r");


// --------------------------------------------------------------------------------------------------------------
//  get ID from W25QXX SPI flash
// --------------------------------------------------------------------------------------------------------------
flash_w25qxx_get_id u_flash_w25qxx_get_id (
    .rstn                      ( rstn                   ),
    .clk                       ( CLK27M                 ),
    .spi_ss                    ( FLASH_CS               ),
    .spi_sck                   ( FLASH_SCK              ),
    .spi_mosi                  ( FLASH_MOSI             ),
    .spi_miso                  ( FLASH_MISO             ),
    .id_valid                  ( flash_id_valid         ),
    .id                        ( flash_id               )
);


// --------------------------------------------------------------------------------------------------------------
//  send the flash ID to UART
// --------------------------------------------------------------------------------------------------------------
uart_tx #(
    .CLK_FREQ                  ( 27000000               ),
    .BAUD_RATE                 ( 115200                 ),
    .PARITY                    ( "NONE"                 ),
    .STOP_BITS                 ( 4                      ),
    .BYTE_WIDTH                ( 2                      ),
    .FIFO_EA                   ( 8                      ),
    .EXTRA_BYTE_AFTER_TRANSFER ( ""                     ),
    .EXTRA_BYTE_AFTER_PACKET   ( ""                     )
) u_uart_tx (
    .rstn                      ( rstn                   ),
    .clk                       ( CLK27M                 ),
    .i_tready                  (                        ),
    .i_tvalid                  ( flash_id_valid         ),
    .i_tdata                   ( flash_id               ),
    .i_tkeep                   ( 2'b11                  ),
    .i_tlast                   ( 1'b0                   ),
    .o_uart_tx                 ( UART_TX                )
);


assign LED = flash_id[3:0];


endmodule
