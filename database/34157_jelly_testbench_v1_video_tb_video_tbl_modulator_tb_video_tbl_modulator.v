// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_video_tbl_modulator();
    localparam RATE     = 10.0;
    localparam WB_RATE  = 33.0;
    
    initial begin
        $dumpfile("tb_video_tbl_modulator.vcd");
        $dumpvars(1, tb_video_tbl_modulator);
    
    #100000000
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
                .BUSY_RATE              (10),
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
    
    
    // Modulation
    wire    [TUSER_WIDTH-1:0]   axi4s_mod_tuser;
    wire                        axi4s_mod_tlast;
    wire    [0:0]               axi4s_mod_tbinary;
    wire    [TDATA_WIDTH-1:0]   axi4s_mod_tdata;
    wire                        axi4s_mod_tvalid;
    wire                        axi4s_mod_tready;
    
    jelly_video_tbl_modulator
            #(
                .TUSER_WIDTH            (TUSER_WIDTH),
                .TDATA_WIDTH            (TDATA_WIDTH),
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .INIT_PARAM_END         (0),
                .INIT_PARAM_INV         (0)
            )
        i_video_tbl_modulator
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .s_axi4s_tuser          (axi4s_src_tuser),
                .s_axi4s_tlast          (axi4s_src_tlast),
                .s_axi4s_tdata          (axi4s_src_tdata),
                .s_axi4s_tvalid         (axi4s_src_tvalid),
                .s_axi4s_tready         (axi4s_src_tready),
                
                .m_axi4s_tuser          (axi4s_mod_tuser),
                .m_axi4s_tlast          (axi4s_mod_tlast),
                .m_axi4s_tbinary        (axi4s_mod_tbinary),
                .m_axi4s_tdata          (axi4s_mod_tdata),
                .m_axi4s_tvalid         (axi4s_mod_tvalid),
                .m_axi4s_tready         (axi4s_mod_tready),
                
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
    
    jelly_video_integrator_bram
            #(
                .COMPONENT_NUM          (1),
                .DATA_WIDTH             (TDATA_WIDTH),
                .RATE_WIDTH             (8),    // 
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .TUSER_WIDTH            (1),
                .X_WIDTH                (10),
                .Y_WIDTH                (8),
                .MAX_X_NUM              (1024),
                .MAX_Y_NUM              (256),
                .RAM_TYPE               ("block"),
                .FILLMEM                (1),
                .FILLMEM_DATA           (127),
                .COMPACT                (1),
                .INIT_PARAM_RATE        (8'hf0)
            )
        i_video_integrator_bram
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (),
                .s_wb_ack_o             (),
                
                .s_axi4s_tuser          (axi4s_mod_tuser),
                .s_axi4s_tlast          (axi4s_mod_tlast),
                .s_axi4s_tdata          ({TDATA_WIDTH{axi4s_mod_tbinary}}),
                .s_axi4s_tvalid         (axi4s_mod_tvalid),
                .s_axi4s_tready         (axi4s_mod_tready),
                
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
                .FILE_NAME              ("output/mod_%04d.pgm"),
    //          .BUSY_RATE              (0),
                .RANDOM_SEED            (1234)
            )
        i_axi4s_slave_model_bin
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .param_width            (X_NUM),
                .param_height           (Y_NUM),
                
                .s_axi4s_tuser          (axi4s_mod_tuser),
                .s_axi4s_tlast          (axi4s_mod_tlast),
                .s_axi4s_tdata          (axi4s_mod_tbinary),
                .s_axi4s_tvalid         (axi4s_mod_tvalid & axi4s_mod_tready),
                .s_axi4s_tready         ()
            );
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM          (1),
                .DATA_WIDTH             (TDATA_WIDTH),
                .INIT_FRAME_NUM         (0),
                .FILE_NAME              ("output/int_%04d.pgm"),
                .BUSY_RATE              (20),
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
    
    integer     i;
    
    initial begin
        #1000
            i_wb_task.write_word(32'h0100, 32'h10, 4'hf);
            i_wb_task.write_word(32'h0104, 32'hf0, 4'hf);
            i_wb_task.write_word(32'h0108, 32'h70, 4'hf);
            i_wb_task.write_word(32'h010c, 32'h90, 4'hf);
            i_wb_task.write_word(32'h0110, 32'h30, 4'hf);
            i_wb_task.write_word(32'h0114, 32'hd0, 4'hf);
            i_wb_task.write_word(32'h0118, 32'h50, 4'hf);
            i_wb_task.write_word(32'h011c, 32'hb0, 4'hf);
            i_wb_task.write_word(32'h0120, 32'h20, 4'hf);
            i_wb_task.write_word(32'h0124, 32'he0, 4'hf);
            i_wb_task.write_word(32'h0128, 32'h60, 4'hf);
            i_wb_task.write_word(32'h012c, 32'ha0, 4'hf);
            i_wb_task.write_word(32'h0130, 32'h40, 4'hf);
            i_wb_task.write_word(32'h0134, 32'hc0, 4'hf);
            i_wb_task.write_word(32'h0138, 32'h80, 4'hf);
            
            i_wb_task.write_word(32'h0010, 14, 4'hf);   // end
            i_wb_task.write_word(32'h0014, 0,  4'hf);   // inv
    end
    
    
endmodule


`default_nettype wire


// end of file
