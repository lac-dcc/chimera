// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2020 by Ryuji Fuchikami
//                                  http://ryuz.my.coocan.jp/
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_top();
    localparam RATE125 = 1000.0/125.0;
    
    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, tb_top);
        
    #100000000
        $finish;
    end
    
    
    
    // ----------------------------------
    //  top net
    // ----------------------------------
    
    wire    [1:0]       radio_led;
    
    ultra96v2_display_port
        i_top
            (
                .led    (radio_led)
            );
    
    
    /*
    // ----------------------------------
    //  WISHBONE master
    // ----------------------------------
    
    localparam  WB_DAT_SIZE  = 3;
    localparam  WB_ADR_WIDTH = 40 - WB_DAT_SIZE;
    localparam  WB_DAT_WIDTH = (8 << WB_DAT_SIZE);
    localparam  WB_SEL_WIDTH = (1 << WB_DAT_SIZE);
    
    // force connect to top-net
    wire                            wb_rst_i = i_top.wb_rst_i;
    wire                            wb_clk_i = i_top.wb_clk_i;
    reg     [WB_ADR_WIDTH-1:0]      wb_adr_o;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_i = i_top.wb_dat_o;
    reg     [WB_DAT_WIDTH-1:0]      wb_dat_o;
    reg                             wb_we_o;
    reg     [WB_SEL_WIDTH-1:0]      wb_sel_o;
    reg                             wb_stb_o = 0;
    wire                            wb_ack_i = i_top.wb_ack_o;
    
    initial begin
        force i_top.wb_adr_i = wb_adr_o;
        force i_top.wb_dat_i = wb_dat_o;
        force i_top.wb_we_i  = wb_we_o;
        force i_top.wb_sel_i = wb_sel_o;
        force i_top.wb_stb_i = wb_stb_o;
    end
    
    
    
    reg     [WB_DAT_WIDTH-1:0]      reg_wb_dat;
    reg                             reg_wb_ack;
    always @(posedge wb_clk_i) begin
        if ( ~wb_we_o & wb_stb_o & wb_ack_i ) begin
            reg_wb_dat <= wb_dat_i;
        end
        reg_wb_ack <= wb_ack_i;
    end
    
    
    task wb_write(
                input [WB_ADR_WIDTH-1:0]    adr,
                input [WB_DAT_WIDTH-1:0]    dat,
                input [WB_SEL_WIDTH-1:0]    sel
            );
    begin
        $display("WISHBONE_WRITE(adr:%h dat:%h sel:%b)", adr, dat, sel);
        @(negedge wb_clk_i);
            wb_adr_o = adr;
            wb_dat_o = dat;
            wb_sel_o = sel;
            wb_we_o  = 1'b1;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
    end
    endtask
    
    task wb_read(
                input [WB_ADR_WIDTH-1:0]    adr
            );
    begin
        @(negedge wb_clk_i);
            wb_adr_o = adr;
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'b1}};
            wb_we_o  = 1'b0;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
            $display("WISHBONE_READ(adr:%h dat:%h)", adr, reg_wb_dat);
    end
    endtask
    
    
    
    // ----------------------------------
    //  top net
    // ----------------------------------
    
    initial begin
    @(negedge wb_rst_i);
    #10000;
        $display(" --- cam0 imx --- ");
        wb_read (8*8); // CORE_ID
    
    
    #10000;
        $display(" --- dma1 --- ");
        wb_read (32'h000800 + 8*8); // CORE_ID
        
        wb_read (32'h000800 + 4*8);
        wb_write(32'h000800 + 4*8, 64'h0123456789abcdef, 8'h0f); // ADR_WDATA0
        wb_read (32'h000800 + 4*8);
        wb_write(32'h000800 + 4*8, 64'h01234567FFFFFFFF, 8'hf0); // ADR_WDATA0
        wb_read (32'h000800 + 4*8);
        
        $display("write start");
        wb_write(32'h000800 + 4*8, 64'h0123456789abcdef, 8'hff); // ADR_WDATA0
        wb_write(32'h000800 + 5*8, 64'hfedcba9876543210, 8'hff); // ADR_WDATA1
        wb_write(32'h000800 + 3*8, 64'h0000_0100, 8'hff);    // ADR_ADDR
        wb_write(32'h000800 + 1*8, 64'h0000_0001, 8'hff);    // ADR_WSTART
    #10000;
    
        wb_write(32'h000800 + 3*8, 64'h0000_0100, 8'hff);    // ADR_ADDR
        wb_write(32'h000800 + 2*8, 64'h0000_0001, 8'hff);    // ADR_RSTART
        wb_read (32'h000800 + 0*8);    // ADR_STATUS
        
    #10000;
        wb_read (32'h000800 + 0*8);    // ADR_STATUS
        wb_read (32'h000800 + 6*8);    // ADR_RDATA0
        wb_read (32'h000800 + 7*8);    // ADR_RDATA1
    
    
    #10000;
        $display(" --- led --- ");
        wb_read (32'h008000);
        wb_write(32'h008000, 1, 8'hff);
    #10000;
        wb_write(32'h008000, 0, 8'hff);
    
    #10000;
        $finish();
        
    end
    */
    
    
endmodule


`default_nettype wire


// end of file
