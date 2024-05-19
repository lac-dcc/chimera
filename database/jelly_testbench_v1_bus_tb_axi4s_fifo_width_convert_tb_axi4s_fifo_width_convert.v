// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_axi4s_fifo_width_convert();
    localparam RATE0  = 1000.0/200.0;
    localparam RATE1  = 1000.0/130.0;
    localparam RATE2  = 1000.0/180.0;
    
    
    initial begin
        $dumpfile("tb_axi4s_fifo_width_convert.vcd");
        $dumpvars(0, tb_axi4s_fifo_width_convert);
    
    #100000
        $finish;
    end
    
    // バス幅を広げて戻すテスト
    
    reg     aresetn0 = 1'b0;
    initial #(RATE0*100)    aresetn0 = 1'b1;
    
    reg     aclk0 = 1'b1;
    always #(RATE0/2.0)     aclk0 = ~aclk0;
    
    reg     aresetn1 = 1'b0;
    initial #(RATE1*100)     aresetn1 = 1'b1;
    
    reg     aclk1 = 1'b1;
    always #(RATE1/2.0)      aclk1 = ~aclk1;
    
    reg     aresetn2 = 1'b0;
    initial #(RATE2*100)     aresetn2 = 1'b1;
    
    reg     aclk2 = 1'b1;
    always #(RATE2/2.0)      aclk2 = ~aclk2;
    
    
    parameter RAND_BUSY    = 0;
    
    parameter BYTE_WIDTH   = 8;
    
    parameter TDATA_WIDTH0 = 24;
    parameter TDATA_WIDTH1 = 64;
    parameter TUSER_WIDTH0 = 6;
    
    parameter TSTRB_WIDTH0 = TDATA_WIDTH0 / 8;
    parameter TSTRB_WIDTH1 = TDATA_WIDTH1 / 8;
    parameter TKEEP_WIDTH0 = TDATA_WIDTH0 / 8;
    parameter TKEEP_WIDTH1 = TDATA_WIDTH1 / 8;
    parameter TUSER_WIDTH1 = TUSER_WIDTH0 * TDATA_WIDTH1 / TDATA_WIDTH0;
    
    parameter ALIGN_WIDTH  = TDATA_WIDTH1 / BYTE_WIDTH <=   2 ? 1 :
                             TDATA_WIDTH1 / BYTE_WIDTH <=   4 ? 2 :
                             TDATA_WIDTH1 / BYTE_WIDTH <=   8 ? 3 :
                             TDATA_WIDTH1 / BYTE_WIDTH <=  16 ? 4 :
                             TDATA_WIDTH1 / BYTE_WIDTH <=  32 ? 5 :
                             TDATA_WIDTH1 / BYTE_WIDTH <=  64 ? 6 :
                             TDATA_WIDTH1 / BYTE_WIDTH <= 128 ? 7 :
                             TDATA_WIDTH1 / BYTE_WIDTH <= 256 ? 8 :
                             TDATA_WIDTH1 / BYTE_WIDTH <= 512 ? 9 : 10;

    
    
    reg                         endian = 1;
    
    reg     [ALIGN_WIDTH-1:0]   align = 1;
    
    reg     [TDATA_WIDTH0-1:0]  axi4s_src_tdata;
    reg     [TSTRB_WIDTH0-1:0]  axi4s_src_tstrb;
    reg     [TKEEP_WIDTH0-1:0]  axi4s_src_tkeep;
    reg                         axi4s_src_tfirst = 0;
    wire                        axi4s_src_tlast  = (axi4s_src_tuser[2:0] == 3'b111);
    reg     [TUSER_WIDTH0-1:0]  axi4s_src_tuser  = 0;
    reg                         axi4s_src_tvalid;
    wire                        axi4s_src_tready;
    
    wire    [TDATA_WIDTH1-1:0]  axi4s_cnv_tdata;
    wire    [TSTRB_WIDTH1-1:0]  axi4s_cnv_tstrb;
    wire    [TKEEP_WIDTH1-1:0]  axi4s_cnv_tkeep;
    wire                        axi4s_cnv_tfirst;
    wire                        axi4s_cnv_tlast;
    wire    [TUSER_WIDTH1-1:0]  axi4s_cnv_tuser;
    wire                        axi4s_cnv_tvalid;
    wire                        axi4s_cnv_tready;
    
    wire    [TDATA_WIDTH0-1:0]  axi4s_dst_tdata;
    wire    [TSTRB_WIDTH0-1:0]  axi4s_dst_tstrb;
    wire    [TKEEP_WIDTH0-1:0]  axi4s_dst_tkeep;
    wire                        axi4s_dst_tfirst;
    wire                        axi4s_dst_tlast;
    wire    [TUSER_WIDTH0-1:0]  axi4s_dst_tuser;
    wire                        axi4s_dst_tvalid;
    reg                         axi4s_dst_tready;
    
    
    jelly_axi4s_fifo_width_convert
            #(
                .ASYNC              (1),
                
                .HAS_STRB           (1),
                .HAS_KEEP           (1),
                .HAS_FIRST          (0),
                .HAS_LAST           (1),
                .HAS_ALIGN_S        (0),
                .HAS_ALIGN_M        (1),
                
                .S_TDATA_WIDTH      (TDATA_WIDTH0),
                .M_TDATA_WIDTH      (TDATA_WIDTH1),
                .S_TUSER_WIDTH      (TUSER_WIDTH0),
                .FIRST_FORCE_LAST   (0),
                .FIRST_OVERWRITE    (0)
            )
        i_axi4s_fifo_width_convert_src
            (
                .endian             (endian),
                
                .s_aresetn          (aresetn0),
                .s_aclk             (aclk0),
                
                .s_align_s          (0),
                .s_align_m          (align),
                .s_axi4s_tdata      (axi4s_src_tdata),
                .s_axi4s_tstrb      (axi4s_src_tstrb),
                .s_axi4s_tkeep      (axi4s_src_tkeep),
                .s_axi4s_tfirst     (axi4s_src_tfirst),
                .s_axi4s_tlast      (axi4s_src_tlast),
                .s_axi4s_tuser      (axi4s_src_tuser),
                .s_axi4s_tvalid     (axi4s_src_tvalid),
                .s_axi4s_tready     (axi4s_src_tready),
                .s_fifo_free_count  (),
                .s_fifo_wr_signal   (),
                
                .m_aresetn          (aresetn1),
                .m_aclk             (aclk1),
                .m_axi4s_tdata      (axi4s_cnv_tdata),
                .m_axi4s_tstrb      (axi4s_cnv_tstrb),
                .m_axi4s_tkeep      (axi4s_cnv_tkeep),
                .m_axi4s_tfirst     (axi4s_cnv_tfirst),
                .m_axi4s_tlast      (axi4s_cnv_tlast),
                .m_axi4s_tuser      (axi4s_cnv_tuser),
                .m_axi4s_tvalid     (axi4s_cnv_tvalid),
                .m_axi4s_tready     (axi4s_cnv_tready),
                .m_fifo_data_count  (),
                .m_fifo_rd_signal   ()
            );
    
    jelly_axi4s_fifo_width_convert
            #(
                .ASYNC              (1),
                
                .HAS_STRB           (1),
                .HAS_KEEP           (1),
                .HAS_FIRST          (0),
                .HAS_LAST           (1),
                .HAS_ALIGN_S        (1),
                .HAS_ALIGN_M        (0),
                
                .S_TDATA_WIDTH      (TDATA_WIDTH1),
                .M_TDATA_WIDTH      (TDATA_WIDTH0),
                .S_TUSER_WIDTH      (TUSER_WIDTH1),
                .FIRST_FORCE_LAST   (0),
                .FIRST_OVERWRITE    (0)
            )
        i_axi4s_fifo_width_convert_dst
            (
                .endian             (endian),
                
                .s_aresetn          (aresetn1),
                .s_aclk             (aclk1),
                
                .s_align_s          (align),
                .s_align_m          (0),
                .s_axi4s_tdata      (axi4s_cnv_tdata),
                .s_axi4s_tstrb      (axi4s_cnv_tstrb),
                .s_axi4s_tkeep      (axi4s_cnv_tkeep),
                .s_axi4s_tfirst     (axi4s_cnv_tfirst),
                .s_axi4s_tlast      (axi4s_cnv_tlast),
                .s_axi4s_tuser      (axi4s_cnv_tuser),
                .s_axi4s_tvalid     (axi4s_cnv_tvalid),
                .s_axi4s_tready     (axi4s_cnv_tready),
                .s_fifo_free_count  (),
                .s_fifo_wr_signal   (),
                
                .m_aresetn          (aresetn2),
                .m_aclk             (aclk2),
                .m_axi4s_tdata      (axi4s_dst_tdata),
                .m_axi4s_tstrb      (axi4s_dst_tstrb),
                .m_axi4s_tkeep      (axi4s_dst_tkeep),
                .m_axi4s_tfirst     (axi4s_dst_tfirst),
                .m_axi4s_tlast      (axi4s_dst_tlast),
                .m_axi4s_tuser      (axi4s_dst_tuser),
                .m_axi4s_tvalid     (axi4s_dst_tvalid),
                .m_axi4s_tready     (axi4s_dst_tready),
                .m_fifo_data_count  (),
                .m_fifo_rd_signal   ()
            );
    
    
    
    always @(posedge aclk0) begin
        if ( ~aresetn0 ) begin
            axi4s_src_tdata  <= 0;
            axi4s_src_tstrb  <= {TSTRB_WIDTH0{1'b1}};
            axi4s_src_tkeep  <= {TKEEP_WIDTH0{1'b1}};
            axi4s_src_tuser  <= 0;
            axi4s_src_tvalid <= 0;
        end
        else begin
            if ( axi4s_src_tvalid && axi4s_src_tready ) begin
                axi4s_src_tdata <= axi4s_src_tdata + 1;
                axi4s_src_tuser <= axi4s_src_tuser + 1;
            end
            
            if ( !axi4s_src_tvalid || axi4s_src_tready ) begin
                axi4s_src_tvalid <= RAND_BUSY ? {$random()} : 1'b1;
            end
        end
    end
    
    
    always @(posedge aclk2) begin
        axi4s_dst_tready <= RAND_BUSY ? {$random()} : 1'b1;
    end
    
    
    
    integer fp;
    initial begin
        fp = $fopen("out_dst.txt", "w");
    end
    
    always @(posedge aclk2) begin
        if ( ~aresetn2 ) begin
        end
        else begin
            if ( axi4s_dst_tvalid && axi4s_dst_tready ) begin
                $fdisplay(fp, "%h %h %h %h %b %b", axi4s_dst_tdata, axi4s_dst_tuser, axi4s_dst_tstrb, axi4s_dst_tkeep, axi4s_dst_tfirst, axi4s_dst_tlast);
            end
        end
    end
    
    
    
endmodule


`default_nettype wire


// end of file
