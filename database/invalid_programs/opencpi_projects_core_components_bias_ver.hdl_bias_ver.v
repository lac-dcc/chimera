/*
 * This file is protected by Copyright. Please refer to the COPYRIGHT file
 * distributed with this source distribution.
 *
 * This file is part of OpenCPI <http://www.opencpi.org>
 *
 * OpenCPI is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * OpenCPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// biasWorker.v - hand coded verilog of biasWorker

// 2009-07-11 ssiegel creation
// 2010-01-19 ssiegel VHDL manually converted to Verilog
// 2010-03-01 ssiegel Added Peer-Peer WSI Resets
// 2010-06-26 jkulp   Made compliant with ocpi component workflow

`include "bias_ver-impl.vh"
// All outputs are registered except those that are aliased (that have WIP semantics)
// Someday we might be more clever and allow combi outputs.
  reg [31:0] ctl_SData;
  reg [0:0]  ctl_SThreadBusy;
  reg [1:0]  ctl_SResp;
  reg [31:0] out_MData; // not part of request, so not automatically declared.
  reg [0:0]  out_MDataInfo; // not part of request, so not automatically declared.
  reg [31:0] biasValue;
  reg [1:0]  ctl_ctlSt;
  // register all outputs except MCmd
  reg [ 11:0] out_MBurstLength;
  reg [  3:0] out_MByteEn;
  reg out_MBurstPrecise;
  reg out_MReqLast;
  reg [7:0] out_Opcode_i;
  reg out_Ready; // output registers are full
  reg out_Busy;  // output was busy

  // When this worker is WCI reset, propagate reset out to WSI partners...
  wire out_MReset_n = ctl_MReset_n;
  wire in_SReset_n = ctl_MReset_n;
  //Pass the SThreadBusy upstream without pipelining...
  assign in_SThreadBusy[0] = out_SThreadBusy[0] || (ctl_ctlSt != 2'h2);
  assign ctl_SFlag[2]   = 0; // We are never finished
  assign out_Opcode     = out_Opcode_i;
  assign out_MCmd = out_Ready && ! out_Busy ? OCPI_OCP_MCMD_WRITE : OCPI_OCP_MCMD_IDLE;
  always@(posedge ctl_Clk)
  begin
    // Registered Operations that don't care about reset...
    if (ctl_ctlSt == 2'h2) begin
      if (in_MCmd == OCPI_OCP_MCMD_WRITE) begin
	out_MData <= in_MData + biasValue;    // add the bias
	out_MDataInfo  <= in_MDataInfo;
	out_MBurstPrecise  <= in_MBurstPrecise;
	out_MBurstLength  <= in_MBurstLength;
	out_MByteEn  <= in_MByteEn;
	out_MReqLast  <= in_MReqLast;
	out_Opcode_i <= in_Opcode;
	out_Ready <= 1'b1;
      end else if (!out_Busy) begin
	out_Ready <= 1'b0;
      end
      out_Busy  <= out_SThreadBusy;
    end else begin                         // Or block the WSI pipeline cleanly...
      out_Ready <= 1'b0;
    end

    // Implement minimal WCI attach logic...
    ctl_SThreadBusy   <= 1'b0;
    ctl_SResp         <= OCPI_OCP_SRESP_NULL;

    if (ctl_MReset_n==1'b0) begin                 // Reset Conditions...
      ctl_ctlSt       <= 2'h0;
      ctl_SResp       <= OCPI_OCP_SRESP_NULL;
      ctl_SThreadBusy <= 1'b1;
      ctl_Attention   <= 1'b0;
      biasValue       <= 32'h0000_0000;
      out_Ready       <= 1'b0;
      out_Busy        <= 1'b0;
    end else begin                         // When not Reset...
      // WCI Configuration Property Writes...
      if (ctl_IsCfgWrite) begin
        ctl_SResp <= OCPI_OCP_SRESP_DVA;
	if (ctl_MAddr == 0) begin
           biasValue <= ctl_MData; // Write the biasValue Property
	end
      end
      // WCI Configuration Property Reads...
      if (ctl_IsCfgRead) begin
        ctl_SResp <= OCPI_OCP_SRESP_DVA;
	if (ctl_MAddr == 0) begin
           ctl_SData <= biasValue;  // Read the biasValue Property
	 end
      end
      //WCI Control Operations...
      if (ctl_IsControlOp) begin
        case (ctl_ControlOp)
          OCPI_WCI_INITIALIZE: ctl_ctlSt <= 2'h1;  // when wciCtlOp_Initialize  => ctl_ctlSt  <= wciCtlSt_Initialized;
          OCPI_WCI_START:      ctl_ctlSt <= 2'h2;  // when wciCtlOp_Start       => ctl_ctlSt  <= wciCtlSt_Operating;
          OCPI_WCI_STOP:       ctl_ctlSt <= 2'h3;  // when wciCtlOp_Stop        => ctl_ctlSt  <= wciCtlSt_Suspended;
          OCPI_WCI_RELEASE:    ctl_ctlSt <= 2'h0;  // when wciCtlOp_Release     => ctl_ctlSt  <= wciCtlSt_Exists;
          default:;
        endcase
        ctl_SData <= 32'hC0DE_4201;  // FIXME remove this when we are sure OCCP does the right thing
        ctl_SResp <= OCPI_OCP_SRESP_DVA;
      end  // end of control op clause
    end  // end of not reset clause
  end  // end of always block
endmodule

// Type definitions from VHDL...
//subtype  wciCtlOpT is std_logic_vector(2 downto 0);
  //constant wciCtlOp_Initialize  : wciCtlOpT  := "000";
  //constant wciCtlOp_Start       : wciCtlOpT  := "001";
  //constant wciCtlOp_Stop        : wciCtlOpT  := "010";
  //constant wciCtlOp_Release     : wciCtlOpT  := "011";
  //constant wciCtlOp_Test        : wciCtlOpT  := "100";
  //constant wciCtlOp_BeforeQuery : wciCtlOpT  := "101";
  //constant wciCtlOp_AfterConfig : wciCtlOpT  := "110";
  //constant wciCtlOp_Rsvd7       : wciCtlOpT  := "111";
//subtype  wciCtlStT is std_logic_vector(2 downto 0);
  //constant wciCtlSt_Exists      : wciCtlStT  := "000";
  //constant wciCtlSt_Initialized : wciCtlStT  := "001";
  //constant wciCtlSt_Operating   : wciCtlStT  := "010";
  //constant wciCtlSt_Suspended   : wciCtlStT  := "011";
  //constant wciCtlSt_Unusable    : wciCtlStT  := "100";
  //constant wciCtlSt_Rsvd5       : wciCtlStT  := "101";
  //constant wciCtlSt_Rsvd6       : wciCtlStT  := "110";
  //constant wciCtlSt_Rsvd7       : wciCtlStT  := "111";
//subtype  wciRespT is std_logic_vector(31 downto 0);
  //constant wciResp_OK           : wciRespT   := X"C0DE_4201";
  //constant wciResp_Error        : wciRespT   := X"C0DE_4202";
  //constant wciResp_Timeout      : wciRespT   := X"C0DE_4203";
  //constant wciResp_Reset        : wciRespT   := X"C0DE_4204";
//subtype  ocpCmdT is std_logic_vector(2 downto 0);
  //constant ocpCmd_IDLE          : ocpCmdT    := "000";
  //constant ocpCmd_WR            : ocpCmdT    := "001";
  //constant ocpCmd_RD            : ocpCmdT    := "010";
//subtype  ocpRespT is std_logic_vector(1 downto 0);
  //constant ocpResp_NULL         : ocpRespT   := "00";
  //constant ocpResp_DVA          : ocpRespT   := "01";
  //constant ocpResp_FAIL         : ocpRespT   := "10";
  //constant ocpResp_ERR          : ocpRespT   := "11";
