// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2020 by Ryuz
//                                  https://github.com/ryuz/jelly.git
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
    
    wire    [3:0]       led;
    
    zybo_z7_udmabuf_sample
        i_top
            (
                .led    (led)
            );
    
    
    
    // ----------------------------------
    //  WISHBONE master
    // ----------------------------------
    
    localparam  WB_DAT_SIZE  = 2;
    localparam  WB_ADR_WIDTH = 32 - WB_DAT_SIZE;
    localparam  WB_DAT_WIDTH = (8 << WB_DAT_SIZE);
    localparam  WB_SEL_WIDTH = (1 << WB_DAT_SIZE);
    
    wire                            wb_rst_i = i_top.wb_peri_rst_i;
    wire                            wb_clk_i = i_top.wb_peri_clk_i;
    reg     [WB_ADR_WIDTH-1:0]      wb_adr_o;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_i = i_top.wb_peri_dat_o;
    reg     [WB_DAT_WIDTH-1:0]      wb_dat_o;
    reg                             wb_we_o;
    reg     [WB_SEL_WIDTH-1:0]      wb_sel_o;
    reg                             wb_stb_o = 0;
    wire                            wb_ack_i = i_top.wb_peri_ack_o;
    
    initial begin
        force i_top.wb_peri_adr_i = wb_adr_o;
        force i_top.wb_peri_dat_i = wb_dat_o;
        force i_top.wb_peri_we_i  = wb_we_o;
        force i_top.wb_peri_sel_i = wb_sel_o;
        force i_top.wb_peri_stb_i = wb_stb_o;
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
                input [WB_ADR_WIDTH+WB_DAT_SIZE-1:0]    adr,
                input [WB_DAT_WIDTH-1:0]                dat,
                input [WB_SEL_WIDTH-1:0]                sel
            );
    begin
        $display("WISHBONE_WRITE(adr:%h dat:%h sel:%b)", adr, dat, sel);
        @(negedge wb_clk_i);
            wb_adr_o = (adr >> WB_DAT_SIZE);
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
                input [WB_ADR_WIDTH+WB_DAT_SIZE-1:0]    adr
            );
    begin
        @(negedge wb_clk_i);
            wb_adr_o = (adr >> WB_DAT_SIZE);
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
        $display(" --- dma0 --- ");
        wb_read (8*4); // CORE_ID
        
        wb_read (4*4);
        wb_write(4*4, 32'h01234567, 4'h2); // ADR_WDATA0
        wb_read (4*4);
        wb_write(4*4, 64'h0123FFFF, 4'hc); // ADR_WDATA0
        wb_read (4*4);
        
        $display("write start");
        wb_write(4*4, 32'h0123_4567, 4'hf);    // ADR_WDATA0
        wb_write(5*4, 32'hfedc_ba98, 4'hf);    // ADR_WDATA1
        wb_write(3*4, 32'h0000_0100, 4'hf);    // ADR_ADDR
        wb_write(1*4, 32'h0000_0001, 4'hf);    // ADR_WSTART
    #10000;
    
        wb_write(3*4, 32'h0000_0100, 4'hf);    // ADR_ADDR
        wb_write(2*4, 32'h0000_0001, 4'hf);    // ADR_RSTART
        wb_read (0*4);                         // ADR_STATUS
        
    #10000;
        wb_read (0*4);    // ADR_STATUS
        wb_read (6*4);    // ADR_RDATA0
        wb_read (7*4);    // ADR_RDATA1
    
    
    #10000;
        $display(" --- dma1 --- ");
        wb_read (32'h000400 + 8*4); // CORE_ID
        
        wb_read (32'h000400 + 4*4);
        wb_write(32'h000400 + 4*4, 32'h89ab_cdef, 4'h3); // ADR_WDATA0
        wb_read (32'h000400 + 4*4);
        wb_write(32'h000400 + 4*4, 32'h89ab_FFFF, 4'hc); // ADR_WDATA0
        wb_read (32'h000400 + 4*4);
        
        $display("write start");
        wb_write(32'h000400 + 4*4, 32'h0123_4567, 4'hf); // ADR_WDATA0
        wb_write(32'h000400 + 5*4, 32'hfedc_ba98, 4'hf); // ADR_WDATA1
        wb_write(32'h000400 + 3*4, 32'h0000_0100, 4'hf); // ADR_ADDR
        wb_write(32'h000400 + 1*4, 32'h0000_0001, 4'hf); // ADR_WSTART
    #10000;
    
        wb_write(32'h000400 + 3*4, 32'h0000_0100, 4'hf); // ADR_ADDR
        wb_write(32'h000400 + 2*4, 32'h0000_0001, 4'hf); // ADR_RSTART
        wb_read (32'h000400 + 0*4);    // ADR_STATUS
        
    #10000;
        wb_read (32'h000400 + 0*4);    // ADR_STATUS
        wb_read (32'h000400 + 6*4);    // ADR_RDATA0
        wb_read (32'h000400 + 7*4);    // ADR_RDATA1
    
    
    #10000;
        $display(" --- led --- ");
        wb_read (32'h004000);
        wb_write(32'h004000, 5, 4'hf);
    #10000;
        wb_write(32'h004000, 2, 4'hf);
    #10000;
        wb_write(32'h004000, 0, 4'hf);
    
    #10000;
        $finish();
        
    end
    
    
endmodule


`default_nettype wire


// end of file
