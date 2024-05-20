// This program was cloned from: https://github.com/Revenantx86/uart
// License: MIT License

/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * Refik Yalcin wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a coffe or ginger ale in return.
 * ----------------------------------------------------------------------------
 *
 * File Name: uart.v
 *
 * Project: UART Communication module 
 *
 * Module Name: UART Top module 
 *
 * Description: <Universal asyncronus send/receive communicaiton protocol module implemented using verilog for gate level synthesis 
 *
 * Functional Description:
 * This file contains the top module construction of the all uart protocol modules
 *
 *
 * Revision History:
 * Rev 1.0 - <Date>, <Your Name> - Initial release
 *
 * Additional Notes:
 * - Note 1: Baud controller created
 *
 */

module uart_top# 
( 
    parameter D_W = 8,
    parameter B_TICK = 16,
    parameter DEPTH = 64,
    parameter DIV_W = 16,
    //
    parameter APB_DW = 8
) 
(
    // Master wires //
    input  wire      clk,
    input  wire      rst,
    input  wire      module_enable,
    //
    /*
     * - RX Channel I/O  - 
     */
    input  wire     rx_data,
    output wire     rx_done,
    //
    /*
     * - TX Channel I/O  - 
     */
    output reg      tx_data,
    input  wire     tx_start,
    output reg      tx_done, 
    //
    /*
     * - APB Interface - 
     */
    input  wire [APB_DW-1:0] PADDR,
    input  wire              PSEL,
    input  wire              PENABLE,
    input  wire              PWRITE,
    input  wire [APB_DW-1:0] PWDATA,
    output reg               PREADY,
    output reg  [APB_DW-1:0] PRDATA,
    output reg               PSLVERR
    //
);
//
//------------------------//     
//      Wire & Regs       //
//------------------------//     
//
// -- Baud Generator -- //
reg  [DIV_W-1:0]  DIVxR;
wire              b_clk;
wire              b_en;
// -- Read Channel FIFO -- //
wire             fifo_rx_wr_en;
reg              fifo_rx_rd_en;
wire [D_W-1:0]   fifo_rx_data_in;
wire [D_W-1:0]   fifo_rx_data_out;
wire             fifo_rx_full;
wire             fifo_rx_empty;
//
// -- Transmit Channel FIFO -- //
reg              fifo_tx_wr_en;
reg              fifo_tx_rd_en;
reg   [D_W-1:0]  fifo_tx_data_in;
wire  [D_W-1:0]  fifo_tx_data_out;
wire             fifo_tx_empty;
wire             fifo_tx_full;
// -- TX -- //
wire             tx_done;
wire             b_en_tx;
//
// -- RX -- //
wire             b_en_rx;
//
assign b_en = b_en_tx | b_en_rx;
//
//------------------------//     
//   BAUD CLK Generator   //
//------------------------// 
baud_gen # (.DIV_W(DIV_W))
    baud_gen_inst   (
                    .clk(clk),
                    .rst(rst),
                    .DIVxR(DIVxR),
                    .b_clk(b_clk),
                    .b_en(b_en)
                    );
//------------------------//     
//    FIFO Instatiation   //
//------------------------//    
fifo #(.D_W(D_W), .DEPTH(DEPTH)) 
    fifo_rx_inst    (
                    .clk(clk),
                    .rst(rst),
                    .wr_en(fifo_rx_wr_en),
                    .rd_en(fifo_rx_rd_en),
                    .data_in(fifo_rx_data_in),
                    .data_out(fifo_rx_data_out),
                    .full(fifo_rx_full),
                    .empty(fifo_rx_empty)
                    );
fifo #(.D_W(D_W), .DEPTH(DEPTH)) 
    fifo_tx_inst    (
                    .clk(clk),
                    .rst(rst),
                    .wr_en(fifo_tx_wr_en),
                    .rd_en(fifo_tx_rd_en),
                    .data_in(fifo_tx_data_in),
                    .data_out(fifo_tx_data_out),
                    .full(fifo_tx_full),
                    .empty(fifo_tx_empty)
                    );
//------------------------//     
//   RX-TX Instatiation   //
//------------------------//    
uart_rx #(.D_W(D_W), .B_TICK(B_TICK))
    uart_rx_inst    (
                    .rst(rst),
                    .clk(clk),
                    .baud_clk(b_clk),
                    .rx_data(rx_data),
                    .baud_en(b_en_rx),
                    .out_data(fifo_rx_data_in),
                    //
                    .ff_full(fifo_rx_full),
                    .ff_wr_en(fifo_rx_wr_en)
                    );
uart_tx #(.D_W(D_W), .B_TICK(B_TICK))
    uart_tx_inst    (
                    .rst(rst),
                    .clk(clk),
                    .baud_clk(b_clk),
                    .input_data(fifo_tx_data_out),
                    .tx_start(tx_start),
                    .baud_en(b_en_tx),
                    .tx_data(tx_data),
                    .tx_done(tx_done),
                    //
                    .ff_rd_en(fifo_tx_rd_en),
                    .ff_empty(fifo_tx_empty)
                    );
//-----------------------------//     
//      APB Control Logic      //
//-----------------------------//    
/*
 * - Read Request Interface - 
 */
 //
 enum {IDLE,SETUP,ACCESS} STATE;
//
//
//
always @(posedge clk) begin
    //
    if(rst) begin
        fifo_rx_rd_en <= 0;
        fifo_tx_data_in <= 0;
        DIVxR <= 16'd54;
    end
    else begin
        case(STATE) // APB Interface State Machine
            //
            IDLE : begin
                PREADY <= 0;
                if(PSEL) begin
                    STATE <= SETUP;
                end
            end
            //
            SETUP : begin
                if (PENABLE) begin
                    STATE <= ACCESS;
                    PREADY <= 1;
                end
            end
            //
            ACCESS : begin
                PREADY <= 0;
                STATE <= IDLE;
            end
            //
        endcase
        /*
        * - Read Request Interface - 
        */
        case (STATE) // Internal logic
        //
            IDLE : begin
                fifo_rx_rd_en <= 0;
                if(PSEL && !PWRITE) begin
                    fifo_rx_rd_en <= 1;
                end            
            end
            //
            SETUP : begin
                if(fifo_rx_empty) PSLVERR <= 1;
                fifo_rx_rd_en <= 0;
            end
            //
            ACCESS : begin
                PSLVERR <= 0;   
            end
        //
        endcase
        /*
        * - Write Request Interface - 
        */
        // Write ADDR Command Data sheet
        // x01 = write on divxr
        // x02 = write fifo tx buffer
        case (STATE) // Internal logic
        //
            IDLE : begin
                
            end
            //
            SETUP : begin
                if(PSEL && PWRITE && PADDR == 2) begin
                    if(fifo_tx_full) PSLVERR <= 1;
                    else begin
                        fifo_tx_wr_en <= 1;
                        fifo_tx_data_in <= PWDATA;
                    end
                end
                if(PSEL && PWRITE && PADDR == 1) begin
                    DIVxR [APB_DW-1:0] <= PWDATA;
                end
            end
            //
            ACCESS : begin
                PSLVERR <= 0;   
                fifo_tx_wr_en <= 0;
            //
            end
        //
        endcase
    end
end
//
always@(*) begin
    PRDATA <= fifo_rx_data_out;
end
//
endmodule