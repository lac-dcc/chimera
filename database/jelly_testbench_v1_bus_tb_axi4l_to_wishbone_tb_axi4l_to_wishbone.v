// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_axi4l_to_wishbone();
    localparam RATE  = 1000.0 / 100.0;
    
    initial begin
        $dumpfile("tb_axi4l_to_wishbone.vcd");
        $dumpvars(0, tb_axi4l_to_wishbone);
        
        #2000000;
            $finish;
    end
    
    reg     aresetn = 1'b0;
    initial #(RATE*100)    aresetn = 1'b1;
    
    reg     aclk = 1'b1;
    always #(RATE/2.0)     aclk = ~aclk;
    
    parameter   AXI4L_ADDR_WIDTH = 32;
    parameter   AXI4L_DATA_SIZE  = 2;                       // 0:8bit, 1:16bit, 2:32bit ...
    parameter   AXI4L_STRB_WIDTH = (1 << AXI4L_DATA_SIZE);
    parameter   AXI4L_DATA_WIDTH = (8 << AXI4L_DATA_SIZE);
    
    parameter   WB_ADR_WIDTH     = AXI4L_ADDR_WIDTH - AXI4L_DATA_SIZE;
    parameter   WB_SEL_WIDTH     = AXI4L_STRB_WIDTH;
    parameter   WB_DAT_WIDTH     = AXI4L_DATA_WIDTH;
    
    
    wire    [AXI4L_ADDR_WIDTH-1:0]   axi4l_awaddr;
    wire    [2:0]                    axi4l_awprot;
    wire                             axi4l_awvalid;
    wire                             axi4l_awready;
    wire    [AXI4L_STRB_WIDTH-1:0]   axi4l_wstrb;
    wire    [AXI4L_DATA_WIDTH-1:0]   axi4l_wdata;
    wire                             axi4l_wvalid;
    wire                             axi4l_wready;
    wire    [1:0]                    axi4l_bresp;
    wire                             axi4l_bvalid;
    wire                             axi4l_bready;
    wire    [AXI4L_ADDR_WIDTH-1:0]   axi4l_araddr;
    wire    [2:0]                    axi4l_arprot;
    wire                             axi4l_arvalid;
    wire                             axi4l_arready;
    wire    [AXI4L_DATA_WIDTH-1:0]   axi4l_rdata;
    wire    [1:0]                    axi4l_rresp;
    wire                             axi4l_rvalid;
    wire                             axi4l_rready;
    
    wire                             wb_rst_o;
    wire                             wb_clk_o;
    wire    [WB_ADR_WIDTH-1:0]       wb_adr_o;
    wire    [WB_DAT_WIDTH-1:0]       wb_dat_o;
    wire    [WB_DAT_WIDTH-1:0]       wb_dat_i;
    wire                             wb_we_o;
    wire    [WB_SEL_WIDTH-1:0]       wb_sel_o;
    wire                             wb_stb_o;
    wire                             wb_ack_i;
    
    jelly_axi4l_to_wishbone
            #(
                .AXI4L_ADDR_WIDTH       (AXI4L_ADDR_WIDTH),
                .AXI4L_DATA_SIZE        (AXI4L_DATA_SIZE)
            )
        i_axi4l_to_wishbone
            (
                .s_axi4l_aresetn        (aresetn),
                .s_axi4l_aclk           (aclk),
                .s_axi4l_awaddr         (axi4l_awaddr),
                .s_axi4l_awprot         (axi4l_awprot),
                .s_axi4l_awvalid        (axi4l_awvalid),
                .s_axi4l_awready        (axi4l_awready),
                .s_axi4l_wstrb          (axi4l_wstrb),
                .s_axi4l_wdata          (axi4l_wdata),
                .s_axi4l_wvalid         (axi4l_wvalid),
                .s_axi4l_wready         (axi4l_wready),
                .s_axi4l_bresp          (axi4l_bresp),
                .s_axi4l_bvalid         (axi4l_bvalid),
                .s_axi4l_bready         (axi4l_bready),
                .s_axi4l_araddr         (axi4l_araddr),
                .s_axi4l_arprot         (axi4l_arprot),
                .s_axi4l_arvalid        (axi4l_arvalid),
                .s_axi4l_arready        (axi4l_arready),
                .s_axi4l_rdata          (axi4l_rdata),
                .s_axi4l_rresp          (axi4l_rresp),
                .s_axi4l_rvalid         (axi4l_rvalid),
                .s_axi4l_rready         (axi4l_rready),
                
                .m_wb_rst_o             (wb_rst_o),
                .m_wb_clk_o             (wb_clk_o),
                .m_wb_adr_o             (wb_adr_o),
                .m_wb_dat_o             (wb_dat_o),
                .m_wb_dat_i             (wb_dat_i),
                .m_wb_we_o              (wb_we_o),
                .m_wb_sel_o             (wb_sel_o),
                .m_wb_stb_o             (wb_stb_o),
                .m_wb_ack_i             (wb_ack_i)
            );
    
    reg                             reg_tb_end = 0;
    
    reg     [AXI4L_ADDR_WIDTH-1:0]  reg_axi4l_awaddr;
    reg                             reg_axi4l_awvalid;
    reg     [AXI4L_STRB_WIDTH-1:0]  reg_axi4l_wstrb;
    reg     [AXI4L_DATA_WIDTH-1:0]  reg_axi4l_wdata;
    reg                             reg_axi4l_wvalid;
    reg                             reg_axi4l_bready;
    reg     [AXI4L_ADDR_WIDTH-1:0]  reg_axi4l_araddr;
    reg                             reg_axi4l_arvalid;
    reg                             reg_axi4l_rready;
    
    reg     [AXI4L_DATA_WIDTH-1:0]  exp_rdata;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            reg_axi4l_awaddr  <= 0;
            reg_axi4l_awvalid <= 0;
            reg_axi4l_wstrb   <= 0;
            reg_axi4l_wdata   <= 0;
            reg_axi4l_wvalid  <= 0;
            reg_axi4l_bready  <= 0;
            reg_axi4l_araddr  <= 0;
            reg_axi4l_arvalid <= 0;
            reg_axi4l_rready  <= 0;
            
            exp_rdata         <= 0;
        end
        else begin
            if ( !axi4l_awvalid || axi4l_awready ) begin
                reg_axi4l_awvalid <= ({$random()} % 4 == 0) && !reg_tb_end;
            end
            
            if ( !axi4l_wvalid || axi4l_wready ) begin
                reg_axi4l_wvalid <= ({$random()} % 4 == 0) && !reg_tb_end;
            end
            
            reg_axi4l_bready <= ({$random()} % 4 == 0) || reg_tb_end;
            
            if ( axi4l_awvalid && axi4l_awready ) begin
                reg_axi4l_awaddr <= reg_axi4l_awaddr + (1 << AXI4L_DATA_SIZE);
            end
            
            if ( axi4l_wvalid && axi4l_wready ) begin
                reg_axi4l_wstrb <= reg_axi4l_wstrb + 1;
                reg_axi4l_wdata <= reg_axi4l_wdata + 1;
            end
            
            
            
            if ( !axi4l_arvalid || axi4l_arready ) begin
                reg_axi4l_arvalid <= ({$random()} % 8 == 0) && !reg_tb_end;
            end
            
            reg_axi4l_rready <= ({$random()} % 4 == 0) || reg_tb_end;
            
            if ( axi4l_arvalid && axi4l_arready ) begin
                reg_axi4l_araddr <= reg_axi4l_araddr + (1 << AXI4L_DATA_SIZE);
            end
            
            if ( axi4l_rvalid && axi4l_rready ) begin
                if ( axi4l_rdata != exp_rdata ) begin
                    $display("read error!");
                    $stop();
                end
                exp_rdata <= exp_rdata + 1;
            end
        end
    end
    
    assign axi4l_awprot  = reg_axi4l_awvalid ? 3'b000           : 3'bxxx;
    assign axi4l_awaddr  = reg_axi4l_awvalid ? reg_axi4l_awaddr : {AXI4L_ADDR_WIDTH{1'bx}};
    assign axi4l_awvalid = reg_axi4l_awvalid;
    assign axi4l_wstrb   = reg_axi4l_wvalid  ? reg_axi4l_wstrb  : {AXI4L_STRB_WIDTH{1'bx}};
    assign axi4l_wdata   = reg_axi4l_wvalid  ? reg_axi4l_wdata  : {AXI4L_DATA_WIDTH{1'bx}};
    assign axi4l_wvalid  = reg_axi4l_wvalid;
    assign axi4l_bready  = reg_axi4l_bready;
    assign axi4l_arprot  = reg_axi4l_arvalid ? 3'b000           : 3'bxxx;
    assign axi4l_araddr  = reg_axi4l_arvalid ? reg_axi4l_araddr : {AXI4L_ADDR_WIDTH{1'bx}};
    assign axi4l_arvalid = reg_axi4l_arvalid;
    assign axi4l_rready  = reg_axi4l_rready;
    
    
    
    reg    [WB_DAT_WIDTH-1:0]       reg_wb_dat_i;
    reg                             reg_wb_ack_i;
    
    reg    [WB_ADR_WIDTH-1:0]       exp_wadr_o;
    reg    [WB_ADR_WIDTH-1:0]       exp_radr_o;
    reg    [WB_SEL_WIDTH-1:0]       exp_sel_o;
    reg    [WB_DAT_WIDTH-1:0]       exp_dat_o;
    
    always @(posedge wb_clk_o) begin
        if ( wb_rst_o ) begin
            reg_wb_dat_i <= 0;
            reg_wb_ack_i <= 0;
            
            exp_wadr_o   <= 0;
            exp_radr_o   <= 0;
            exp_sel_o    <= 0;
            exp_dat_o    <= 0;
        end
        else begin
            if ( wb_stb_o && wb_ack_i && ~wb_we_o ) begin
                reg_wb_dat_i <= reg_wb_dat_i + 1;
            end
            reg_wb_ack_i <= {$random()};
            
            
            if ( wb_stb_o && wb_ack_i && wb_we_o ) begin
                if ( wb_adr_o != exp_wadr_o ) begin
                    $display("wb_adr_o error!");
                end
                if ( wb_sel_o != exp_sel_o ) begin
                    $display("wb_sel_o error!");
                end
                if ( wb_dat_o != exp_dat_o ) begin
                    $display("exp_dat_o error!");
                end
                exp_wadr_o <= exp_wadr_o + 1;
                exp_sel_o  <= exp_sel_o  + 1;
                exp_dat_o  <= exp_dat_o  + 1;
            end
            if ( wb_stb_o && wb_ack_i && ~wb_we_o ) begin
                if ( wb_adr_o != exp_radr_o ) begin
                    $display("wb_adr_o error!");
                end
                exp_radr_o <= exp_radr_o + 1;
            end
        end
    end
    
    assign wb_dat_i = (wb_stb_o & ~wb_we_o & wb_ack_i) ? reg_wb_dat_i : {AXI4L_DATA_WIDTH{1'bx}};
    assign wb_ack_i = wb_stb_o & reg_wb_ack_i;
    
    
    // WISHBONE protocol check
    reg    [WB_ADR_WIDTH-1:0]       prev_wb_adr_o;
    reg    [WB_SEL_WIDTH-1:0]       prev_wb_sel_o;
    reg    [WB_DAT_WIDTH-1:0]       prev_wb_dat_o;
    reg                             prev_wb_we_o;
    reg                             prev_wb_stb_o;
    reg                             prev_wb_ack_i;
    always @(posedge wb_clk_o) begin
        if ( wb_rst_o ) begin
            prev_wb_adr_o <= {WB_ADR_WIDTH{1'bx}};
            prev_wb_sel_o <= {WB_SEL_WIDTH{1'bx}};
            prev_wb_dat_o <= {WB_DAT_WIDTH{1'bx}};
            prev_wb_we_o  <= 1'b0;
            prev_wb_stb_o <= 1'b0;
            prev_wb_ack_i <= 1'b0;
        end
        else begin
            prev_wb_adr_o <= wb_adr_o;
            prev_wb_sel_o <= wb_sel_o;
            prev_wb_dat_o <= wb_dat_o;
            prev_wb_we_o  <= wb_we_o; 
            prev_wb_stb_o <= wb_stb_o; 
            prev_wb_ack_i <= wb_ack_i; 
            
            if ( prev_wb_stb_o && !prev_wb_ack_i ) begin
                if ( !wb_stb_o ) begin
                    $display("error : wb_stb_o fall without ack");
                end
                if ( prev_wb_adr_o != wb_adr_o ) begin
                    $display("error : wb_adr_o change without ack");
                end
                if ( prev_wb_we_o != wb_we_o ) begin
                    $display("error : wb_we_o change without ack");
                end
                if ( prev_wb_we_o ) begin
                    if ( prev_wb_sel_o != wb_sel_o ) begin
                        $display("error : wb_sel_o change without ack");
                    end
                    if ( prev_wb_dat_o != wb_dat_o ) begin
                        $display("error : wb_sel_o change without ack");
                    end
                end
            end
        end
    end
    
    
    // access count
    integer count_aw   = 0;
    integer count_w    = 0;
    integer count_b    = 0;
    integer count_ar   = 0;
    integer count_r    = 0;
    integer count_wb_w = 0;
    integer count_wb_r = 0;
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            count_aw <= 0;
            count_w  <= 0;
            count_b  <= 0;
            count_ar <= 0;
            count_r  <= 0;
        end
        else begin
            if ( axi4l_awvalid && axi4l_awready )   count_aw <= count_aw + 1;
            if ( axi4l_wvalid  && axi4l_wready  )   count_w  <= count_w  + 1;
            if ( axi4l_bvalid  && axi4l_bready  )   count_b  <= count_b  + 1;
            if ( axi4l_arvalid && axi4l_arready )   count_ar <= count_ar + 1;
            if ( axi4l_rvalid  && axi4l_rready  )   count_r  <= count_r  + 1;
        end
    end
            
    always @(posedge wb_clk_o) begin
        if ( wb_rst_o ) begin
            count_wb_w <= 0;
            count_wb_r <= 0;
        end
        else begin
            if ( wb_stb_o && wb_ack_i && wb_we_o  ) count_wb_w <= count_wb_w + 1;
            if ( wb_stb_o && wb_ack_i && !wb_we_o ) count_wb_r <= count_wb_r + 1;
        end
    end
    
    
    
    initial begin
        #1000000;
            reg_tb_end = 1;
        #1000;
            if ( count_w != count_aw || count_b != count_aw || count_wb_w != count_aw ) begin
                $display("write error!");
            end
            if ( count_r != count_ar || count_wb_r != count_ar ) begin
                $display("write error!");
            end
            
            
            $finish;
    end

endmodule


`default_nettype wire


// end of file
