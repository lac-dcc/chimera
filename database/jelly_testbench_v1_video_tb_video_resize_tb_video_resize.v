// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_video_resize();
    localparam RATE     = 10.0;
    localparam WB_RATE  = 33.0;
    
    initial begin
        $dumpfile("tb_video_resize.vcd");
        $dumpvars(0, tb_video_resize);
    
    #10000000
        $finish;
    end
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial begin
        #(RATE*100);
        @(posedge clk)  reset <= 1'b0;
    end
    
    reg     wb_clk = 1'b1;
    always #(WB_RATE/2.0)   wb_clk = ~wb_clk;
    
    
    localparam  FRAME_NUM = 10;
    
    localparam  X_NUM = 128;
    localparam  Y_NUM = 128;
    
    
    
    
    parameter   TUSER_WIDTH   = 1;
    parameter   COMPONENT_NUM = 3;
    parameter   DATA_WIDTH    = 8;
    parameter   TDATA_WIDTH   = COMPONENT_NUM*DATA_WIDTH;
    parameter   M_SLAVE_REGS  = 1;
    parameter   M_MASTER_REGS = 1;
    
    parameter   WB_ADR_WIDTH        = 8;
    parameter   WB_DAT_SIZE         = 2;    // 0:8bit, 1:16bit, 2:32bit, ...
    parameter   WB_DAT_WIDTH        = (8 << WB_DAT_SIZE);
    parameter   WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8);
    
    wire                        aresetn = ~reset;
    wire                        aclk    = clk;
    wire                        aclken  = 1'b1;
    
