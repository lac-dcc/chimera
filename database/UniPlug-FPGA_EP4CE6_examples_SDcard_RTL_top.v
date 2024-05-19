// This program was cloned from: https://github.com/WangXuan95/UniPlug-FPGA
// License: GNU General Public License v3.0


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

assign IOA = 7'hz;
assign IOB = 18'hz;
assign IOC = 18'hz;


// --------------------------------------------------------------------------------------------------------------
//  signals
// --------------------------------------------------------------------------------------------------------------
reg         rstn = 1'b0;

wire        rxvalid;
wire [ 7:0] rxdata;

wire        outen;     // when outen=1, a byte of file content is read out from outbyte
wire [ 7:0] outbyte;   // a byte of file content


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
// sd_file_reader
// --------------------------------------------------------------------------------------------------------------

assign SD_DAT = 4'b111z;                                    // Must set sddat1~3 to 1 to avoid SD card from entering SPI mode

sd_file_reader #(
    .FILE_NAME_LEN             ( 11                     ),  // the length of "example.txt" (in bytes)
    .FILE_NAME                 ( "example.txt"          ),  // file name to read
    .CLK_DIV                   ( 2                      )   // because clk=27MHz, CLK_DIV must ≥2
) u_sd_file_reader (
    .rstn                      ( rstn                   ),
    .clk                       ( CLK27M                 ),
    .sdclk                     ( SD_CLK                 ),
    .sdcmd                     ( SD_CMD                 ),
    .sddat0                    ( SD_DAT[0]              ),
    .card_stat                 (                        ),  // show the sdcard initialize status
    .card_type                 ( LED[1:0]               ),  // 0=UNKNOWN    , 1=SDv1    , 2=SDv2  , 3=SDHCv2
    .filesystem_type           ( LED[3:2]               ),  // 0=UNASSIGNED , 1=UNKNOWN , 2=FAT16 , 3=FAT32 
    .file_found                (                        ),  // 0=file not found, 1=file found
    .outen                     ( outen                  ),
    .outbyte                   ( outbyte                )
);


// --------------------------------------------------------------------------------------------------------------
//  send the sd card readed data to UART
// --------------------------------------------------------------------------------------------------------------
uart_tx #(
    .CLK_FREQ                  ( 27000000               ),
    .BAUD_RATE                 ( 115200                 ),
    .PARITY                    ( "NONE"                 ),
    .STOP_BITS                 ( 4                      ),
    .BYTE_WIDTH                ( 1                      ),
    .FIFO_EA                   ( 14                     ),
    .EXTRA_BYTE_AFTER_TRANSFER ( ""                     ),
    .EXTRA_BYTE_AFTER_PACKET   ( ""                     )
) u_uart_tx (
    .rstn                      ( rstn                   ),
    .clk                       ( CLK27M                 ),
    .i_tready                  (                        ),
    .i_tvalid                  ( outen                  ),
    .i_tdata                   ( outbyte                ),
    .i_tkeep                   ( 1'b1                   ),
    .i_tlast                   ( 1'b0                   ),
    .o_uart_tx                 ( UART_TX                )
);


endmodule
