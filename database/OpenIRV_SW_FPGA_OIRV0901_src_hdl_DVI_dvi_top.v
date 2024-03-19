// Project F: Display Controller DVI Demo
// (C)2020 Will Green, Open source hardware released under the MIT License
// Learn more at https://projectf.io

/* 
 * ----------------------------------------------------------------------------
 * Original project repository: https://github.com/projf/display_controller
 * Modified for OpenIRV project by Vaagn Oganesyan <ovgn@protonmail.com>
 * ----------------------------------------------------------------------------
 */


`timescale 1ns / 1ns
`default_nettype none


module dvi_top #
(
    parameter   integer C_S_AXI_ADDR_WIDTH = 8
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire    s_axi_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXI_LITE, ASSOCIATED_RESET s_axi_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire    s_axi_aclk,
    
    (* X_INTERFACE_PARAMETER = "MAX_BURST_LENGTH 1, SUPPORTS_NARROW_BURST 0, READ_WRITE_MODE READ_WRITE, BUSER_WIDTH 0, RUSER_WIDTH 0, WUSER_WIDTH 0, ARUSER_WIDTH 0, AWUSER_WIDTH 0, ADDR_WIDTH 8, ID_WIDTH 0, PROTOCOL AXI4LITE, DATA_WIDTH 32, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR"  *)    input   wire    [C_S_AXI_ADDR_WIDTH - 1:0]  s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWVALID" *)    input   wire                                s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWREADY" *)    output  reg                                 s_axi_awready   = 1'b0,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WDATA"   *)    input   wire    [31:0]                      s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WSTRB"   *)    input   wire    [3:0]                       s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WVALID"  *)    input   wire                                s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE WREADY"  *)    output  reg                                 s_axi_wready    = 1'b0,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BRESP"   *)    output  reg     [1:0]                       s_axi_bresp     = 2'b00,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BVALID"  *)    output  reg                                 s_axi_bvalid    = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE BREADY"  *)    input   wire                                s_axi_bready,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR"  *)    input   wire    [C_S_AXI_ADDR_WIDTH - 1:0]  s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARVALID" *)    input   wire                                s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARREADY" *)    output  reg                                 s_axi_arready   = 1'b0,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA"   *)    output  reg     [31:0]                      s_axi_rdata     = {32{1'b0}},
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP"   *)    output  reg     [1:0]                       s_axi_rresp     = 2'b00,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID"  *)    output  reg                                 s_axi_rvalid    = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY"  *)    input   wire                                s_axi_rready,
    
    
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire    resetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXIS_CH0:S_AXIS_CH1, ASSOCIATED_RESET resetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire    pix_clk,
    
    input   wire    pix_clk_5x,
    output  wire    pll_pwr_down,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_CH0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CH0 TDATA"  *)      input   wire    [31:0]  s_axis_ch0_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CH0 TVALID" *)      input   wire            s_axis_ch0_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CH0 TREADY" *)      output  reg             s_axis_ch0_tready = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CH0 TUSER"  *)      input   wire            s_axis_ch0_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_CH1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CH1 TDATA"  *)      input   wire    [31:0]  s_axis_ch1_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CH1 TVALID" *)      input   wire            s_axis_ch1_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CH1 TREADY" *)      output  reg             s_axis_ch1_tready = 1'b0,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CH1 TUSER"  *)      input   wire            s_axis_ch1_tuser,
    
    output  reg         ch0_toggle_palette = 1'b0,
    output  reg         ch1_toggle_palette = 1'b0,
    
    output wire         hdmi_tx_clk_n,
    output wire         hdmi_tx_clk_p,
    output wire [2:0]   hdmi_tx_n,
    output wire [2:0]   hdmi_tx_p
);

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    localparam  AXI_RESP_OKAY   = 2'b00,
                AXI_RESP_EXOKAY = 2'b01,
                AXI_RESP_SLVERR = 2'b10,
                AXI_RESP_DECERR = 2'b11;
    
    integer i;
    
    reg     [C_S_AXI_ADDR_WIDTH - 1:0]  axi_awaddr = {C_S_AXI_ADDR_WIDTH{1'b0}};
    reg     [C_S_AXI_ADDR_WIDTH - 1:0]  axi_araddr = {C_S_AXI_ADDR_WIDTH{1'b0}};
    
    reg     [31:0]  ctrl_reg = {32{1'b0}};
    wire    [31:0]  stat_reg;
    
    reg     [31:0]  ch0_win0_sp = {32{1'b1}};       // 16-bit X and Y values for start point coordinates
    reg     [31:0]  ch0_win0_ep = {32{1'b1}};       // 16-bit X and Y values for end point coordinates
    reg     [31:0]  ch0_win1_sp = {32{1'b1}};       // 16-bit X and Y values for start point coordinates
    reg     [31:0]  ch0_win1_ep = {32{1'b1}};       // 16-bit X and Y values for end point coordinates
    
    reg     [31:0]  ch1_win0_sp = {32{1'b1}};       // 16-bit X and Y values for start point coordinates
    reg     [31:0]  ch1_win0_ep = {32{1'b1}};       // 16-bit X and Y values for end point coordinates
    reg     [31:0]  ch1_win1_sp = {32{1'b1}};       // 16-bit X and Y values for start point coordinates
    reg     [31:0]  ch1_win1_ep = {32{1'b1}};       // 16-bit X and Y values for end point coordinates
    
    reg     [31:0]  back_gnd_rgb = 32'h00808080;    // 24-bit background color RGB {8'hxx, Red, Green, Blue}
    
    
    always @(posedge s_axi_aclk) begin
        if (~s_axi_aresetn) begin
            s_axi_awready <= 1'b0;
            s_axi_wready  <= 1'b0;
            
            s_axi_bvalid  <= 1'b0;
            s_axi_bresp   <= AXI_RESP_OKAY;
            
            s_axi_arready <= 1'b0;
            s_axi_rvalid  <= 1'b0;
            s_axi_rresp   <= AXI_RESP_OKAY;
        end else begin
            /* Write address handshake */
            s_axi_awready <= (~s_axi_awready & s_axi_awvalid & s_axi_wvalid)? 1'b1 : 1'b0;
            
            /* Write address capture */
            axi_awaddr    <= (~s_axi_awready & s_axi_awvalid & s_axi_wvalid)? s_axi_awaddr : axi_awaddr;
            
            /* Write data handshake */
            s_axi_wready  <= (~s_axi_wready & s_axi_wvalid & s_axi_awvalid)? 1'b1 : 1'b0;
            
            /* Write data */
            if (s_axi_wready & s_axi_wvalid & s_axi_awready & s_axi_awvalid) begin
                for (i = 0; i < 4; i = i + 1) begin
                    case (axi_awaddr[7:2])
                        
                        6'd0  : ctrl_reg[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ctrl_reg[i*8 +: 8];
                     /* 6'd1  : read only register */
                        6'd2  : back_gnd_rgb[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : back_gnd_rgb[i*8 +: 8];
                        
                        6'd3  : ch0_win0_sp[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_win0_sp[i*8 +: 8];
                        6'd4  : ch0_win0_ep[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_win0_ep[i*8 +: 8];
                        6'd5  : ch0_win1_sp[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_win1_sp[i*8 +: 8];
                        6'd6  : ch0_win1_ep[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch0_win1_ep[i*8 +: 8];
                     
                        6'd7  : ch1_win0_sp[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_win0_sp[i*8 +: 8];
                        6'd8  : ch1_win0_ep[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_win0_ep[i*8 +: 8];
                        6'd9  : ch1_win1_sp[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_win1_sp[i*8 +: 8];
                        6'd10 : ch1_win1_ep[i*8 +: 8] <= s_axi_wstrb[i]? s_axi_wdata[i*8 +: 8] : ch1_win1_ep[i*8 +: 8];
                        
                        default: begin
                            /* TODO: do nothing? */
                        end
                    endcase
                end
            end
            
            /* Write response */
            if (~s_axi_bvalid & s_axi_awready & s_axi_awvalid & s_axi_wready & s_axi_wvalid) begin
                s_axi_bvalid <= 1'b1;
                s_axi_bresp  <= AXI_RESP_OKAY;
            end else begin
                if (s_axi_bvalid & s_axi_bready) begin
                    s_axi_bvalid <= 1'b0;
                end
            end
            
            /* Read address handshake */
            s_axi_arready <= (~s_axi_arready & s_axi_arvalid)? 1'b1 : 1'b0;
            
            /* Read address capture */
            axi_araddr    <= (~s_axi_arready & s_axi_arvalid)? s_axi_araddr : axi_araddr;
            
            /* Read data handshake and response */
            if (~s_axi_rvalid & s_axi_arready & s_axi_arvalid) begin
                s_axi_rvalid  <= 1'b1;
                s_axi_rresp   <= AXI_RESP_OKAY;
            end else begin
                if (s_axi_rvalid & s_axi_rready) begin
                    s_axi_rvalid  <= 1'b0;
                end
            end
            
            /* Read data */
            if (~s_axi_rvalid & s_axi_arready & s_axi_arvalid) begin
                case (axi_araddr[7:2])
                    6'd0  : s_axi_rdata <= ctrl_reg;
                    6'd1  : s_axi_rdata <= stat_reg;
                    6'd2  : s_axi_rdata <= back_gnd_rgb;
                    
                    6'd3  : s_axi_rdata <= ch0_win0_sp;
                    6'd4  : s_axi_rdata <= ch0_win0_ep;
                    6'd5  : s_axi_rdata <= ch0_win1_sp;
                    6'd6  : s_axi_rdata <= ch0_win1_ep;
                                           
                    6'd7  : s_axi_rdata <= ch1_win0_sp;
                    6'd8  : s_axi_rdata <= ch1_win0_ep;
                    6'd9  : s_axi_rdata <= ch1_win1_sp;
                    6'd10 : s_axi_rdata <= ch1_win1_ep;
                    
                    default: s_axi_rdata <= 32'hABADC0DE;
                endcase
            end
        end
    end
    
    
    assign          pll_pwr_down           = ~ctrl_reg[31];
    wire    [1:0]   resolution             = ctrl_reg[1:0];
    wire            ch0_palette_toggle_ena = ctrl_reg[2];
    wire            ch1_palette_toggle_ena = ctrl_reg[3];
    assign          stat_reg = 32'hDEADFACE;

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [1:0]   RES_640X480   = 2'd0,
                        RES_800X600   = 2'd1,
                        RES_1280X720  = 2'd2,
                        RES_1920X1080 = 2'd3;
    
    
    // Display Timings
    wire signed [15:0] sx;      // horizontal screen position (signed)
    wire signed [15:0] sy;      // vertical screen position (signed)
    wire hs;                    // horizontal sync
    wire vs;                    // vertical sync
    wire de;                    // display enable
    wire frame;                 // frame start
    
    
    // Display parameters
    reg [15:0]  h_res;
    reg [15:0]  v_res;
    reg [15:0]  h_fp;
    reg [15:0]  h_sync;
    reg [15:0]  h_bp;
    reg [15:0]  v_fp;
    reg [15:0]  v_sync;
    reg [15:0]  v_bp;
    reg         h_pol;
    reg         v_pol;
    
    
    always @(*) begin
        case (resolution)
            RES_640X480: begin
                h_res  = 16'd640;
                v_res  = 16'd480;
                h_fp   = 16'd16;
                h_sync = 16'd96;
                h_bp   = 16'd48;
                v_fp   = 16'd10;
                v_sync = 16'd2;
                v_bp   = 16'd33;
                h_pol  =  1'b1;
                v_pol  =  1'b1;
            end
            
            RES_800X600: begin
                h_res  = 16'd800;
                v_res  = 16'd600;
                h_fp   = 16'd40;
                h_sync = 16'd128;
                h_bp   = 16'd88;
                v_fp   = 16'd1;
                v_sync = 16'd4;
                v_bp   = 16'd23;
                h_pol  =  1'b1;
                v_pol  =  1'b1;
            end
            
            RES_1280X720: begin
                h_res  = 16'd1280;
                v_res  = 16'd720;
                h_fp   = 16'd110;
                h_sync = 16'd40;
                h_bp   = 16'd220;
                v_fp   = 16'd5;
                v_sync = 16'd5;
                v_bp   = 16'd20;
                h_pol  =  1'b1;
                v_pol  =  1'b1;
            end
            
            RES_1920X1080: begin
                h_res  = 16'd1920;
                v_res  = 16'd1080;
                h_fp   = 16'd88;
                h_sync = 16'd44;
                h_bp   = 16'd148;
                v_fp   = 16'd4;
                v_sync = 16'd5;
                v_bp   = 16'd36;
                h_pol  =  1'b1;
                v_pol  =  1'b1;
            end
        endcase
    end
    
    
    display_timings_variable display_timings_variable_inst
    (
        .h_res      ( h_res     ),
        .v_res      ( v_res     ),
        .h_fp       ( h_fp      ),
        .h_sync     ( h_sync    ),
        .h_bp       ( h_bp      ),
        .v_fp       ( v_fp      ),
        .v_sync     ( v_sync    ),
        .v_bp       ( v_bp      ),
        .h_pol      ( h_pol     ),
        .v_pol      ( v_pol     ),
        
        .i_pix_clk  ( pix_clk   ),
        .i_rst      ( ~resetn   ),
        .o_hs       ( hs        ),
        .o_vs       ( vs        ),
        .o_de       ( de        ),
        .o_frame    ( frame     ),
        .o_sx       ( sx        ),
        .o_sy       ( sy        )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire [7:0] red;
    wire [7:0] green;
    wire [7:0] blue;
    
    reg     ch0_frame_sync = 1'b0;
    reg     ch1_frame_sync = 1'b0;
    
    reg     ch0_exp_eof   = 1'b0;
    reg     ch1_exp_eof   = 1'b0;
    reg     ch0_exp_eof_1 = 1'b0;
    reg     ch1_exp_eof_1 = 1'b0;
    
    reg     ch0_win0_x_de = 1'b0;
    reg     ch0_win0_y_de = 1'b0;
    reg     ch0_win1_x_de = 1'b0;
    reg     ch0_win1_y_de = 1'b0;
    
    reg     ch1_win0_x_de = 1'b0;
    reg     ch1_win0_y_de = 1'b0;
    reg     ch1_win1_x_de = 1'b0;
    reg     ch1_win1_y_de = 1'b0;
    
    
    always @(posedge pix_clk) begin
        if (~resetn) begin
            s_axis_ch0_tready <= 1'b0;
            s_axis_ch1_tready <= 1'b0;
            
            ch0_frame_sync <= 1'b0;
            ch1_frame_sync <= 1'b0;
            
            ch0_exp_eof <= 1'b0;
            ch1_exp_eof <= 1'b0;
            ch0_exp_eof_1 <= 1'b0;
            ch1_exp_eof_1 <= 1'b0;
            
            ch0_win0_x_de <= 1'b0;
            ch0_win0_y_de <= 1'b0;
            ch0_win1_x_de <= 1'b0;
            ch0_win1_y_de <= 1'b0;
            
            ch1_win0_x_de <= 1'b0;
            ch1_win0_y_de <= 1'b0;
            ch1_win1_x_de <= 1'b0;
            ch1_win1_y_de <= 1'b0;
            
        end else begin
            
            ch0_win0_x_de <= (sx >= ch0_win0_sp[31:16]) && (sx <= ch0_win0_ep[31:16]);
            ch0_win0_y_de <= (sy >= ch0_win0_sp[15:0] ) && (sy <= ch0_win0_ep[15:0] );
            ch0_win1_x_de <= (sx >= ch0_win1_sp[31:16]) && (sx <= ch0_win1_ep[31:16]);
            ch0_win1_y_de <= (sy >= ch0_win1_sp[15:0] ) && (sy <= ch0_win1_ep[15:0] );
            
            ch0_exp_eof <= (sx == (ch0_win0_ep[31:16])) && (sy == (ch0_win0_ep[15:0]));
            ch1_exp_eof <= (sx == (ch1_win0_ep[31:16])) && (sy == (ch1_win0_ep[15:0]));
            
            ch0_exp_eof_1 <= ch0_exp_eof;
            ch1_exp_eof_1 <= ch1_exp_eof;
            
            ch1_win0_x_de <= (sx >= ch1_win0_sp[31:16]) && (sx <= ch1_win0_ep[31:16]);
            ch1_win0_y_de <= (sy >= ch1_win0_sp[15:0] ) && (sy <= ch1_win0_ep[15:0] );
            ch1_win1_x_de <= (sx >= ch1_win1_sp[31:16]) && (sx <= ch1_win1_ep[31:16]);
            ch1_win1_y_de <= (sy >= ch1_win1_sp[15:0] ) && (sy <= ch1_win1_ep[15:0] );
            
            
            if (ch0_frame_sync) begin
                if ((ch0_win0_x_de & ch0_win0_y_de) ||      // CH0 window 0
                    (ch0_win1_x_de & ch0_win1_y_de)) begin  // CH0 window 1
                    s_axis_ch0_tready <= 1'b1;
                end else begin
                    s_axis_ch0_tready <= 1'b0;
                end
                
                if (ch0_exp_eof_1) begin
                    ch0_frame_sync <= (s_axis_ch0_tvalid & s_axis_ch0_tready & s_axis_ch0_tuser)? 1'b1 : 1'b0;
                end
            
            end else begin
                if (s_axis_ch0_tvalid & s_axis_ch0_tready & s_axis_ch0_tuser) begin
                    s_axis_ch0_tready <= 1'b0;
                    ch0_frame_sync <= 1'b1;
                end else begin
                    s_axis_ch0_tready <= 1'b1;
                end
            end
            
            
            if (ch1_frame_sync) begin
                if ((ch1_win0_x_de & ch1_win0_y_de) ||      // CH1 window 0
                    (ch1_win1_x_de & ch1_win1_y_de)) begin  // CH1 window 1
                    s_axis_ch1_tready <= 1'b1;
                end else begin
                    s_axis_ch1_tready <= 1'b0;
                end
                
                if (ch1_exp_eof_1) begin
                    ch1_frame_sync <= (s_axis_ch1_tvalid & s_axis_ch1_tready & s_axis_ch1_tuser)? 1'b1 : 1'b0;
                end
            
            end else begin
                if (s_axis_ch1_tvalid & s_axis_ch1_tready & s_axis_ch1_tuser) begin
                    s_axis_ch1_tready <= 1'b0;
                    ch1_frame_sync <= 1'b1;
                end else begin
                    s_axis_ch1_tready <= 1'b1;
                end
            end
            
            
            // Palette selection
            if (frame) begin
                ch0_toggle_palette <= ch0_palette_toggle_ena;
                ch1_toggle_palette <= ch1_palette_toggle_ena;
            end
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    de_d;
    wire    vs_d;
    wire    hs_d;
    
    pipeline #
    (
        .PIPE_WIDTH ( 3 ),
        .PIPE_STAGES( 2 )
    )
    pipeline_inst
    (
        .clk        ( pix_clk            ), 
        .cen        ( 1'b1               ), 
        .srst       ( ~resetn            ), 
        .pipe_in    ( {de, vs, hs}       ), 
        .pipe_out   ( {de_d, vs_d, hs_d} )
    );
    
    
    assign red   = (s_axis_ch0_tready & ch0_frame_sync)? s_axis_ch0_tdata[23:16] :
                   (s_axis_ch1_tready & ch1_frame_sync)? s_axis_ch1_tdata[23:16] : back_gnd_rgb[23:16];
    
    assign green = (s_axis_ch0_tready & ch0_frame_sync)? s_axis_ch0_tdata[15:8] :
                   (s_axis_ch1_tready & ch1_frame_sync)? s_axis_ch1_tdata[15:8] : back_gnd_rgb[15:8];
    
    assign blue  = (s_axis_ch0_tready & ch0_frame_sync)? s_axis_ch0_tdata[7:0] :
                   (s_axis_ch1_tready & ch1_frame_sync)? s_axis_ch1_tdata[7:0] : back_gnd_rgb[7:0];
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire tmds_d0; 
    wire tmds_d1;
    wire tmds_d2;
    wire tmds_clk;
    
    
    dvi_generator dvi_out
    (
        .i_pix_clk          ( pix_clk      ),
        .i_pix_clk_5x       ( pix_clk_5x   ),
        .i_rst              ( ~resetn      ),
        .i_de               ( de_d         ),
        .i_data_ch0         ( blue         ),
        .i_data_ch1         ( green        ),
        .i_data_ch2         ( red          ),
        .i_ctrl_ch0         ( {vs_d, hs_d} ),
        .i_ctrl_ch1         ( 2'b00        ),
        .i_ctrl_ch2         ( 2'b00        ),
        .o_tmds_ch0_serial  ( tmds_d0      ),
        .o_tmds_ch1_serial  ( tmds_d1      ),
        .o_tmds_ch2_serial  ( tmds_d2      ),
        .o_tmds_chc_serial  ( tmds_clk     )
    );
    
    
    OBUFDS #(.IOSTANDARD("TMDS_33")) OBUFDS_tmds_d0  (.I(tmds_d0),  .O(hdmi_tx_p[0]),  .OB(hdmi_tx_n[0]));
    OBUFDS #(.IOSTANDARD("TMDS_33")) OBUFDS_tmds_d1  (.I(tmds_d1),  .O(hdmi_tx_p[1]),  .OB(hdmi_tx_n[1]));
    OBUFDS #(.IOSTANDARD("TMDS_33")) OBUFDS_tmds_d2  (.I(tmds_d2),  .O(hdmi_tx_p[2]),  .OB(hdmi_tx_n[2]));
    OBUFDS #(.IOSTANDARD("TMDS_33")) OBUFDS_tmds_clk (.I(tmds_clk), .O(hdmi_tx_clk_p), .OB(hdmi_tx_clk_n));

endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