//  reg                         param_v_enable = 1;
//  reg                         param_h_enable = 1;
    
    wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser;
    wire                        s_axi4s_tlast;
    wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata;
    wire                        s_axi4s_tvalid;
    wire                        s_axi4s_tready;
    
    wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser;
    wire                        m_axi4s_tlast;
    wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata;
    wire                        m_axi4s_tvalid;
    reg                         m_axi4s_tready = 1;
    always @(posedge clk) begin
        m_axi4s_tready <= {$random()};
    end
    
    wire                        s_wb_rst_i = reset;
    wire                        s_wb_clk_i = wb_clk;
    wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i;
    wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i;
    wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o;
    wire                        s_wb_we_i;
    wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i;
    wire                        s_wb_stb_i;
    wire                        s_wb_ack_o;
    
    
    
    // model
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH       (TDATA_WIDTH),
                .X_NUM                  (128),
                .Y_NUM                  (128),
                .PPM_FILE               ("lena_128x128.ppm"),
                .BUSY_RATE              (50),
                .RANDOM_SEED            (7),
                .INTERVAL               (1000)
            )
        i_axi4s_master_model
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                
                .m_axi4s_tuser          (s_axi4s_tuser),
                .m_axi4s_tlast          (s_axi4s_tlast),
                .m_axi4s_tdata          (s_axi4s_tdata),
                .m_axi4s_tvalid         (s_axi4s_tvalid),
                .m_axi4s_tready         (s_axi4s_tready)
            );
    
    
    // core

    
    wire    [TUSER_WIDTH-1:0]   axi4s_v_tuser;
    wire                        axi4s_v_tlast;
    wire    [TDATA_WIDTH-1:0]   axi4s_v_tdata;
    wire                        axi4s_v_tvalid;
    wire                        axi4s_v_tready;
    
    jelly_video_resize_half_wb
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .DATA_WIDTH             (DATA_WIDTH),
                .AXI4S_TUSER_WIDTH      (TUSER_WIDTH),
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_SIZE            (WB_DAT_SIZE),
                .M_SLAVE_REGS           (M_SLAVE_REGS),
                .M_MASTER_REGS          (M_MASTER_REGS),
                .INIT_PARAM_V_ENABLE    (1),
                .INIT_PARAM_H_ENABLE    (1)
            )
        i_video_resize_half_wb
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .s_axi4s_tuser          (s_axi4s_tuser),
                .s_axi4s_tlast          (s_axi4s_tlast),
                .s_axi4s_tdata          (s_axi4s_tdata),
                .s_axi4s_tvalid         (s_axi4s_tvalid),
                .s_axi4s_tready         (s_axi4s_tready),
                
                .m_axi4s_tuser          (m_axi4s_tuser),
                .m_axi4s_tlast          (m_axi4s_tlast),
                .m_axi4s_tdata          (m_axi4s_tdata),
                .m_axi4s_tvalid         (m_axi4s_tvalid),
                .m_axi4s_tready         (m_axi4s_tready),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (s_wb_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (s_wb_stb_i),
                .s_wb_ack_o             (s_wb_ack_o)
            );
    
    
    // dump
    integer     fp_img;
    initial begin
         fp_img = $fopen("out_img.ppm", "w");
         $fdisplay(fp_img, "P3");
         $fdisplay(fp_img, "%d %d", X_NUM/2, Y_NUM*FRAME_NUM);
         $fdisplay(fp_img, "255");
    end
    
    always @(posedge clk) begin
        if ( !reset && m_axi4s_tvalid && m_axi4s_tready ) begin
             $fdisplay(fp_img, "%d %d %d", m_axi4s_tdata[0*8 +: 8], m_axi4s_tdata[1*8 +: 8], m_axi4s_tdata[2*8 +: 8]);
        end
    end
    
    integer frame_count = 0;
    always @(posedge clk) begin
        if ( !reset && m_axi4s_tuser[0] && m_axi4s_tvalid && m_axi4s_tready ) begin
            $display("frame : %d", frame_count);
            frame_count = frame_count + 1;
            if ( frame_count > FRAME_NUM+1 ) begin
                $finish();
            end
        end
    end
    
    
    wire        [WB_DAT_WIDTH-1:0]  wb_read_dat;
    jelly_wishbone_task
            #(
                .WB_ADR_WIDTH       (WB_ADR_WIDTH),
                .WB_DAT_SIZE        (WB_DAT_SIZE),
                .VERBOSE            (1)
            )
        i_wb_task
            (
                .reset              (s_wb_rst_i),
                .clk                (s_wb_clk_i),
                
                .m_wb_adr_o         (s_wb_adr_i),
                .m_wb_dat_o         (s_wb_dat_i),
                .m_wb_dat_i         (s_wb_dat_o),
                .m_wb_we_o          (s_wb_we_i),
                .m_wb_sel_o         (s_wb_sel_i),
                .m_wb_stb_o         (s_wb_stb_i),
                .m_wb_ack_i         (s_wb_ack_o),
                
                .read_dat           (wb_read_dat)
            );
    
    initial begin
        #1000
            i_wb_task.write_word(32'h0008, 1, 4'hf);
            i_wb_task.write_word(32'h000c, 1, 4'hf);
            i_wb_task.write_word(32'h0000, 1, 4'hf);
            i_wb_task.read_word(32'h0000);
            while ( wb_read_dat != 0 ) begin
                i_wb_task.read_word(32'h0000);
            end
            
            i_wb_task.write_word(32'h0008, 0, 4'hf);
            i_wb_task.write_word(32'h000c, 1, 4'hf);
            i_wb_task.write_word(32'h0000, 1, 4'hf);
            i_wb_task.read_word(32'h0000);
            while ( wb_read_dat != 0 ) begin
                i_wb_task.read_word(32'h0000);
            end
            
            i_wb_task.write_word(32'h0008, 1, 4'hf);
            i_wb_task.write_word(32'h000c, 1, 4'hf);
            i_wb_task.write_word(32'h0000, 1, 4'hf);
            i_wb_task.read_word(32'h0000);
            while ( wb_read_dat != 0 ) begin
                i_wb_task.read_word(32'h0000);
            end
            
            i_wb_task.write_word(32'h0008, 1, 4'hf);
            i_wb_task.write_word(32'h000c, 0, 4'hf);
            i_wb_task.write_word(32'h0000, 1, 4'hf);
            i_wb_task.read_word(32'h0000);
            while ( wb_read_dat != 0 ) begin
                i_wb_task.read_word(32'h0000);
            end
            
            i_wb_task.write_word(32'h0008, 1, 4'hf);
            i_wb_task.write_word(32'h000c, 1, 4'hf);
            i_wb_task.write_word(32'h0000, 1, 4'hf);
            i_wb_task.read_word(32'h0000);
            while ( wb_read_dat != 0 ) begin
                i_wb_task.read_word(32'h0000);
            end
    end
    
    
    
endmodule


`default_nettype wire


// end of file
