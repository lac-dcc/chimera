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



module jelly_data_split_pack
        #(
            parameter NUM         = 10,
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
            parameter S_REGS      = 0,
            parameter M_REGS      = 0,
            
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
            
            input   wire    [DATA0_BITS-1:0]    s_data0,
            input   wire    [DATA1_BITS-1:0]    s_data1,
            input   wire    [DATA2_BITS-1:0]    s_data2,
            input   wire    [DATA3_BITS-1:0]    s_data3,
            input   wire    [DATA4_BITS-1:0]    s_data4,
            input   wire    [DATA5_BITS-1:0]    s_data5,
            input   wire    [DATA6_BITS-1:0]    s_data6,
            input   wire    [DATA7_BITS-1:0]    s_data7,
            input   wire    [DATA8_BITS-1:0]    s_data8,
            input   wire    [DATA9_BITS-1:0]    s_data9,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [DATA0_BITS-1:0]    m0_data,
            output  wire                        m0_valid,
            input   wire                        m0_ready,
            
            output  wire    [DATA1_BITS-1:0]    m1_data,
            output  wire                        m1_valid,
            input   wire                        m1_ready,
            
            output  wire    [DATA2_BITS-1:0]    m2_data,
            output  wire                        m2_valid,
            input   wire                        m2_ready,
            
            output  wire    [DATA3_BITS-1:0]    m3_data,
            output  wire                        m3_valid,
            input   wire                        m3_ready,
            
            output  wire    [DATA4_BITS-1:0]    m4_data,
            output  wire                        m4_valid,
            input   wire                        m4_ready,
            
            output  wire    [DATA5_BITS-1:0]    m5_data,
            output  wire                        m5_valid,
            input   wire                        m5_ready,
            
            output  wire    [DATA6_BITS-1:0]    m6_data,
            output  wire                        m6_valid,
            input   wire                        m6_ready,
            
            output  wire    [DATA7_BITS-1:0]    m7_data,
            output  wire                        m7_valid,
            input   wire                        m7_ready,
            
            output  wire    [DATA8_BITS-1:0]    m8_data,
            output  wire                        m8_valid,
            input   wire                        m8_ready,
            
            output  wire    [DATA9_BITS-1:0]    m9_data,
            output  wire                        m9_valid,
            input   wire                        m9_ready
        );
    
    
    // -----------------------------------------
    //  insert FF
    // -----------------------------------------
    
    wire    [DATA0_BITS-1:0]    ff_s_data0;
    wire    [DATA1_BITS-1:0]    ff_s_data1;
    wire    [DATA2_BITS-1:0]    ff_s_data2;
    wire    [DATA3_BITS-1:0]    ff_s_data3;
    wire    [DATA4_BITS-1:0]    ff_s_data4;
    wire    [DATA5_BITS-1:0]    ff_s_data5;
    wire    [DATA6_BITS-1:0]    ff_s_data6;
    wire    [DATA7_BITS-1:0]    ff_s_data7;
    wire    [DATA8_BITS-1:0]    ff_s_data8;
    wire    [DATA9_BITS-1:0]    ff_s_data9;
    wire                        ff_s_valid;
    wire                        ff_s_ready;
    
    wire    [DATA0_BITS-1:0]    ff_m0_data;
    wire                        ff_m0_valid;
    wire                        ff_m0_ready;
    
    wire    [DATA1_BITS-1:0]    ff_m1_data;
    wire                        ff_m1_valid;
    wire                        ff_m1_ready;
    
    wire    [DATA2_BITS-1:0]    ff_m2_data;
    wire                        ff_m2_valid;
    wire                        ff_m2_ready;
    
    wire    [DATA3_BITS-1:0]    ff_m3_data;
    wire                        ff_m3_valid;
    wire                        ff_m3_ready;
    
    wire    [DATA4_BITS-1:0]    ff_m4_data;
    wire                        ff_m4_valid;
    wire                        ff_m4_ready;
    
    wire    [DATA5_BITS-1:0]    ff_m5_data;
    wire                        ff_m5_valid;
    wire                        ff_m5_ready;
    
    wire    [DATA6_BITS-1:0]    ff_m6_data;
    wire                        ff_m6_valid;
    wire                        ff_m6_ready;
    
    wire    [DATA7_BITS-1:0]    ff_m7_data;
    wire                        ff_m7_valid;
    wire                        ff_m7_ready;
    
    wire    [DATA8_BITS-1:0]    ff_m8_data;
    wire                        ff_m8_valid;
    wire                        ff_m8_ready;
    
    wire    [DATA9_BITS-1:0]    ff_m9_data;
    wire                        ff_m9_valid;
    wire                        ff_m9_ready;
    
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
        i_data_ff_pack_s
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (s_data0),
                .s_data1        (s_data1),
                .s_data2        (s_data2),
                .s_data3        (s_data3),
                .s_data4        (s_data4),
                .s_data5        (s_data5),
                .s_data6        (s_data6),
                .s_data7        (s_data7),
                .s_data8        (s_data8),
                .s_data9        (s_data9),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data0        (ff_s_data0),
                .m_data1        (ff_s_data1),
                .m_data2        (ff_s_data2),
                .m_data3        (ff_s_data3),
                .m_data4        (ff_s_data4),
                .m_data5        (ff_s_data5),
                .m_data6        (ff_s_data6),
                .m_data7        (ff_s_data7),
                .m_data8        (ff_s_data8),
                .m_data9        (ff_s_data9),
                .m_valid        (ff_s_valid),
                .m_ready        (ff_s_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA0_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m0
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m0_data),
                .s_valid        (ff_m0_valid),
                .s_ready        (ff_m0_ready),
                
                .m_data         (m0_data),
                .m_valid        (m0_valid),
                .m_ready        (m0_ready)
            );
        
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA1_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m1
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m1_data),
                .s_valid        (ff_m1_valid),
                .s_ready        (ff_m1_ready),
                
                .m_data         (m1_data),
                .m_valid        (m1_valid),
                .m_ready        (m1_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA2_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m2
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m2_data),
                .s_valid        (ff_m2_valid),
                .s_ready        (ff_m2_ready),
                
                .m_data         (m2_data),
                .m_valid        (m2_valid),
                .m_ready        (m2_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA3_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m3
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m3_data),
                .s_valid        (ff_m3_valid),
                .s_ready        (ff_m3_ready),
                
                .m_data         (m3_data),
                .m_valid        (m3_valid),
                .m_ready        (m3_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA4_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m4
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m4_data),
                .s_valid        (ff_m4_valid),
                .s_ready        (ff_m4_ready),
                
                .m_data         (m4_data),
                .m_valid        (m4_valid),
                .m_ready        (m4_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA5_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m5
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m5_data),
                .s_valid        (ff_m5_valid),
                .s_ready        (ff_m5_ready),
                
                .m_data         (m5_data),
                .m_valid        (m5_valid),
                .m_ready        (m5_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA6_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m6
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m6_data),
                .s_valid        (ff_m6_valid),
                .s_ready        (ff_m6_ready),
                
                .m_data         (m6_data),
                .m_valid        (m6_valid),
                .m_ready        (m6_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA7_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m7
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m7_data),
                .s_valid        (ff_m7_valid),
                .s_ready        (ff_m7_ready),
                
                .m_data         (m7_data),
                .m_valid        (m7_valid),
                .m_ready        (m7_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA8_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m8
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m8_data),
                .s_valid        (ff_m8_valid),
                .s_ready        (ff_m8_ready),
                
                .m_data         (m8_data),
                .m_valid        (m8_valid),
                .m_ready        (m8_ready)
            );
    
    jelly_data_ff
            #(
                .DATA_WIDTH     (DATA9_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        i_data_ff_m9
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (ff_m9_data),
                .s_valid        (ff_m9_valid),
                .s_ready        (ff_m9_ready),
                
                .m_data         (m9_data),
                .m_valid        (m9_valid),
                .m_ready        (m9_ready)
            );
    
    wire    [9:0]               ff_m_valid_tmp;
    wire    [9:0]               ff_m_ready_tmp;

    wire    [NUM-1:0]           ff_m_valid;
    wire    [NUM-1:0]           ff_m_ready;

    assign {ff_m9_valid, ff_m8_valid, ff_m7_valid, ff_m6_valid, ff_m5_valid, ff_m4_valid, ff_m3_valid, ff_m2_valid, ff_m1_valid, ff_m0_valid} = ff_m_valid_tmp;
    assign ff_m_ready_tmp = {ff_m9_ready, ff_m8_ready, ff_m7_ready, ff_m6_ready, ff_m5_ready, ff_m4_ready, ff_m3_ready, ff_m2_ready, ff_m1_ready, ff_m0_ready};

    assign ff_m_valid_tmp[NUM-1:0] = ff_m_valid;
    assign ff_m_ready              = ff_m_ready_tmp[NUM-1:0];

    
    
    // -----------------------------------------
    //  split
    // -----------------------------------------
    
    reg     [NUM-1:0]           reg_complete;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_complete <= {NUM{1'b0}};
        end
        else if ( cke ) begin
            if ( ff_s_valid & ff_s_ready ) begin
                reg_complete <= {NUM{1'b0}};
            end
            else if ( |ff_m_valid ) begin
                reg_complete <= (reg_complete | ff_m_ready);
            end
        end
    end
    
    assign ff_s_ready = |ff_m_valid && ((ff_m_ready | reg_complete)) == {NUM{1'b1}};
    
    assign ff_m0_data = ff_s_data0;
    assign ff_m1_data = ff_s_data1;
    assign ff_m2_data = ff_s_data2;
    assign ff_m3_data = ff_s_data3;
    assign ff_m4_data = ff_s_data4;
    assign ff_m5_data = ff_s_data5;
    assign ff_m6_data = ff_s_data6;
    assign ff_m7_data = ff_s_data7;
    assign ff_m8_data = ff_s_data8;
    assign ff_m9_data = ff_s_data9;
    assign ff_m_valid = {NUM{ff_s_valid}} & ~reg_complete;
    
    
endmodule


`default_nettype wire


// end of file
