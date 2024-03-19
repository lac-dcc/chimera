// ---------------------------------------------------------------------------
//
//                                 Copyright (C) 2015-2020 by Ryuz 
//                                 https://github.com/ryuz/
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
    
    reg     clk125 = 1'b1;
    always #(RATE125/2.0)   clk125 = ~clk125;
    
    
    parameter   X_NUM = 2048; // 3280 / 2;
    parameter   Y_NUM = 16; // 2464 / 2;
    
    zybo_z7_imx219
        i_top
            (
                .in_clk125      (clk125),
                
                .push_sw        (0),
                .dip_sw         (0),
                .led            (),
                .pmod_a         ()
            );
    
    
    
    
    // ----------------------------------
    //  summy video
    // ----------------------------------
    
    wire            axi4s_model_aresetn = i_top.axi4s_cam_aresetn;
    wire            axi4s_model_aclk    = i_top.axi4s_cam_aclk;
    wire    [0:0]   axi4s_model_tuser;
    wire            axi4s_model_tlast;
    wire    [7:0]   axi4s_model_tdata;
    wire            axi4s_model_tvalid;
    wire            axi4s_model_tready = i_top.axi4s_csi2_tready;
    
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (8),
                .X_NUM              (X_NUM), // (128),
                .Y_NUM              (Y_NUM),   // (128),
//              .PGM_FILE           ("lena_128x128.pgm"),
                .BUSY_RATE          (0), // (50),
                .RANDOM_SEED        (0)
            )
        i_axi4s_master_model
            (
                .aresetn            (axi4s_model_aresetn),
                .aclk               (axi4s_model_aclk),
                
                .m_axi4s_tuser      (axi4s_model_tuser),
                .m_axi4s_tlast      (axi4s_model_tlast),
                .m_axi4s_tdata      (axi4s_model_tdata),
                .m_axi4s_tvalid     (axi4s_model_tvalid),
                .m_axi4s_tready     (axi4s_model_tready)
            );
    
    initial begin
        force i_top.axi4s_csi2_tuser  = axi4s_model_tuser;
        force i_top.axi4s_csi2_tlast  = axi4s_model_tlast;
        force i_top.axi4s_csi2_tdata  = {axi4s_model_tdata, 2'd0};
        force i_top.axi4s_csi2_tvalid = axi4s_model_tvalid;
    end
    
    
    
    // ----------------------------------
    //  WISHBONE master
    // ----------------------------------
    
    parameter   WB_ADR_WIDTH        = 30;
    parameter   WB_DAT_WIDTH        = 32;
    parameter   WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8);
    
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
                input [31:0]    adr,
                input [31:0]    dat,
                input [3:0]     sel
            );
    begin
        $display("WISHBONE_WRITE(adr:%h dat:%h sel:%b)", adr, dat, sel);
        @(negedge wb_clk_i);
            wb_adr_o = (adr >> 2);
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
                input [31:0]    adr
            );
    begin
        @(negedge wb_clk_i);
            wb_adr_o = (adr >> 2);
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
    
    
    
    initial begin
    @(negedge wb_rst_i);
        $display("start");

    #10000;
        $display("set format regularizer");
        wb_read (32'h40010000);                         // CORE ID
        wb_write(32'h40010040,        X_NUM, 4'b1111);  // width
        wb_write(32'h40010044,        Y_NUM, 4'b1111);  // height
        wb_write(32'h40010048,            0, 4'b1111);  // fill
        wb_write(32'h4001004c,         1024, 4'b1111);  // timeout
        wb_write(32'h40010010,            1, 4'b1111);  // enable
    #100000;
        
        $display("set write DMA");
        wb_read (32'h40021000);                         // CORE ID
        wb_write(32'h40021020, 32'h30000000, 4'b1111);  // address
        wb_write(32'h40021024,      4*X_NUM, 4'b1111);  // stride
        wb_write(32'h40021028,        X_NUM, 4'b1111);  // width
        wb_write(32'h4002102c,        Y_NUM, 4'b1111);  // height
        wb_write(32'h40021030,  X_NUM*Y_NUM, 4'b1111);  // size
        wb_write(32'h4002103c,           31, 4'b1111);  // awlen
        wb_write(32'h40021010,            3, 4'b1111);  // update & enable
    #10000;
        wb_read (32'h40021014);  // read status
        wb_read (32'h40021014);  // read status
        wb_read (32'h40021014);  // read status
        wb_read (32'h40021014);  // read status
        
    #10000;
        wb_write(32'h40021010, 0, 4'b1111); // stop
        
        // 取り込み完了を待つ
        wb_read(32'h40021014);
        while ( reg_wb_dat != 0 ) begin
            #10000;
            wb_read(32'h40021014);
        end
        #10000;
        
        
        // サイズを不整合で書いてみる(デッドロックしない確認)
        wb_write(32'h40021020, 32'h30000000, 4'b1111);  // address
        wb_write(32'h40021024,        4*128, 4'b1111);  // stride
        wb_write(32'h40021028,       256+64, 4'b1111);  // width
        wb_write(32'h4002102c,           64, 4'b1111);  // height
        wb_write(32'h40021030,       256*64, 4'b1111);  // size
        wb_write(32'h4002103c,           31, 4'b1111);  // awlen
        wb_write(32'h40021010,            7, 4'b1111);  // update & enable (one shot)
    #10000;
        
        // 取り込み完了を待つ
        wb_read(32'h40021014);
        while ( reg_wb_dat != 0 ) begin
            #10000;
            wb_read(32'h40021014);
        end
    #10000;
        $finish();
    end
    
    
endmodule


`default_nettype wire


// end of file
