// This program was cloned from: https://github.com/WangXuan95/UniPlug-FPGA
// License: GNU General Public License v3.0


module top (
    // Clocks
    input  wire           CLK27M,
    // LED
    output wire [ 2:0]    LED,
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
    // CAN
    output wire           CAN_TX,
    input  wire           CAN_RX,
    // USER IO Group A,
    inout       [ 6:0]    IOA,
    // USER IO Group B and C
    inout       [17:0]    IOB, IOC
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


// --------------------------------------------------------------------------------------------------------------
//  power on reset generate
// --------------------------------------------------------------------------------------------------------------
reg        rstn = 1'b0;
reg [ 2:0] rstn_shift = 3'd0;
always @ (posedge CLK27M)
    {rstn, rstn_shift} <= {rstn_shift, 1'b1};



// --------------------------------------------------------------------------------------------------------------
//  signals
// --------------------------------------------------------------------------------------------------------------
reg [31:0] can_tx_cnt;
reg        can_tx_valid;
reg [31:0] can_tx_data;

wire       can_rx_valid;
wire [7:0] can_rx_data;


// --------------------------------------------------------------------------------------------------------------
//  Periodically send incremental data to the CAN tx-buffer
// --------------------------------------------------------------------------------------------------------------
always @ (posedge CLK27M or negedge rstn)
    if(~rstn) begin
        can_tx_cnt <= 0;
        can_tx_valid <= 1'b0;
        can_tx_data <= 0;
    end else begin
        if(can_tx_cnt<50000000-1) begin
            can_tx_cnt <= can_tx_cnt + 1;
            can_tx_valid <= 1'b0;
        end else begin
            can_tx_cnt <= 0;
            can_tx_valid <= 1'b1;
            can_tx_data <= can_tx_data + 1;
        end
    end


// --------------------------------------------------------------------------------------------------------------
//  CAN controller
// --------------------------------------------------------------------------------------------------------------
can_top #(
    .LOCAL_ID          ( 11'h456            ),
    .RX_ID_SHORT_FILTER( 11'h123            ),
    .RX_ID_SHORT_MASK  ( 11'h7ff            ),
    .RX_ID_LONG_FILTER ( 29'h12345678       ),
    .RX_ID_LONG_MASK   ( 29'h1fffffff       ),
    .default_c_PTS     ( 16'd17             ),      // CAN baud rate = 1MHz
    .default_c_PBS1    ( 16'd3              ),
    .default_c_PBS2    ( 16'd6              )
) u_can_top (
    .rstn              ( rstn               ),
    .clk               ( CLK27M             ),
    .can_rx            ( CAN_RX             ),
    .can_tx            ( CAN_TX             ),
    .tx_valid          ( can_tx_valid       ),
    .tx_ready          (                    ),
    .tx_data           ( can_tx_data        ),
    .rx_valid          ( can_rx_valid       ),
    .rx_last           (                    ),
    .rx_data           ( can_rx_data        ),
    .rx_id             (                    ),
    .rx_ide            (                    )
);


// --------------------------------------------------------------------------------------------------------------
//  send CAN RX data to UART TX
// --------------------------------------------------------------------------------------------------------------
uart_tx #(
    .CLK_FREQ          ( 27000000           ),
    .BAUD_RATE         ( 115200             ),      // UART baud rate = 115200
    .PARITY            ( "NONE"             ),
    .STOP_BITS         ( 3                  ),
    .BYTE_WIDTH        ( 1                  ),
    .FIFO_EA           ( 10                 ),      // enable TX fifo, fifo depth = 1024
    .EXTRA_BYTE_AFTER_TRANSFER ( ""         ),
    .EXTRA_BYTE_AFTER_PACKET   ( ""         )
) u_uart_tx (
    .rstn              ( rstn               ),
    .clk               ( CLK27M             ),
    .i_tready          (                    ),
    .i_tvalid          ( can_rx_valid       ),
    .i_tdata           ( can_rx_data        ),
    .i_tkeep           ( 1'b1               ),
    .i_tlast           ( 1'b0               ),
    .o_uart_tx         ( UART_TX            )
);


assign LED = can_rx_data[2:0];


endmodule
