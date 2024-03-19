
`timescale 1ns / 1ps
`default_nettype none


module tb_mipi_csi2_rx();
    localparam RATE200 = 1000.0/200.0;
    localparam RATE250 = 1000.0/250.0;
    localparam RATE_HS = 1000.0/(912.0 / 8.0);
    
    
    initial begin
        $dumpfile("tb_mipi_csi2_rx.vcd");
        $dumpvars(0, tb_mipi_csi2_rx);
    
//  #2000000
//      $finish;
    end
    
    
    reg     reset = 1'b1;
    always #(RATE200*100)   reset = 1'b0;
    
    reg     clk200 = 1'b1;
    always #(RATE200/2.0)   clk200 = ~clk200;
    
    reg     clk250 = 1'b1;
    always #(RATE250/2.0)   clk250 = ~clk250;
    
    reg     hs_clk = 1'b1;
    always #(RATE_HS/2.0)   hs_clk = ~hs_clk;
    
    
    parameter LANES      = 2;
    parameter DATA_WIDTH = 10;
    
    wire                        rxreseths   = reset;
    wire                        rxbyteclkhs = hs_clk;
    wire    [LANES*8-1:0]       rxdatahs;
    wire    [LANES-1:0]         rxvalidhs;
    wire    [LANES-1:0]         rxactivehs;
    wire    [LANES-1:0]         rxsynchs;
    
    reg     [LANES*8-1:0]       reg_rxdatahs;
    reg     [LANES-1:0]         reg_rxvalidhs;
    reg     [LANES-1:0]         reg_rxactivehs;
    reg     [LANES-1:0]         reg_rxsynchs;
    always @(posedge rxbyteclkhs) begin
        reg_rxdatahs   <= rxdatahs;
        reg_rxvalidhs  <= rxvalidhs;
        reg_rxactivehs <= rxactivehs;
        reg_rxsynchs   <= rxsynchs;
    end
    
    
    wire                        aresetn = ~reset;
    wire                        aclk    = clk250;
    
    wire                        m_axi4s_aresetn = ~reset;
    wire                        m_axi4s_aclk    = clk200;
    wire    [0:0]               m_axi4s_tuser;
    wire                        m_axi4s_tlast;
    wire    [DATA_WIDTH-1:0]    m_axi4s_tdata;
    wire    [0:0]               m_axi4s_tvalid;
    wire                        m_axi4s_tready = 1;
    
    jelly_mipi_csi2_rx
            #(
                .LANES              (LANES),
                .DATA_WIDTH         (DATA_WIDTH)
            )
        i_mipi_csi2_rx
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .rxreseths          (rxreseths),
                .rxbyteclkhs        (rxbyteclkhs),
                .rxdatahs           ({rxdatahs[15:8], reg_rxdatahs[7:0]}),
                .rxvalidhs          ({rxvalidhs[1],   reg_rxvalidhs[0]}),
                .rxactivehs         ({rxactivehs[1],  reg_rxactivehs[0]}),
                .rxsynchs           ({rxsynchs[1],    reg_rxsynchs[0]}),
                
                .m_axi4s_aresetn    (m_axi4s_aresetn),
                .m_axi4s_aclk       (m_axi4s_aclk),
                .m_axi4s_tuser      (m_axi4s_tuser),
                .m_axi4s_tlast      (m_axi4s_tlast),
                .m_axi4s_tdata      (m_axi4s_tdata),
                .m_axi4s_tvalid     (m_axi4s_tvalid),
                .m_axi4s_tready     (m_axi4s_tready)
            );
    
    
    reg     [31:0]      rx_data     [0:16*1024*1024-1];
    
    initial begin
        $readmemh("data_ila_crc_err.hex", rx_data);
    end
    
    integer     data_count = 0;
    always @(posedge hs_clk) begin
        if ( reset ) begin
            data_count <= 0;
        end
        else begin
            data_count <= data_count + 1;
        end
    end
    
    wire            dl0_errsotsynchs;
    wire            dl0_errsoths;
    wire            dl0_rxsynchs;
    wire            dl0_rxactivehs;
    wire            dl0_rxvalidhs;
    wire    [7:0]   dl0_rxdatahs;
    
    wire            dl1_errsotsynchs;
    wire            dl1_errsoths;
    wire            dl1_rxsynchs;
    wire            dl1_rxactivehs;
    wire            dl1_rxvalidhs;
    wire    [7:0]   dl1_rxdatahs;
    
    assign {
                dl0_errsotsynchs,
                dl0_errsoths,
                dl0_rxsynchs,
                dl0_rxactivehs,
                dl0_rxvalidhs,
                dl0_rxdatahs
            } = rx_data[data_count+0][15:0];
    
    assign {
                dl1_errsotsynchs,
                dl1_errsoths,
                dl1_rxsynchs,
                dl1_rxactivehs,
                dl1_rxvalidhs,
                dl1_rxdatahs
            } = rx_data[data_count+0][31:16];
    
    assign rxdatahs   = {dl1_rxdatahs,   dl0_rxdatahs};
    assign rxvalidhs  = {dl1_rxvalidhs,  dl0_rxvalidhs};
    assign rxactivehs = {dl1_rxactivehs, dl0_rxactivehs};
    assign rxsynchs   = {dl1_rxsynchs,   dl0_rxsynchs};
    
    
    
    integer     fp_img;
    initial begin
         fp_img = $fopen("out_img.pgm", "w");
         $fdisplay(fp_img, "P2");
         $fdisplay(fp_img, "%d %d", 32'h0802*8/10, 1024);
         $fdisplay(fp_img, "1023");
    end
    
    always @(posedge m_axi4s_aclk) begin
        if ( m_axi4s_aresetn && m_axi4s_tvalid && m_axi4s_tready ) begin
             $fdisplay(fp_img, "%d", m_axi4s_tdata);
        end
    end
    
    
    
    
endmodule


`default_nettype wire


// end of file
