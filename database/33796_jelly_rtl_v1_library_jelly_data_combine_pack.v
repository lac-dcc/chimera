// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_data_combine_pack
        #(
            parameter NUM         = 1,
            parameter DATA0_WIDTH = 8,
            parameter DATA1_WIDTH = 8,
            parameter DATA2_WIDTH = 0,
            parameter DATA3_WIDTH = 0,
            parameter DATA4_WIDTH = 0,
            parameter DATA5_WIDTH = 0,
            parameter DATA6_WIDTH = 0,
            parameter DATA7_WIDTH = 0,
            parameter DATA8_WIDTH = 0,
            parameter DATA9_WIDTH = 0,
            parameter S_REGS      = 1,
            parameter M_REGS      = 1,
            
            // local
            parameter DATA0_BITS  = DATA0_WIDTH > 0 ? DATA0_WIDTH : 1,
            parameter DATA1_BITS  = DATA1_WIDTH > 0 ? DATA1_WIDTH : 1,
            parameter DATA2_BITS  = DATA2_WIDTH > 0 ? DATA2_WIDTH : 1,
            parameter DATA3_BITS  = DATA3_WIDTH > 0 ? DATA3_WIDTH : 1,
            parameter DATA4_BITS  = DATA4_WIDTH > 0 ? DATA4_WIDTH : 1,
            parameter DATA5_BITS  = DATA5_WIDTH > 0 ? DATA5_WIDTH : 1,
            parameter DATA6_BITS  = DATA6_WIDTH > 0 ? DATA6_WIDTH : 1,
            parameter DATA7_BITS  = DATA7_WIDTH > 0 ? DATA7_WIDTH : 1,
            parameter DATA8_BITS  = DATA8_WIDTH > 0 ? DATA8_WIDTH : 1,
            parameter DATA9_BITS  = DATA9_WIDTH > 0 ? DATA9_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [DATA0_BITS-1:0]    s0_data,
            input   wire                        s0_valid,
            output  wire                        s0_ready,
            
            input   wire    [DATA1_BITS-1:0]    s1_data,
            input   wire                        s1_valid,
            output  wire                        s1_ready,
            
            input   wire    [DATA2_BITS-1:0]    s2_data,
            input   wire                        s2_valid,
            output  wire                        s2_ready,
            
            input   wire    [DATA3_BITS-1:0]    s3_data,
            input   wire                        s3_valid,
            output  wire                        s3_ready,
            
            input   wire    [DATA4_BITS-1:0]    s4_data,
            input   wire                        s4_valid,
            output  wire                        s4_ready,
            
            input   wire    [DATA5_BITS-1:0]    s5_data,
            input   wire                        s5_valid,
            output  wire                        s5_ready,
            
            input   wire    [DATA6_BITS-1:0]    s6_data,
            input   wire                        s6_valid,
            output  wire                        s6_ready,
            
            input   wire    [DATA7_BITS-1:0]    s7_data,
            input   wire                        s7_valid,
            output  wire                        s7_ready,
            
            input   wire    [DATA8_BITS-1:0]    s8_data,
            input   wire                        s8_valid,
            output  wire                        s8_ready,
            
            input   wire    [DATA9_BITS-1:0]    s9_data,
            input   wire                        s9_valid,
            output  wire                        s9_ready,
            
            
            output  wire    [DATA0_BITS-1:0]    m_data0,
            output  wire    [DATA1_BITS-1:0]    m_data1,
            output  wire    [DATA2_BITS-1:0]    m_data2,
            output  wire    [DATA3_BITS-1:0]    m_data3,
            output  wire    [DATA4_BITS-1:0]    m_data4,
            output  wire    [DATA5_BITS-1:0]    m_data5,
            output  wire    [DATA6_BITS-1:0]    m_data6,
            output  wire    [DATA7_BITS-1:0]    m_data7,
            output  wire    [DATA8_BITS-1:0]    m_data8,
            output  wire    [DATA9_BITS-1:0]    m_data9,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    
    
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    wire    [DATA0_BITS-1:0]    ff_s0_data;
    wire                        ff_s0_valid;
    wire                        ff_s0_ready;
    
    wire    [DATA1_BITS-1:0]    ff_s1_data;
    wire                        ff_s1_valid;
    wire                        ff_s1_ready;
    
    wire    [DATA2_BITS-1:0]    ff_s2_data;
    wire                        ff_s2_valid;
    wire                        ff_s2_ready;
    
    wire    [DATA3_BITS-1:0]    ff_s3_data;
    wire                        ff_s3_valid;
    wire                        ff_s3_ready;
    
    wire    [DATA4_BITS-1:0]    ff_s4_data;
    wire                        ff_s4_valid;
    wire                        ff_s4_ready;
    
    wire    [DATA5_BITS-1:0]    ff_s5_data;
    wire                        ff_s5_valid;
    wire                        ff_s5_ready;
    
    wire    [DATA6_BITS-1:0]    ff_s6_data;
    wire                        ff_s6_valid;
    wire                        ff_s6_ready;
    
    wire    [DATA7_BITS-1:0]    ff_s7_data;
    wire                        ff_s7_valid;
    wire                        ff_s7_ready;
    
    wire    [DATA8_BITS-1:0]    ff_s8_data;
    wire                        ff_s8_valid;
    wire                        ff_s8_ready;
    
    wire    [DATA9_BITS-1:0]    ff_s9_data;
    wire                        ff_s9_valid;
    wire                        ff_s9_ready;
    
    wire    [DATA0_BITS-1:0]    ff_m_data0;
    wire    [DATA1_BITS-1:0]    ff_m_data1;
    wire    [DATA2_BITS-1:0]    ff_m_data2;
    wire    [DATA3_BITS-1:0]    ff_m_data3;
    wire    [DATA4_BITS-1:0]    ff_m_data4;
    wire    [DATA5_BITS-1:0]    ff_m_data5;
    wire    [DATA6_BITS-1:0]    ff_m_data6;
    wire    [DATA7_BITS-1:0]    ff_m_data7;
    wire    [DATA8_BITS-1:0]    ff_m_data8;
    wire    [DATA9_BITS-1:0]    ff_m_data9;
    wire                        ff_m_valid;
    wire                        ff_m_ready;
    
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA0_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s0
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s0_data),
                .s_valid        (s0_valid),
                .s_ready        (s0_ready),
                
                .m_data         (ff_s0_data),
                .m_valid        (ff_s0_valid),
                .m_ready        (ff_s0_ready)
            );
        
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA1_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s1
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s1_data),
                .s_valid        (s1_valid),
                .s_ready        (s1_ready),
                
                .m_data         (ff_s1_data),
                .m_valid        (ff_s1_valid),
                .m_ready        (ff_s1_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA2_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s2
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s2_data),
                .s_valid        (s2_valid),
                .s_ready        (s2_ready),
                
                .m_data         (ff_s2_data),
                .m_valid        (ff_s2_valid),
                .m_ready        (ff_s2_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA3_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s3
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s3_data),
                .s_valid        (s3_valid),
                .s_ready        (s3_ready),
                
                .m_data         (ff_s3_data),
                .m_valid        (ff_s3_valid),
                .m_ready        (ff_s3_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA4_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s4
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s4_data),
                .s_valid        (s4_valid),
                .s_ready        (s4_ready),
                
                .m_data         (ff_s4_data),
                .m_valid        (ff_s4_valid),
                .m_ready        (ff_s4_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA5_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s5
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s5_data),
                .s_valid        (s5_valid),
                .s_ready        (s5_ready),
                
                .m_data         (ff_s5_data),
                .m_valid        (ff_s5_valid),
                .m_ready        (ff_s5_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA6_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s6
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s6_data),
                .s_valid        (s6_valid),
                .s_ready        (s6_ready),
                
                .m_data         (ff_s6_data),
                .m_valid        (ff_s6_valid),
                .m_ready        (ff_s6_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA7_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s7
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s7_data),
                .s_valid        (s7_valid),
                .s_ready        (s7_ready),
                
                .m_data         (ff_s7_data),
                .m_valid        (ff_s7_valid),
                .m_ready        (ff_s7_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA8_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s8
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s8_data),
                .s_valid        (s8_valid),
                .s_ready        (s8_ready),
                
                .m_data         (ff_s8_data),
                .m_valid        (ff_s8_valid),
                .m_ready        (ff_s8_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA9_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_s9
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s9_data),
                .s_valid        (s9_valid),
                .s_ready        (s9_ready),
                
                .m_data         (ff_s9_data),
                .m_valid        (ff_s9_valid),
                .m_ready        (ff_s9_ready)
            );
    
    
    jelly_data_ff_pack
            #(
                .DATA0_WIDTH    (DATA0_WIDTH),
                .DATA1_WIDTH    (DATA1_WIDTH),
                .DATA2_WIDTH    (DATA2_WIDTH),
                .DATA3_WIDTH    (DATA3_WIDTH),
                .DATA4_WIDTH    (DATA4_WIDTH),
                .DATA5_WIDTH    (DATA5_WIDTH),
                .DATA6_WIDTH    (DATA6_WIDTH),
                .DATA7_WIDTH    (DATA7_WIDTH),
                .DATA8_WIDTH    (DATA8_WIDTH),
                .DATA9_WIDTH    (DATA9_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         (0)
            )
        i_data_ff_pack_m
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (ff_m_data0),
                .s_data1        (ff_m_data1),
                .s_data2        (ff_m_data2),
                .s_data3        (ff_m_data3),
                .s_data4        (ff_m_data4),
                .s_data5        (ff_m_data5),
                .s_data6        (ff_m_data6),
                .s_data7        (ff_m_data7),
                .s_data8        (ff_m_data8),
                .s_data9        (ff_m_data9),
                .s_valid        (ff_m_valid),
                .s_ready        (ff_m_ready),
                
                .m_data0        (m_data0),
                .m_data1        (m_data1),
                .m_data2        (m_data2),
                .m_data3        (m_data3),
                .m_data4        (m_data4),
                .m_data5        (m_data5),
                .m_data6        (m_data6),
                .m_data7        (m_data7),
                .m_data8        (m_data8),
                .m_data9        (m_data9),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    wire    [NUM-1:0]           ff_s_valid;
    wire    [NUM-1:0]           ff_s_ready;
    assign ff_s_valid = {ff_s9_valid, ff_s8_valid, ff_s7_valid, ff_s6_valid, ff_s5_valid, ff_s4_valid, ff_s3_valid, ff_s2_valid, ff_s1_valid, ff_s0_valid};
    assign {ff_s9_ready, ff_s8_ready, ff_s7_ready, ff_s6_ready, ff_s5_ready, ff_s4_ready, ff_s3_ready, ff_s2_ready, ff_s1_ready, ff_s0_ready} = ff_s_ready;
    
    
    
    // -----------------------------------------
    //  combiner
    // -----------------------------------------
    
    genvar          i;
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_s_ready
        assign ff_s_ready[i] = (ff_m_valid && ff_m_ready);
    end
    endgenerate
    
    assign ff_m_data0 = ff_s0_data;
    assign ff_m_data1 = ff_s1_data;
    assign ff_m_data2 = ff_s2_data;
    assign ff_m_data3 = ff_s3_data;
    assign ff_m_data4 = ff_s4_data;
    assign ff_m_data5 = ff_s5_data;
    assign ff_m_data6 = ff_s6_data;
    assign ff_m_data7 = ff_s7_data;
    assign ff_m_data8 = ff_s8_data;
    assign ff_m_data9 = ff_s9_data;
    assign ff_m_valid = &ff_s_valid;
    
    
endmodule


`default_nettype wire


// end of file
