// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_sim();
    localparam RATE = 10.0;
    
    initial begin
        $dumpfile("tb_sim.vcd");
        $dumpvars(0, tb_sim);
        
    #2000000
        $finish();
    end

    reg     aresetn = 1'b0;
    always #(RATE*100)  aresetn = 1'b1;

    reg     aclk = 1'b1;
    always #(RATE/2.0)  aclk = ~aclk;
    

    // -----------------------------
    //  main
    // -----------------------------

    parameter   USER_WIDTH = 1;
    parameter   DATA_WIDTH = 8;
    
    parameter   X_NUM      = 256;
    parameter   Y_NUM      = 256;
    parameter   PGM_FILE   = "../BOAT.pgm";
    
    parameter   X_WIDTH    = 10;
    parameter   Y_WIDTH    = 9;
    
    wire                        axi4s_src_tlast;
    wire    [0:0]               axi4s_src_tuser;
    wire    [DATA_WIDTH-1:0]    axi4s_src_tdata;
    wire                        axi4s_src_tvalid;
    wire                        axi4s_src_tready;

    wire                        axi4s_dst_tlast;
    wire    [0:0]               axi4s_dst_tuser;
    wire    [DATA_WIDTH-1:0]    axi4s_dst_tdata;
    wire                        axi4s_dst_tvalid;
    wire                        axi4s_dst_tready;

    wire                        axi4s_angle_tlast;
    wire    [0:0]               axi4s_angle_tuser;
    wire    [3*DATA_WIDTH-1:0]  axi4s_angle_tdata;
    wire                        axi4s_angle_tvalid;
    wire                        axi4s_angle_tready;

    tb_sim_main
            #(
                .USER_WIDTH     (USER_WIDTH),
                .DATA_WIDTH     (DATA_WIDTH),
                .X_NUM          (X_NUM),
                .Y_NUM          (Y_NUM),
                .X_WIDTH        (X_WIDTH),
                .Y_WIDTH        (Y_WIDTH)
            )
        i_sim_main
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                
                .s_axi4s_src_tuser      (axi4s_src_tuser),
                .s_axi4s_src_tlast      (axi4s_src_tlast),
                .s_axi4s_src_tdata      (axi4s_src_tdata),
                .s_axi4s_src_tvalid     (axi4s_src_tvalid),
                .s_axi4s_src_tready     (axi4s_src_tready),

                .m_axi4s_dst_tuser      (axi4s_dst_tuser),
                .m_axi4s_dst_tlast      (axi4s_dst_tlast),
                .m_axi4s_dst_tdata      (axi4s_dst_tdata),
                .m_axi4s_dst_tvalid     (axi4s_dst_tvalid),
                .m_axi4s_dst_tready     (axi4s_dst_tready),

                .m_axi4s_angle_tuser    (axi4s_angle_tuser),
                .m_axi4s_angle_tlast    (axi4s_angle_tlast),
                .m_axi4s_angle_tdata    (axi4s_angle_tdata),
                .m_axi4s_angle_tvalid   (axi4s_angle_tvalid)
        );

   

    // -----------------------------
    //  model
    // -----------------------------

    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (DATA_WIDTH),
                .X_NUM              (X_NUM),
                .Y_NUM              (Y_NUM),
                .PGM_FILE           (PGM_FILE),
                .BUSY_RATE          (0),
                .RANDOM_SEED        (0)
            )
        i_axi4s_master_model
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .m_axi4s_tdata      (axi4s_src_tdata),
                .m_axi4s_tlast      (axi4s_src_tlast),
                .m_axi4s_tuser      (axi4s_src_tuser),
                .m_axi4s_tvalid     (axi4s_src_tvalid),
                .m_axi4s_tready     (axi4s_src_tready)
            );
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (1),
                .DATA_WIDTH         (8),
                .FILE_NAME          ("src_%04d.pgm"),
                .BUSY_RATE          (0)
            )
        i_axi4s_slave_model_src
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (1'b1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (axi4s_src_tuser),
                .s_axi4s_tlast      (axi4s_src_tlast),
                .s_axi4s_tdata      (axi4s_src_tdata),
                .s_axi4s_tvalid     (axi4s_src_tvalid),
                .s_axi4s_tready     (axi4s_src_tready)
            );
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (1),
                .DATA_WIDTH         (8),
                .FILE_NAME          ("img_%04d.pgm"),
                .BUSY_RATE          (0),
                .RANDOM_SEED        (23456)
            )
        i_axi4s_slave_model_data
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (1'b1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (axi4s_dst_tuser),
                .s_axi4s_tlast      (axi4s_dst_tlast),
                .s_axi4s_tdata      (axi4s_dst_tdata[7:0]),
                .s_axi4s_tvalid     (axi4s_dst_tvalid),
                .s_axi4s_tready     (axi4s_dst_tready)
            );
    
    
    wire    [23:0]      axi4s_angle_tcolor;
    jelly_colormap_table
            #(
                .COLORMAP           ("HSV")
            )
        i_colormap_table
            (
                .in_data            (axi4s_angle_tdata),
                .out_data           (axi4s_angle_tcolor)
            );
    
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (3),
                .DATA_WIDTH         (8),
                .FILE_NAME          ("ang_%04d.ppm")
            )
        i_axi4s_slave_model_angle
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (1'b1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (axi4s_angle_tuser),
                .s_axi4s_tlast      (axi4s_angle_tlast),
                .s_axi4s_tdata      (axi4s_angle_tcolor),
                .s_axi4s_tvalid     (axi4s_angle_tvalid),
                .s_axi4s_tready     (axi4s_angle_tready)
            );
    
    
endmodule


`default_nettype wire


// end of file
