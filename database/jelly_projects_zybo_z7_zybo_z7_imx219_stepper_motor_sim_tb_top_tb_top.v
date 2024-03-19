// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2018 by Ryuz
//                                      https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_top();
    localparam RATE125 = 1000.0/125.0;
    
    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(1, tb_top);
        $dumpvars(1, i_axi4s_master_model);
        $dumpvars(1, i_top);
        $dumpvars(1, i_top.i_image_processing);
        $dumpvars(1, i_top.i_image_processing.i_img_mean_grad_to_angle);
        $dumpvars(1, i_top.i_data_logger_fifo_img);
        $dumpvars(1, i_top.i_data_logger_fifo_motor);
        
    #100000000
        $finish;
    end
    
    reg     clk125 = 1'b1;
    always #(RATE125/2.0)   clk125 = ~clk125;
    
    
//    parameter   X_NUM = 640;
//    parameter   Y_NUM = 132;

    parameter   X_NUM = 64;
    parameter   Y_NUM = 64;
    
    
    zybo_z7_imx219_stepper_motor
        i_top
            (
                .in_clk125      (clk125),
                
                .push_sw        (0),
                .dip_sw         (0),
                .led            (),
                .pmod_a         ()
            );
    
    wire                    atan_clk         = i_top.i_image_processing.clk;
    wire                    atan_cke         = i_top.i_image_processing.cke;
    wire    signed  [46:0]  atan_s_x     = i_top.i_image_processing.i_img_mean_grad_to_angle.i_fixed_atan2_multicycle.s_x;
    wire    signed  [46:0]  atan_s_y     = i_top.i_image_processing.i_img_mean_grad_to_angle.i_fixed_atan2_multicycle.s_y;
    wire                    atan_s_valid = i_top.i_image_processing.i_img_mean_grad_to_angle.i_fixed_atan2_multicycle.s_valid;
    wire    signed  [31:0]  atan_m_angle = i_top.i_image_processing.i_img_mean_grad_to_angle.i_fixed_atan2_multicycle.m_angle;
    wire                    atan_m_valid = i_top.i_image_processing.i_img_mean_grad_to_angle.i_fixed_atan2_multicycle.m_valid;
    reg     signed  [46:0]  reg_atan_x;
    reg     signed  [46:0]  reg_atan_y;
    reg     signed  [31:0]  reg_atan_angle;
    always @(posedge atan_clk) begin
        if ( atan_cke ) begin
            if ( atan_s_valid ) begin
                reg_atan_x <= atan_s_x;
                reg_atan_y <= atan_s_y;
            end
            if ( atan_m_valid ) begin
                reg_atan_angle <= atan_m_angle;
            end
        end
    end
    
    
    // ----------------------------------
    //  summy video
    // ----------------------------------
    
    reg             axi4s_model_enbale = 1'b0;
    
    wire            axi4s_model_aresetn = i_top.axi4s_cam_aresetn;
    wire            axi4s_model_aclk    = i_top.axi4s_cam_aclk;
    wire    [0:0]   axi4s_model_tuser;
    wire            axi4s_model_tlast;
    wire    [7:0]   axi4s_model_tdata;
    wire            axi4s_model_tvalid;
    wire            axi4s_model_tready = i_top.axi4s_csi2_tready & axi4s_model_enbale;
    
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (8),
                .X_NUM              (X_NUM),
                .Y_NUM              (Y_NUM),
                .PGM_FILE           ("img_0000.pgm"),
                .SEQUENTIAL_FILE    (1),
                .DIGIT_NUM          (4),
                .DIGIT_POS          (4),
                .BUSY_RATE          (0), // (50),
                .RANDOM_SEED        (0),
                .INTERVAL           (X_NUM * 10)
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
        force i_top.axi4s_csi2_tvalid = axi4s_model_tvalid & axi4s_model_enbale;
    end
    
    
    
    // src
    jelly_img_record_model
            #(
                .COMPONENT_NUM  (1),
                .DATA_WIDTH     (10),
                .FILE_NAME      ("src_%04d.pgm")
            )
        i_img_record_model_src
            (
                .reset              (i_top.i_image_processing.reset),
                .clk                (i_top.i_image_processing.clk),
                .cke                (i_top.i_image_processing.cke),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_img_line_first   (i_top.i_image_processing.img_src_line_first),
                .s_img_line_last    (i_top.i_image_processing.img_src_line_last),
                .s_img_pixel_first  (i_top.i_image_processing.img_src_pixel_first),
                .s_img_pixel_last   (i_top.i_image_processing.img_src_pixel_last),
                .s_img_de           (i_top.i_image_processing.img_src_de),
                .s_img_data         (i_top.i_image_processing.img_src_data),
                .s_img_valid        (i_top.i_image_processing.img_src_valid)
            );
    
    
    
    
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
    #10000;
        $display("start");

    #1000;
        $display("read core ID");
        wb_read(32'h40010000);
        wb_read(32'h40011000);
        wb_read(32'h40021000);
        wb_read(32'h40030000);  // demosaic
        wb_read(32'h40030400);  // col mat
        wb_read(32'h40030800);  // gauss
        wb_read(32'h40030c00);  // mask
        wb_read(32'h40033c00);  // sel
        wb_read(32'h40041000);
        wb_read(32'h40042000);
        wb_read(32'h40070000);
        wb_read(32'h40071000);
        
    #1000;
        // demosaic
        $display("set demosaic");
        wb_write(32'h40030040,     0, 4'b1111);        // byer phase
        wb_write(32'h40030010,     3, 4'b1111);        // enable

        // gauss
        $display("set gauss");
        wb_write(32'h40030800 + 8'h08*4, 32'h000f, 4'b1111);     // param_enable
        wb_write(32'h40030800 + 8'h04*4, 32'h0003, 4'b1111);     // ctl_control
        
        // mask
//      wb_write(32'h40040c00 + 8'h08*4, 32'h000f, 4'b1111);     // param_enable
//      wb_write(32'h40040c00 + 8'h04*4, 32'h0003, 4'b1111);     // ctl_control
        
        
        // 取り込み開始
        $display("set format reg");
        wb_write(32'h40010040, X_NUM, 4'b1111);     // width
        wb_write(32'h40010044, Y_NUM, 4'b1111);     // height
        wb_write(32'h40010048,     0, 4'b1111);     // fill
        wb_write(32'h4001004c,  1024, 4'b1111);     // timeout
        wb_write(32'h40010010,     1, 4'b1111);     // enable
    
    #1000;
        $display("start image input");
        axi4s_model_enbale = 1'b1;
        
        $display("start motor");
        wb_write(32'h40031000 + 4*8'h09,  10000, 4'b1111);     // MAX_V
        wb_write(32'h40031000 + 4*8'h0a,    100, 4'b1111);     // MAX_A
        wb_write(32'h40031000 + 4*8'h0f,    200, 4'b1111);     // MAX_A_NEAR
        wb_write(32'h40031000 + 4*8'h04, 100000, 4'b1111);     // ARGET_X
        wb_write(32'h40031000 + 4*8'h02,      1, 4'b1111);     // CTL_TARGET
        wb_write(32'h40031000 + 4*8'h01,      1, 4'b1111);     // CTL_ENABLE
        
        
    #10000;
        $display("set selector");
        wb_write(32'h40043c00,     1, 4'b1111);        // selector
        
        
    #1000000;
        $display("log0 read0");
        wb_read (32'h40070000 + 4*8'h05); // CTL_STATUS 
        wb_read (32'h40070000 + 4*8'h07); // CTL_COUNT  
        wb_read (32'h40070000 + 4*8'h08); // POL_TIMER0 
        wb_read (32'h40070000 + 4*8'h09); // POL_TIMER1 
        wb_read (32'h40070000 + 4*8'h10); // POL_DATA0  
        wb_write(32'h40070000 + 4*8'h04, 1, 4'b1111);     // CTL_CONTROL 
        
        $display("log0 read1");
        wb_read (32'h40070000 + 4*8'h05); // CTL_STATUS 
        wb_read (32'h40070000 + 4*8'h07); // CTL_COUNT  
        wb_read (32'h40070000 + 4*8'h08); // POL_TIMER0 
        wb_read (32'h40070000 + 4*8'h09); // POL_TIMER1 
        wb_read (32'h40070000 + 4*8'h10); // POL_DATA0  
        wb_write(32'h40070000 + 4*8'h04, 1, 4'b1111);     // CTL_CONTROL 
        
        $display("log0 read2");
        wb_read (32'h40070000 + 4*8'h05); // CTL_STATUS 
        wb_read (32'h40070000 + 4*8'h07); // CTL_COUNT  
        wb_read (32'h40070000 + 4*8'h08); // POL_TIMER0 
        wb_read (32'h40070000 + 4*8'h09); // POL_TIMER1 
        wb_read (32'h40070000 + 4*8'h10); // POL_DATA0  
        wb_write(32'h40070000 + 4*8'h04, 1, 4'b1111);     // CTL_CONTROL 
        
        
        $display("log1 read0");
        wb_read (32'h40071000 + 4*8'h05); // CTL_STATUS 
        wb_read (32'h40071000 + 4*8'h07); // CTL_COUNT  
        wb_read (32'h40071000 + 4*8'h08); // POL_TIMER0 
        wb_read (32'h40071000 + 4*8'h09); // POL_TIMER1 
        wb_read (32'h40071000 + 4*8'h10); // POL_DATA0  
        wb_read (32'h40071000 + 4*8'h11); // POL_DATA1  
        wb_read (32'h40071000 + 4*8'h12); // POL_DATA2  
        wb_read (32'h40071000 + 4*8'h13); // POL_DATA3  
        wb_read (32'h40071000 + 4*8'h14); // POL_DATA4  
        wb_read (32'h40071000 + 4*8'h15); // POL_DATA5  
        wb_read (32'h40071000 + 4*8'h16); // POL_DATA6  
        wb_read (32'h40071000 + 4*8'h17); // POL_DATA7  
        wb_write(32'h40071000 + 4*8'h04, 1, 4'b1111);     // CTL_CONTROL 
        
        $display("log1 read1");
        wb_read (32'h40071000 + 4*8'h05); // CTL_STATUS 
        wb_read (32'h40071000 + 4*8'h07); // CTL_COUNT  
        wb_read (32'h40071000 + 4*8'h08); // POL_TIMER0 
        wb_read (32'h40071000 + 4*8'h09); // POL_TIMER1 
        wb_read (32'h40071000 + 4*8'h10); // POL_DATA0  
        wb_read (32'h40071000 + 4*8'h11); // POL_DATA1  
        wb_read (32'h40071000 + 4*8'h12); // POL_DATA2  
        wb_read (32'h40071000 + 4*8'h13); // POL_DATA3  
        wb_read (32'h40071000 + 4*8'h14); // POL_DATA4  
        wb_read (32'h40071000 + 4*8'h15); // POL_DATA5  
        wb_read (32'h40071000 + 4*8'h16); // POL_DATA6  
        wb_read (32'h40071000 + 4*8'h17); // POL_DATA7  
        wb_write(32'h40071000 + 4*8'h04, 1, 4'b1111);     // CTL_CONTROL 
        
        $display("log0 read2");
        wb_read (32'h40071000 + 4*8'h05); // CTL_STATUS 
        wb_read (32'h40071000 + 4*8'h07); // CTL_COUNT  
        wb_read (32'h40071000 + 4*8'h08); // POL_TIMER0 
        wb_read (32'h40071000 + 4*8'h09); // POL_TIMER1 
        wb_read (32'h40071000 + 4*8'h10); // POL_DATA0  
        wb_read (32'h40071000 + 4*8'h11); // POL_DATA1  
        wb_read (32'h40071000 + 4*8'h12); // POL_DATA2  
        wb_read (32'h40071000 + 4*8'h13); // POL_DATA3  
        wb_read (32'h40071000 + 4*8'h14); // POL_DATA4  
        wb_read (32'h40071000 + 4*8'h15); // POL_DATA5  
        wb_read (32'h40071000 + 4*8'h16); // POL_DATA6  
        wb_read (32'h40071000 + 4*8'h17); // POL_DATA7  
        wb_write(32'h40071000 + 4*8'h04, 1, 4'b1111);     // CTL_CONTROL 
        
/*
        
    #100000;
        
        wb_write(32'h40010020, 32'h30000000, 4'b1111);
        wb_write(32'h40010024, X_NUM*4,     4'b1111);       // stride
        wb_write(32'h40010028, X_NUM,       4'b1111);       // width
        wb_write(32'h4001002c, Y_NUM,       4'b1111);       // height
        wb_write(32'h40010030, X_NUM*Y_NUM, 4'b1111);       // size
        wb_write(32'h4001003c,     31, 4'b1111);        // awlen
        wb_write(32'h40010010,     3, 4'b1111);
    #10000;




/*
        wb_read(32'h40010014);
        wb_read(32'h40010014);
        wb_read(32'h40010014);
        wb_read(32'h40010014);
    #10000;
        wb_write(32'h40010010,      0, 4'b1111);
        
        // 取り込み完了を待つ
        wb_read(32'h40010014);
        while ( reg_wb_dat != 0 ) begin
            #10000;
            wb_read(32'h40010014);
        end
        #10000;
        
        wb_write(32'h40033c00,     0, 4'b1111);        // selector
        
        
        // サイズを不整合で書いてみる
        wb_write(32'h40010020, 32'h30000000, 4'b1111);
        wb_write(32'h40010024, 128*4, 4'b1111);     // stride
        wb_write(32'h40010028, 256+64, 4'b1111);        // width
        wb_write(32'h4001002c,     64, 4'b1111);        // height
        wb_write(32'h40010030, 256*64, 4'b1111);        // size
        wb_write(32'h4001003c,     31, 4'b1111);        // awlen
        wb_write(32'h40010010,      7, 4'b1111);
    #10000;
        
        // 取り込み完了を待つ
        wb_read(32'h40010014);
        while ( reg_wb_dat != 0 ) begin
            #10000;
            wb_read(32'h40010014);
        end
        #10000;
        */
        
    end
    
    
endmodule


`default_nettype wire


// end of file
