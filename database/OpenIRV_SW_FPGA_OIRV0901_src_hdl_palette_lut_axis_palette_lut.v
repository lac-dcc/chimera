/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_palette_lut.v
 *  Purpose:  AXI4-Stream wrapper for palette LUT RAM.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module axis_palette_lut
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_RSTIF RST" *)
    input   wire            axis_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_CLKIF, ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_CLKIF CLK" *)
    input   wire            axis_aclk,
    
    input   wire            toggle_palette,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *)  input   wire    [31:0]  s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)  input   wire            s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)  output  wire            s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)  input   wire    [3:0]   s_axis_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA"  *)  output  wire    [31:0]  m_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)  output  wire            m_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)  input   wire            m_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER"  *)  output  wire            m_axis_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LUT_RAM, MEM_SIZE 4096, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM CLK"   *)  input   wire            lut_ram_clk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM EN "   *)  input   wire            lut_ram_ena,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM RST"   *)  input   wire            lut_ram_rst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM WE"    *)  input   wire    [3:0]   lut_ram_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM ADDR"  *)  input   wire    [31:0]  lut_ram_addr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM DIN"   *)  input   wire    [31:0]  lut_ram_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM DOUT"  *)  output  wire    [31:0]  lut_ram_rdata
);
    
    localparam  integer PIPE_DATA_IN_WIDTH  = 8;
    localparam  integer PIPE_DATA_OUT_WIDTH = 32;
    localparam  integer PIPE_QUAL_WIDTH     = 1;
    localparam  integer PIPE_STAGES         = 2;

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire            m_axis_wcd_tvalid;
    wire            m_axis_wcd_tready;
    wire    [7:0]   m_axis_wcd_tdata;
    wire            m_axis_wcd_tuser;
    
    
    AXIS_WC_4_TO_1 AXIS_WC_4_TO_1_inst
    (
        .aclk           ( axis_aclk         ),      // input wire aclk
        .aresetn        ( axis_aresetn      ),      // input wire aresetn
        
        .s_axis_tdata   ( s_axis_tdata      ),      // input wire [31 : 0] s_axis_tdata
        .s_axis_tvalid  ( s_axis_tvalid     ),      // input wire s_axis_tvalid
        .s_axis_tready  ( s_axis_tready     ),      // output wire s_axis_tready
        .s_axis_tlast   ( 1'b0              ),      // input wire s_axis_tlast
        .s_axis_tuser   ( s_axis_tuser      ),      // input wire [3 : 0] s_axis_tuser
        
        .m_axis_tdata   ( m_axis_wcd_tdata  ),      // output wire [7 : 0] m_axis_tdata
        .m_axis_tvalid  ( m_axis_wcd_tvalid ),      // output wire m_axis_tvalid
        .m_axis_tready  ( m_axis_wcd_tready ),      // input wire m_axis_tready
        .m_axis_tlast   ( /*-----NC-----*/  ),      // output wire m_axis_tlast
        .m_axis_tuser   ( m_axis_wcd_tuser  )       // output wire [0 : 0] m_axis_tuser
    );

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    reg     palette_sub_addr = 1'b0;
    reg     toggle_palette_1 = 1'b0;
    
    
    always @(posedge axis_aclk) begin
        if (~axis_aresetn) begin
            palette_sub_addr <= 1'b0;
            toggle_palette_1 <= 1'b0;
        end else begin
            toggle_palette_1 <= toggle_palette;
            
            if (m_axis_wcd_tvalid & m_axis_wcd_tready & m_axis_wcd_tuser) begin
                if (toggle_palette) begin
                    palette_sub_addr <= (toggle_palette_1)? ~palette_sub_addr : 1'b0;
                end else begin
                    palette_sub_addr <= 1'b0;
                end
            end
        end
    end

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire                                pipe_cen;
    wire    [PIPE_DATA_IN_WIDTH - 1:0]  pipe_in_data;
    wire    [PIPE_DATA_OUT_WIDTH - 1:0] pipe_out_data;
    
    
    axis_pipeliner #
    (
        .PIPE_DATA_IN_WIDTH ( PIPE_DATA_IN_WIDTH  ),
        .PIPE_DATA_OUT_WIDTH( PIPE_DATA_OUT_WIDTH ),
        .PIPE_QUAL_WIDTH    ( PIPE_QUAL_WIDTH     ),
        .PIPE_STAGES        ( PIPE_STAGES         )
    )
    axis_pipeliner_inst
    (
        .axis_aclk      ( axis_aclk         ),
        .axis_aresetn   ( axis_aresetn      ),
        
        .s_axis_tdata   ( m_axis_wcd_tdata  ),
        .s_axis_tuser   ( m_axis_wcd_tuser  ),
        .s_axis_tvalid  ( m_axis_wcd_tvalid ),
        .s_axis_tready  ( m_axis_wcd_tready ),
        .s_axis_tlast   ( 1'b0              ),
        
        .m_axis_tdata   ( m_axis_tdata      ),
        .m_axis_tuser   ( m_axis_tuser      ),
        .m_axis_tvalid  ( m_axis_tvalid     ),
        .m_axis_tready  ( m_axis_tready     ),
        .m_axis_tlast   ( /*-----NC-----*/  ),
        
        .pipe_cen       ( pipe_cen          ),
        .pipe_in_data   ( pipe_in_data      ),
        .pipe_out_data  ( pipe_out_data     )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire            ram_clkb;
    wire            ram_enb;
    wire    [3:0]   ram_web;
    wire    [9:0]   ram_addrb;
    wire    [31:0]  ram_dinb;
    wire    [31:0]  ram_doutb;
    
    
    PALETTE_LUT_RAM PALETTE_LUT_RAM_inst 
    (
        .clka   ( lut_ram_clk        ),     // input wire clka
        .ena    ( lut_ram_ena        ),     // input wire ena
        .wea    ( lut_ram_we         ),     // input wire [3 : 0] wea
        .addra  ( lut_ram_addr[11:2] ),     // input wire [9 : 0] addra
        .dina   ( lut_ram_wdata      ),     // input wire [31 : 0] dina
        .douta  ( lut_ram_rdata      ),     // output wire [31 : 0] douta
        
        .clkb   ( ram_clkb           ),     // input wire clkb
        .enb    ( ram_enb            ),     // input wire enb
        .web    ( ram_web            ),     // input wire [3 : 0] web
        .addrb  ( ram_addrb          ),     // input wire [9 : 0] addrb
        .dinb   ( ram_dinb           ),     // input wire [31 : 0] dinb
        .doutb  ( ram_doutb          )      // output wire [31 : 0] doutb
    );
    
    
    assign ram_clkb      = axis_aclk;
    assign ram_enb       = pipe_cen;
    assign ram_web       = 4'b0000;
    assign ram_addrb     = {1'b0, palette_sub_addr, pipe_in_data};
    assign ram_dinb      = {32{1'b0}};
    assign pipe_out_data = ram_doutb;
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
