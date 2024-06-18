// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_texture_bilinear();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_texture_bilinear.vcd");
        $dumpvars(0, tb_texture_bilinear);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    parameter   RAND_BUSY = 0;
    
    
    parameter   COMPONENT_NUM       = 2;
    parameter   DATA_WIDTH          = 12;
    parameter   USER_WIDTH          = 0;
    parameter   X_INT_WIDTH         = 8;
    parameter   X_FRAC_WIDTH        = 4;
    parameter   Y_INT_WIDTH         = 8;
    parameter   Y_FRAC_WIDTH        = 4;
    parameter   COEFF_WIDTH         = 1 + X_FRAC_WIDTH + Y_FRAC_WIDTH;
    parameter   S_REGS              = 1;
    parameter   M_REGS              = 1;
    parameter   DEVICE              = "7SERIES"; // "RTL";
    
    parameter   USER_FIFO_PTR_WIDTH = 6;
    parameter   USER_FIFO_RAM_TYPE  = "distributed";
    parameter   USER_FIFO_M_REGS    = 0;
    
    parameter   X_WIDTH             = X_INT_WIDTH + X_FRAC_WIDTH;
    parameter   Y_WIDTH             = Y_INT_WIDTH + Y_FRAC_WIDTH;
    parameter   USER_BITS           = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    reg                                     cke = 1;
    
//  wire    [USER_BITS-1:0]                 s_user;
    reg     [X_WIDTH-1:0]                   s_x;
    reg     [Y_WIDTH-1:0]                   s_y;
    reg                                     s_strb = 1;
    reg                                     s_valid;
    wire                                    s_ready;
    
    wire    [X_WIDTH-1:0]                   m_x;
    wire    [Y_WIDTH-1:0]                   m_y;
//  wire    [USER_BITS-1:0]                 m_user;
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  m_data;
    wire                                    m_strb;
    wire                                    m_valid;
    reg                                     m_ready = 1;
    
    wire    [COEFF_WIDTH-1:0]               m_mem_arcoeff;
    wire    [Y_INT_WIDTH-1:0]               m_mem_araddrx;
    wire    [Y_INT_WIDTH-1:0]               m_mem_araddry;
    wire                                    m_mem_arstrb;
    wire                                    m_mem_arvalid;
    wire                                    m_mem_arready;
    
    wire    [COEFF_WIDTH-1:0]               m_mem_rcoeff;
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  m_mem_rdata;
    wire                                    m_mem_rstrb;
    wire                                    m_mem_rvalid;
    wire                                    m_mem_rready;
    
    jelly_texture_bilinear
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .DATA_WIDTH             (DATA_WIDTH),
                .USER_WIDTH             (Y_WIDTH+X_WIDTH),
                .X_INT_WIDTH            (X_INT_WIDTH),
                .X_FRAC_WIDTH           (X_FRAC_WIDTH),
                .Y_INT_WIDTH            (Y_INT_WIDTH),
                .Y_FRAC_WIDTH           (Y_FRAC_WIDTH),
                .COEFF_WIDTH            (COEFF_WIDTH),
                .S_REGS                 (S_REGS),
                .M_REGS                 (M_REGS),
                .DEVICE                 (DEVICE),
                
                .USER_FIFO_PTR_WIDTH    (USER_FIFO_PTR_WIDTH),
                .USER_FIFO_RAM_TYPE     (USER_FIFO_RAM_TYPE),
                .USER_FIFO_M_REGS       (USER_FIFO_M_REGS)
            )
        i_texture_bilinear
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .param_nearestneighbor  (0),
                .param_blank_value      (0),
                
                .s_user                 ({s_y, s_x}),
                .s_x                    (s_x),
                .s_y                    (s_y),
                .s_strb                 (s_strb),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                
                .m_user                 ({m_y, m_x}),
                .m_data                 (m_data),
                .m_strb                 (m_strb),
                .m_valid                (m_valid),
                .m_ready                (m_ready),
                
        //      .m_mem_arcoeff          (m_mem_arcoeff),    // aruser
                .m_mem_araddrx          (m_mem_araddrx),
                .m_mem_araddry          (m_mem_araddry),
                .m_mem_arstrb           (m_mem_arstrb),
                .m_mem_arvalid          (m_mem_arvalid),
                .m_mem_arready          (m_mem_arready),
                
        //      .m_mem_rcoeff           (m_mem_rcoeff), // ruser
                .m_mem_rdata            (m_mem_rdata),
                .m_mem_rstrb            (m_mem_rstrb),
                .m_mem_rvalid           (m_mem_rvalid),
                .m_mem_rready           (m_mem_rready)
            );
    
    reg     mem_ready = 1;
    
    assign m_mem_rcoeff  = m_mem_arcoeff;
    assign m_mem_rdata   = {m_mem_araddry, 4'd0, m_mem_araddrx, 4'd0};
    assign m_mem_rstrb   = m_mem_arstrb;
    assign m_mem_rvalid  = m_mem_arvalid & mem_ready;
    assign m_mem_arready = m_mem_rready  & mem_ready;
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_x     <= 0;
            s_y     <= 0;
            s_valid <= 0;
        end
        else begin
            if ( s_valid && s_ready ) begin
                s_x     <= s_x + 2;
                s_y     <= s_y + 1;
            end
            
            if ( !s_valid || s_ready ) begin
                s_valid <= RAND_BUSY ? {$random} : 1;
            end
        end
    end
    
    
    integer fp_s;
    integer fp_mem;
    integer fp_m;
    initial begin
        fp_s   = $fopen("s.txt", "w");
        fp_mem = $fopen("mem.txt", "w");
        fp_m   = $fopen("m.txt", "w");
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
        end
        else begin
            if ( s_valid & s_ready) begin
                $fdisplay(fp_s, "%h%h", s_y, s_x);
            end
            
            if ( m_mem_arvalid & m_mem_arready) begin
                $fdisplay(fp_mem, "%h %h %h", m_mem_araddrx, m_mem_araddry, m_mem_arcoeff);
            end
            
            if ( m_valid & m_ready) begin
                $fdisplay(fp_m, "%h", m_data);
            end
        end
    end
    
    
    always @(posedge clk) begin
        if ( RAND_BUSY ) begin
            mem_ready <= {$random};
            m_ready   <= {$random};
        end
    end
    
    
endmodule



`default_nettype wire


// end of file
