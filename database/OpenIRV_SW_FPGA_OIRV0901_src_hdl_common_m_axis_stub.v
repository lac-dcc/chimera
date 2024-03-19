/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: m_axis_stub.v
 *  Purpose:  AXI4-Stream master stub for debugging purposes.
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


module m_axis_stub
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M_RSTIF RST" *)
    input   wire    m_axis_aresetn,

    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_CLKIF, ASSOCIATED_BUSIF M_AXIS_STUB, ASSOCIATED_RESET m_axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M_CLKIF CLK" *)
    input   wire    m_axis_aclk,

    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_STUB, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_STUB TDATA"  *) output  wire    [31:0]  m_axis_stub_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_STUB TVALID" *) output  wire            m_axis_stub_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_STUB TREADY" *) input   wire            m_axis_stub_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_STUB TUSER"  *) output  wire            m_axis_stub_tlast
);
    
    assign m_axis_stub_tdata  = {32{1'b0}};
    assign m_axis_stub_tvalid = 1'b0;
    assign m_axis_stub_tlast  = 1'b0;

endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
