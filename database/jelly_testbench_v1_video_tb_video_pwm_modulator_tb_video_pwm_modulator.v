// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_video_pwm_modulator();
    localparam RATE     = 10.0;
    localparam WB_RATE  = 33.0;
    
    initial begin
        $dumpfile("tb_video_pwm_modulator.vcd");
        $dumpvars(0, tb_video_pwm_modulator);
    
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
    
    
    parameter   TUSER_WIDTH  = 1;
    parameter   TDATA_WIDTH  = 8;
    
    parameter   WB_ADR_WIDTH = 8;
    parameter   WB_DAT_SIZE  = 2;   // 0:8bit, 1:16bit, 2:32bit, ...
    parameter   WB_DAT_WIDTH = (8 << WB_DAT_SIZE);
    parameter   WB_SEL_WIDTH = (WB_DAT_WIDTH / 8);
    
    wire                        aresetn = ~reset;
    wire                        aclk    = clk;
    wire                        aclken  = 1'b1;
    
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
    wire    [TUSER_WIDTH-1:0]   axi4s_src_tuser;
    wire                        axi4s_src_tlast;
    wire    [TDATA_WIDTH-1:0]   axi4s_src_tdata;
    wire                        axi4s_src_tvalid;
    wire                        axi4s_src_tready;
    
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH       (TDATA_WIDTH),
                .X_NUM                  (X_NUM),
                .Y_NUM                  (Y_NUM),
                .PGM_FILE               ("lena_128x128.pgm"),
                .BUSY_RATE              (0),
                .RANDOM_SEED            (7),
                .INTERVAL               (1000)
            )
        i_axi4s_master_model
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                
                .m_axi4s_tuser          (axi4s_src_tuser),
                .m_axi4s_tlast          (axi4s_src_tlast),
                .m_axi4s_tdata          (axi4s_src_tdata),
                .m_axi4s_tvalid         (axi4s_src_tvalid),
                .m_axi4s_tready         (axi4s_src_tready)
            );
    
    
    // PWM
    wire    [TUSER_WIDTH-1:0]   axi4s_pwm_tuser;
    wire                        axi4s_pwm_tlast;
    wire    [0:0]               axi4s_pwm_tbinary;
    wire    [TDATA_WIDTH-1:0]   axi4s_pwm_tdata;
    wire                        axi4s_pwm_tvalid;
    wire                        axi4s_pwm_tready;
    
    jelly_video_pwm_modulator
            #(
                .TUSER_WIDTH            (TUSER_WIDTH),
                .TDATA_WIDTH            (TDATA_WIDTH),
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .INIT_CTL_ENABLE        (1),
                .INIT_PARAM_TH          (16),
                .INIT_PARAM_INV         (0),
                .INIT_PARAM_STEP        (16)
            )
        i_video_pwm_modulator
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .s_axi4s_tuser          (axi4s_src_tuser),
                .s_axi4s_tlast          (axi4s_src_tlast),
                .s_axi4s_tdata          (axi4s_src_tdata),
                .s_axi4s_tvalid         (axi4s_src_tvalid),
                .s_axi4s_tready         (axi4s_src_tready),
                
                .m_axi4s_tuser          (axi4s_pwm_tuser),
                .m_axi4s_tlast          (axi4s_pwm_tlast),
                .m_axi4s_tbinary        (axi4s_pwm_tbinary),
                .m_axi4s_tdata          (axi4s_pwm_tdata),
                .m_axi4s_tvalid         (axi4s_pwm_tvalid),
                .m_axi4s_tready         (axi4s_pwm_tready),
                
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
    
    
    // integrator
    wire    [TUSER_WIDTH-1:0]   axi4s_int_tuser;
    wire                        axi4s_int_tlast;
    wire    [TDATA_WIDTH-1:0]   axi4s_int_tdata;
    wire                        axi4s_int_tvalid;
    wire                        axi4s_int_tready;
    
    jelly_video_integrator_bram_core
            #(
                .COMPONENT_NUM          (1),
                .DATA_WIDTH             (TDATA_WIDTH),
                .RATE_WIDTH             (4),
                .TUSER_WIDTH            (1),
                .X_WIDTH                (10),
                .Y_WIDTH                (8),
                .MAX_X_NUM              (1024),
                .MAX_Y_NUM              (256),
                .RAM_TYPE               ("block"),
                .COMPACT                (1)
            )
        i_video_integrator_bram_core
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .param_rate             (14),
                
                .s_axi4s_tuser          (axi4s_pwm_tuser),
                .s_axi4s_tlast          (axi4s_pwm_tlast),
                .s_axi4s_tdata          ({TDATA_WIDTH{axi4s_pwm_tbinary}}),
                .s_axi4s_tvalid         (axi4s_pwm_tvalid),
                .s_axi4s_tready         (axi4s_pwm_tready),
                
                .m_axi4s_tuser          (axi4s_int_tuser),
                .m_axi4s_tlast          (axi4s_int_tlast),
                .m_axi4s_tdata          (axi4s_int_tdata),
                .m_axi4s_tvalid         (axi4s_int_tvalid),
                .m_axi4s_tready         (axi4s_int_tready)
            );
    
    
    // dump
    /*
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM          (1),
                .DATA_WIDTH             (TDATA_WIDTH),
                .INIT_FRAME_NUM         (0),
                .FILE_NAME              ("src_%04d.pgm"),
                .BUSY_RATE              (0)
            )
        i_axi4s_slave_model_src
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .param_width            (X_NUM),
                .param_height           (Y_NUM),
                
                .s_axi4s_tuser          (s_axi4s_tuser),
                .s_axi4s_tlast          (s_axi4s_tlast),
                .s_axi4s_tdata          (s_axi4s_tdata),
                .s_axi4s_tvalid         (s_axi4s_tvalid & s_axi4s_tready),
                .s_axi4s_tready         ()
            );
    */
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM          (1),
                .DATA_WIDTH             (1),
                .INIT_FRAME_NUM         (0),
                .FILE_NAME              ("output/pwm_%04d.pgm"),
                .BUSY_RATE              (0),
                .RANDOM_SEED            (1234)
            )
        i_axi4s_slave_model_bin
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .param_width            (X_NUM),
                .param_height           (Y_NUM),
                
                .s_axi4s_tuser          (axi4s_pwm_tuser),
                .s_axi4s_tlast          (axi4s_pwm_tlast),
                .s_axi4s_tdata          (axi4s_pwm_tbinary),
                .s_axi4s_tvalid         (axi4s_pwm_tvalid & axi4s_pwm_tready),
                .s_axi4s_tready         ()
            );
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM          (1),
                .DATA_WIDTH             (TDATA_WIDTH),
                .INIT_FRAME_NUM         (0),
                .FILE_NAME              ("output/int_%04d.pgm"),
                .BUSY_RATE              (0),
                .RANDOM_SEED            (4321)
            )
        i_axi4s_slave_model_int
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .param_width            (X_NUM),
                .param_height           (Y_NUM),
                
                .s_axi4s_tuser          (axi4s_int_tuser),
                .s_axi4s_tlast          (axi4s_int_tlast),
                .s_axi4s_tdata          (axi4s_int_tdata),
                .s_axi4s_tvalid         (axi4s_int_tvalid),
                .s_axi4s_tready         (axi4s_int_tready)
            );
    
    
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
            i_wb_task.write_word(32'h0000, 1,  4'hf);
            i_wb_task.write_word(32'h0010, 16, 4'hf);
            i_wb_task.write_word(32'h0014, 1,  4'hf);
            i_wb_task.write_word(32'h0018, 16, 4'hf);
    end
    
    
endmodule


`default_nettype wire


// end of file
