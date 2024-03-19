
`timescale 1ns / 1ps
`default_nettype none


module tb_axi4_write_width_convert();
    
    // simulation setting
    initial begin
        $dumpfile("tb_axi4_write_width_convert.vcd");
        $dumpvars(0, tb_axi4_write_width_convert);
        
        #1000000;
            $finish;
    end
    
    localparam S_AWRATE = 1000.0/100.0;
    localparam S_WRATE  = 1000.0/200.0;
    localparam M_AWRATE = 1000.0/166.0;
    localparam M_WRATE  = 1000.0/190.0;
    
    parameter RAND_BUSY = 1;
    
    
    
    // clock & reset
    reg     s_awclk = 1'b1;
    always #(S_AWRATE/2.0)  s_awclk  = ~s_awclk;
    
    reg     s_awresetn = 1'b0;
    initial #(S_AWRATE*100) s_awresetn = 1'b1;
    
    reg     s_wclk = 1'b1;
    always #(S_WRATE/2.0)   s_wclk  = ~s_wclk;
    
    reg     s_wresetn = 1'b0;
    initial #(S_WRATE*100)  s_wresetn = 1'b1;
    
    reg     m_awclk = 1'b1;
    always #(M_AWRATE/2.0)  m_awclk  = ~m_awclk;
    
    reg     m_awresetn = 1'b0;
    initial #(M_AWRATE*100) m_awresetn = 1'b1;
    
    reg     m_wclk = 1'b1;
    always #(M_WRATE/2.0)   m_wclk  = ~m_wclk;
    
    reg     m_wresetn = 1'b0;
    initial #(M_WRATE*100)  m_wresetn = 1'b1;
    
    
    
    // core
    parameter   AWASYNC           = 1;
    parameter   WASYNC            = 1;
    parameter   AW_W_ASYNC        = (AWASYNC || WASYNC);
    parameter   BYTE_WIDTH        = 8;
    
    parameter   HAS_S_WSTRB       = 1;
    parameter   HAS_S_WFIRST      = 0;
    parameter   HAS_S_WLAST       = 0;
    parameter   HAS_M_WSTRB       = 1;
    parameter   HAS_M_WFIRST      = 1;
    parameter   HAS_M_WLAST       = 1;
    
    parameter   AWADDR_WIDTH      = 49;
    parameter   AWUSER_WIDTH      = 0;
    
    parameter   S_WDATA_WIDTH     = 24;  // 8の倍数であること
    parameter   S_WSTRB_WIDTH     = S_WDATA_WIDTH / BYTE_WIDTH;
    parameter   S_WUSER_WIDTH     = 0;
    parameter   S_AWLEN_WIDTH     = 32;
    parameter   S_AWLEN_OFFSET    = 1'b1;
    parameter   S_AWUSER_WIDTH    = 0;
    
    parameter   M_WDATA_SIZE      = 3;   // log2 (0:8bit; 1:16bit; 2:32bit ...)
    parameter   M_WDATA_WIDTH     = (BYTE_WIDTH << M_WDATA_SIZE);
    parameter   M_WSTRB_WIDTH     = M_WDATA_WIDTH / BYTE_WIDTH;
    parameter   M_WUSER_WIDTH     = S_WUSER_WIDTH * M_WDATA_WIDTH / S_WDATA_WIDTH;
    parameter   M_AWLEN_WIDTH     = 32;
    parameter   M_AWLEN_OFFSET    = 1'b1;
    parameter   M_AWUSER_WIDTH    = 0;
    
    parameter   WFIFO_PTR_WIDTH   = 9;
    parameter   WFIFO_RAM_TYPE    = "block";
    parameter   WFIFO_LOW_DEALY   = 0;
    parameter   WFIFO_DOUT_REGS   = 1;
    parameter   WFIFO_S_REGS      = 1;
    parameter   WFIFO_M_REGS      = 1;
    
    parameter   AWFIFO_PTR_WIDTH  = 4;
    parameter   AWFIFO_RAM_TYPE   = "distributed";
    parameter   AWFIFO_LOW_DEALY  = 1;
    parameter   AWFIFO_DOUT_REGS  = 0;
    parameter   AWFIFO_S_REGS     = 1;
    parameter   AWFIFO_M_REGS     = 1;
    
    parameter   DATFIFO_PTR_WIDTH = 4;
    parameter   DATFIFO_RAM_TYPE  = "distributed";
    parameter   DATFIFO_LOW_DEALY = 1;
    parameter   DATFIFO_DOUT_REGS = 0;
    parameter   DATFIFO_S_REGS    = 1;
    parameter   DATFIFO_M_REGS    = 1;
    
    parameter   AWUSER_BITS       = AWUSER_WIDTH  > 0 ? AWUSER_WIDTH  : 1;
    parameter   S_WUSER_BITS      = S_WUSER_WIDTH > 0 ? S_WUSER_WIDTH : 1;
    parameter   M_WUSER_BITS      = M_WUSER_WIDTH > 0 ? M_WUSER_WIDTH : 1;
    
    
    reg                             endian = 0;
    
    reg     [AWADDR_WIDTH-1:0]      s_awaddr;
    reg     [S_AWLEN_WIDTH-1:0]     s_awlen;
    reg     [AWUSER_BITS-1:0]       s_awuser;
    reg                             s_awvalid;
    wire                            s_awready;
    
    reg     [S_WDATA_WIDTH-1:0]     s_wdata;
    reg     [S_WSTRB_WIDTH-1:0]     s_wstrb;
    reg     [S_WUSER_BITS-1:0]      s_wuser;
    reg                             s_wvalid;
    wire                            s_wready;
    reg                             s_wparam_detect_first = 0;
    reg                             s_wparam_detect_last  = 0;
    reg                             s_wparam_padding_en   = 0;
    reg     [S_WDATA_WIDTH-1:0]     s_wparam_padding_data = 0;
    reg     [S_WSTRB_WIDTH-1:0]     s_wparam_padding_strb = 0;
    wire    [WFIFO_PTR_WIDTH:0]     s_wfifo_free_count;
    wire                            s_wfifo_wr_signal;
    
    wire    [AWADDR_WIDTH-1:0]      m_awaddr;
    wire    [M_AWLEN_WIDTH-1:0]     m_awlen;
    wire    [AWUSER_BITS-1:0]       m_awuser;
    wire                            m_awvalid;
    reg                             m_awready;
    
    wire    [M_WDATA_WIDTH-1:0]     m_wdata;
    wire    [M_WSTRB_WIDTH-1:0]     m_wstrb;
    wire                            m_wfirst;
    wire                            m_wlast;
    wire    [M_WUSER_BITS-1:0]      m_wuser;
    wire                            m_wvalid;
    reg                             m_wready;
    wire    [WFIFO_PTR_WIDTH:0]     m_wfifo_data_count;
    wire                            m_wfifo_rd_signal;
    
    jelly_axi4_write_width_convert
            #(
                .AWASYNC                (AWASYNC),
                .WASYNC                 (WASYNC),
                .AW_W_ASYNC             (AW_W_ASYNC),
                .BYTE_WIDTH             (BYTE_WIDTH),
                
                .HAS_S_WSTRB            (HAS_S_WSTRB),
                .HAS_S_WFIRST           (HAS_S_WFIRST),
                .HAS_S_WLAST            (HAS_S_WLAST),
                .HAS_M_WSTRB            (HAS_M_WSTRB),
                .HAS_M_WFIRST           (HAS_M_WFIRST),
                .HAS_M_WLAST            (HAS_M_WLAST),
                
                .AWADDR_WIDTH           (AWADDR_WIDTH),
                .AWUSER_WIDTH           (AWUSER_WIDTH),
                
                .S_WDATA_WIDTH          (S_WDATA_WIDTH),
                .S_WSTRB_WIDTH          (S_WSTRB_WIDTH),
                .S_WUSER_WIDTH          (S_WUSER_WIDTH),
                .S_AWLEN_WIDTH          (S_AWLEN_WIDTH),
                .S_AWLEN_OFFSET         (S_AWLEN_OFFSET),
                .S_AWUSER_WIDTH         (S_AWUSER_WIDTH),
                
                .M_WDATA_SIZE           (M_WDATA_SIZE),
                .M_WDATA_WIDTH          (M_WDATA_WIDTH),
                .M_WSTRB_WIDTH          (M_WSTRB_WIDTH),
                .M_WUSER_WIDTH          (M_WUSER_WIDTH),
                .M_AWLEN_WIDTH          (M_AWLEN_WIDTH),
                .M_AWLEN_OFFSET         (M_AWLEN_OFFSET),
                .M_AWUSER_WIDTH         (M_AWUSER_WIDTH),
                
                .WFIFO_PTR_WIDTH        (WFIFO_PTR_WIDTH),
                .WFIFO_RAM_TYPE         (WFIFO_RAM_TYPE),
                .WFIFO_LOW_DEALY        (WFIFO_LOW_DEALY),
                .WFIFO_DOUT_REGS        (WFIFO_DOUT_REGS),
                .WFIFO_S_REGS           (WFIFO_S_REGS),
                .WFIFO_M_REGS           (WFIFO_M_REGS),
                
                .AWFIFO_PTR_WIDTH       (AWFIFO_PTR_WIDTH),
                .AWFIFO_RAM_TYPE        (AWFIFO_RAM_TYPE),
                .AWFIFO_LOW_DEALY       (AWFIFO_LOW_DEALY),
                .AWFIFO_DOUT_REGS       (AWFIFO_DOUT_REGS),
                .AWFIFO_S_REGS          (AWFIFO_S_REGS),
                .AWFIFO_M_REGS          (AWFIFO_M_REGS),
                
                .DATFIFO_PTR_WIDTH      (DATFIFO_PTR_WIDTH),
                .DATFIFO_RAM_TYPE       (DATFIFO_RAM_TYPE),
                .DATFIFO_LOW_DEALY      (DATFIFO_LOW_DEALY),
                .DATFIFO_DOUT_REGS      (DATFIFO_DOUT_REGS),
                .DATFIFO_S_REGS         (DATFIFO_S_REGS),
                .DATFIFO_M_REGS         (DATFIFO_M_REGS)
            )
        i_axi4_write_width_convert
            (
                .endian                 (endian),
                
                .s_awresetn             (s_awresetn),
                .s_awclk                (s_awclk),
                .s_awaddr               (s_awaddr),
                .s_awlen                (s_awlen),
                .s_awuser               (s_awuser),
                .s_awvalid              (s_awvalid),
                .s_awready              (s_awready),
                
                .s_wresetn              (s_wresetn),
                .s_wclk                 (s_wclk),
                .s_wdata                (s_wdata),
                .s_wstrb                (s_wstrb),
                .s_wuser                (s_wuser),
                .s_wvalid               (s_wvalid),
                .s_wready               (s_wready),
                .s_wparam_detect_first  (s_wparam_detect_first),
                .s_wparam_detect_last   (s_wparam_detect_last),
                .s_wparam_padding_en    (s_wparam_padding_en),
                .s_wparam_padding_data  (s_wparam_padding_data),
                .s_wparam_padding_strb  (s_wparam_padding_strb),
                .s_wfifo_free_count     (s_wfifo_free_count),
                .s_wfifo_wr_signal      (s_wfifo_wr_signal),
                
                .m_awresetn             (m_awresetn),
                .m_awclk                (m_awclk),
                .m_awaddr               (m_awaddr),
                .m_awlen                (m_awlen),
                .m_awuser               (m_awuser),
                .m_awvalid              (m_awvalid),
                .m_awready              (m_awready),
                
                .m_wresetn              (m_wresetn),
                .m_wclk                 (m_wclk),
                .m_wdata                (m_wdata),
                .m_wstrb                (m_wstrb),
                .m_wfirst               (m_wfirst),
                .m_wlast                (m_wlast),
                .m_wuser                (m_wuser),
                .m_wvalid               (m_wvalid),
                .m_wready               (m_wready),
                .m_wfifo_data_count     (m_wfifo_data_count),
                .m_wfifo_rd_signal      (m_wfifo_rd_signal)
            );
    
    always @(posedge s_wclk) begin
        if ( ~s_wresetn ) begin
            s_wdata  <= 0;
            s_wstrb  <= {S_WSTRB_WIDTH{1'b1}};
            s_wuser  <= 0;
            s_wvalid <= 0;
        end
        else begin
            if ( !s_wvalid | s_wready ) begin
                s_wvalid <= (RAND_BUSY ? {$random()} : 1'b1);
            end
            
            if ( s_wvalid & s_wready ) begin
                s_wdata <= s_wdata + 1;
            end
        end
    end
    
    
    always @(posedge m_awclk) begin
        if ( ~m_awresetn ) begin
            m_awready <= 0;
        end
        else begin
            m_awready <= (RAND_BUSY ? {$random()} : 1'b1);
        end
    end
    
    always @(posedge m_wclk) begin
        if ( ~m_wresetn ) begin
            m_wready <= 0;
        end
        else begin
            m_wready <= (RAND_BUSY ? {$random()} : 1'b1);
        end
    end
    
    
    integer fp_s_aw;
    integer fp_m_aw;
    integer fp_m_w;
    initial begin
        fp_s_aw = $fopen("out_s_aw.txt", "w");
        fp_m_aw = $fopen("out_m_aw.txt", "w");
        fp_m_w  = $fopen("out_m_w.txt",  "w");
    end
    
    always @(posedge s_awclk) begin
        if ( s_awresetn ) begin
            if ( s_awvalid && s_awready ) begin
                $fdisplay(fp_s_aw, "%h %h", s_awaddr, s_awlen);
            end
        end
    end
    
    always @(posedge m_awclk) begin
        if ( m_awresetn ) begin
            if ( m_awvalid && m_awready ) begin
                $fdisplay(fp_m_aw, "%h %h", m_awaddr, m_awlen);
            end
        end
    end
    
    integer count_m_w = 0;
    always @(posedge m_wclk) begin
        if ( m_wresetn ) begin
            if ( m_wvalid && m_wready ) begin
                $fdisplay(fp_m_w, "%h %h %b %b", m_wdata, m_wstrb, m_wfirst, m_wlast);
                count_m_w <= count_m_w + 1;
            end
        end
    end
    
    
    integer     i;
    initial begin
        #0;
            s_awaddr  <= 0;
            s_awlen   <= 0;
            s_awuser  <= 0;
            s_awvalid <= 0;
        #10000;
        
        
        @(posedge s_awclk)
            s_awaddr  <= 0;
            s_awlen   <= 16  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;
        
        
        @(posedge s_awclk)
            s_awaddr  <= 0;
            s_awlen   <= 15 - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;
        
        
        @(posedge s_awclk)
            s_awaddr  <= 0;
            s_awlen   <= 1 - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;
        
        
        @(posedge s_awclk)
            s_awaddr  <= 1;
            s_awlen   <= 16  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
            #10000;
        
        @(posedge s_awclk)
            s_awaddr  <= 3;
            s_awlen   <= 15  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
            #10000;
        
        @(posedge s_awclk)
            s_awaddr  <= 32'h001003;
            s_awlen   <= 15  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;
        
        @(posedge s_awclk)
            s_awaddr  <= 32'h001007;
            s_awlen   <= 15  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;
        
        
        @(posedge s_awclk)
            s_awaddr  <= 32'h001008;
            s_awlen   <= 15  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;

        // 連続アクセス
        @(posedge s_awclk)
            s_awaddr  <= 32'h001008;
            s_awlen   <= 1  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            @(posedge s_awclk);
            for ( i = 0; i < 100; i = i+1 ) begin
                while ( !(s_awvalid && s_awready) )
                    @(posedge s_awclk);
                s_awaddr <= s_awaddr + 7;
                s_awlen  <= s_awlen + 1;
                @(posedge s_awclk);
            end
            s_awvalid <= 0;
            
        #100000;
            $finish();
    end
    
    

endmodule


`default_nettype wire


// end of file
