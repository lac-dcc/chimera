
`timescale 1ns / 1ps
`default_nettype none


module tb_sim_main
        #(
            parameter   WB_ADR_WIDTH = 8,
            parameter   WB_DAT_WIDTH = 32,
            parameter   WB_SEL_WIDTH = (WB_DAT_WIDTH / 8)
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,

            input   wire                        s_wb_rst_i,
            input   wire                        s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o
        );
    
    integer         cycle_count = 0;
    always @(posedge aclk) cycle_count <= cycle_count + 1'b1;
    
    wire    timeout_busy = (cycle_count >= 300000 && cycle_count <= 500000);
    

    localparam  FRAME_NUM = 10;
    
    localparam  X_NUM = 128*2;
    localparam  Y_NUM = 128/2;

//  localparam  X_NUM = 128/2;
//  localparam  Y_NUM = 128*2;
    
//  localparam  X_NUM = 128;
//  localparam  Y_NUM = 128;

//  localparam  X_NUM = 128*2;
//  localparam  Y_NUM = 128;

//  localparam  X_NUM = 128/2;
//  localparam  Y_NUM = 128;

//  localparam  X_NUM = 128;
//  localparam  Y_NUM = 128/2;

//  localparam  X_NUM = 128/2;
//  localparam  Y_NUM = 128/2;

//  localparam  X_NUM = 128;
//  localparam  Y_NUM = 128*2;

//  localparam  X_NUM = 128*2;
//  localparam  Y_NUM = 128*2;


    // -----------------------------
    //  target
    // -----------------------------
        
    parameter   TUSER_WIDTH        = 1;
    parameter   TDATA_WIDTH        = 24;
    parameter   X_WIDTH            = 12;
    parameter   Y_WIDTH            = 12;
    parameter   TIMER_WIDTH        = 32;
    parameter   S_SLAVE_REGS       = 1;
    parameter   S_MASTER_REGS      = 1;
    parameter   M_SLAVE_REGS       = 1;
    parameter   M_MASTER_REGS      = 1;
    
    parameter   INIT_CTL_CONTROL   = 2'b11;
    parameter   INIT_PARAM_WIDTH   = X_NUM;
    parameter   INIT_PARAM_HEIGHT  = Y_NUM;
    parameter   INIT_PARAM_FILL    = 24'h00ff00;
    parameter   INIT_PARAM_TIMEOUT = 64;
    
    reg                         aclken  = 1;
    
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
    
    // core
    jelly_video_format_regularizer
            #(
                .WB_ADR_WIDTH       (WB_ADR_WIDTH),
                .WB_DAT_WIDTH       (WB_DAT_WIDTH),
                .WB_SEL_WIDTH       (WB_SEL_WIDTH),
                
                .TUSER_WIDTH        (TUSER_WIDTH),
                .TDATA_WIDTH        (TDATA_WIDTH),
                .X_WIDTH            (X_WIDTH),
                .Y_WIDTH            (Y_WIDTH),
                .TIMER_WIDTH        (TIMER_WIDTH),
                .S_SLAVE_REGS       (S_SLAVE_REGS),
                .S_MASTER_REGS      (S_MASTER_REGS),
                .M_SLAVE_REGS       (M_SLAVE_REGS),
                .M_MASTER_REGS      (M_MASTER_REGS),
                
                .INIT_CTL_CONTROL   (INIT_CTL_CONTROL),
                .INIT_PARAM_WIDTH   (INIT_PARAM_WIDTH),
                .INIT_PARAM_HEIGHT  (INIT_PARAM_HEIGHT),
                .INIT_PARAM_FILL    (INIT_PARAM_FILL),
                .INIT_PARAM_TIMEOUT (INIT_PARAM_TIMEOUT)
            )
        i_video_format_regularizer
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                
                .s_wb_rst_i         (s_wb_rst_i),
                .s_wb_clk_i         (s_wb_clk_i),
                .s_wb_adr_i         (s_wb_adr_i),
                .s_wb_dat_i         (s_wb_dat_i),
                .s_wb_dat_o         (s_wb_dat_o),
                .s_wb_we_i          (s_wb_we_i),
                .s_wb_sel_i         (s_wb_sel_i),
                .s_wb_stb_i         (s_wb_stb_i),
                .s_wb_ack_o         (s_wb_ack_o),

                .out_param_width    (),
                .out_param_height   (),

                .s_axi4s_tuser      (s_axi4s_tuser),
                .s_axi4s_tlast      (s_axi4s_tlast),
                .s_axi4s_tdata      (s_axi4s_tdata),
                .s_axi4s_tvalid     (s_axi4s_tvalid & !timeout_busy),
                .s_axi4s_tready     (s_axi4s_tready),
                
                .m_axi4s_tuser      (m_axi4s_tuser),
                .m_axi4s_tlast      (m_axi4s_tlast),
                .m_axi4s_tdata      (m_axi4s_tdata),
                .m_axi4s_tvalid     (m_axi4s_tvalid),
                .m_axi4s_tready     (m_axi4s_tready)
            );


    // -----------------------------
    //  model
    // -----------------------------

    // master
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (TDATA_WIDTH),
                .X_NUM              (128),
                .Y_NUM              (128),
                .PPM_FILE           ("../lena_128x128.ppm"),
                .BUSY_RATE          (50),
                .RANDOM_SEED        (0)
            )
        i_axi4s_master_model
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .m_axi4s_tuser      (s_axi4s_tuser),
                .m_axi4s_tlast      (s_axi4s_tlast),
                .m_axi4s_tdata      (s_axi4s_tdata),
                .m_axi4s_tvalid     (s_axi4s_tvalid),
                .m_axi4s_tready     (s_axi4s_tready & !timeout_busy)
            );
    
    // slave
    always @(posedge aclk) begin
        m_axi4s_tready <= {$random()};
    end
    
    

    // -----------------------------
    //  dump
    // -----------------------------

    integer     fp_img;
    initial begin
         fp_img = $fopen("out_img.ppm", "w");
         $fdisplay(fp_img, "P3");
         $fdisplay(fp_img, "%d %d", X_NUM, Y_NUM*FRAME_NUM);
         $fdisplay(fp_img, "255");
    end
    
    always @(posedge aclk) begin
        if ( aresetn && m_axi4s_tvalid && m_axi4s_tready ) begin
             $fdisplay(fp_img, "%d %d %d", m_axi4s_tdata[0*8 +: 8], m_axi4s_tdata[1*8 +: 8], m_axi4s_tdata[2*8 +: 8]);
        end
    end
    
    integer frame_count = 0;
    always @(posedge aclk) begin
        if ( aresetn && m_axi4s_tuser[0] && m_axi4s_tvalid && m_axi4s_tready ) begin
            $display("frame : %d", frame_count);
            frame_count = frame_count + 1;
            if ( frame_count > FRAME_NUM+1 ) begin
                $finish();
            end
        end
    end
        
endmodule


`default_nettype wire


// end of file
