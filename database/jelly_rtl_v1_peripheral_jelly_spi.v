// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// SPI
module jelly_spi
        #(
            parameter DIVIDER_WIDTH = 16,
            parameter DIVIDER_INIT  = 100,
            parameter LSB_FIRST     = 0,
            parameter CS_N_INIT     = 1'b1,
            
            parameter WB_ADR_WIDTH  = 3,
            parameter WB_DAT_WIDTH  = 32,
            parameter WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8)
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // SPI
            output  wire                        spi_cs_n,
            output  wire                        spi_clk,
            output  wire                        spi_di,
            input   wire                        spi_do,
            
            // WISHBONE
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o,
            
            output  wire                        irq
        );
    
    // register address
    localparam  SPI_STATUS    = 3'b000;
    localparam  SPI_CONTROL   = 3'b001;
    localparam  SPI_SEND      = 3'b010;
    localparam  SPI_RECV      = 3'b011;
    localparam  SPI_DIVIDER   = 3'b100;
    localparam  SPI_LSB_FIRST = 3'b101;
    
    // -------------------------
    //   Core
    // -------------------------
    
    reg     [DIVIDER_WIDTH-1:0] clk_dvider;
    reg                         lsb_first;
    reg                         reg_spi_cs_n;
    wire    [7:0]               tx_data;
    wire                        tx_valid;
    wire    [7:0]               rx_data;
    wire                        rx_valid;
    wire                        busy;
    
    jelly_spi_core
            #(
                .DIVIDER_WIDTH      (DIVIDER_WIDTH)
            )
        i_spi_core
            (
                .reset              (reset),
                .clk                (clk),
                
                .clk_dvider         (clk_dvider),
                .lsb_first          (lsb_first),
                
                .spi_clk            (spi_clk),
                .spi_di             (spi_di),
                .spi_do             (spi_do),
                
                .tx_data            (tx_data),
                .tx_valid           (tx_valid),
                .tx_ready           (),
                .rx_data            (rx_data),
                .rx_valid           (rx_valid),
                
                .busy               (busy)
            );
    
    
    // -------------------------
    //  register
    // -------------------------
    
    always @(posedge clk) begin
        if ( reset ) begin
            clk_dvider   <= DIVIDER_INIT;
            lsb_first    <= LSB_FIRST;
            reg_spi_cs_n <= CS_N_INIT;
        end
        else begin
            if ( s_wb_stb_i & s_wb_we_i ) begin
                if ( s_wb_adr_i == SPI_CONTROL ) begin
                    reg_spi_cs_n <= s_wb_dat_i[0];
                end
                if ( s_wb_adr_i == SPI_DIVIDER ) begin
                    clk_dvider   <= s_wb_dat_i;
                end
                if ( s_wb_adr_i == SPI_LSB_FIRST ) begin
                    lsb_first    <=  s_wb_dat_i[0];
                end
            end
        end
    end
    
    assign tx_valid   = (s_wb_adr_i == SPI_SEND) & s_wb_stb_i & s_wb_we_i & s_wb_sel_i[0];
    assign tx_data    = s_wb_dat_i[7:0];
    
    assign s_wb_dat_o = (s_wb_adr_i == SPI_STATUS)  ? busy       :
                        (s_wb_adr_i == SPI_RECV)    ? rx_data    :
                        (s_wb_adr_i == SPI_DIVIDER) ? clk_dvider : 0;
    assign s_wb_ack_o = s_wb_stb_i;
    
    assign spi_cs_n   = reg_spi_cs_n;
    
    assign irq        = rx_valid;
    
endmodule


`default_nettype wire


// end of file
