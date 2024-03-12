/*
* Copyright 2018 ARDUINO SA (http://www.arduino.cc/)
* This file is part of Vidor IP.
* Copyright (c) 2018
* Authors: Dario Pennisi
*
* This software is released under:
* The GNU General Public License, which covers the main part of 
* Vidor IP
* The terms of this license can be found at:
* https://www.gnu.org/licenses/gpl-3.0.en.html
*
* You can be released from the requirements of the above licenses by purchasing
* a commercial license. Buying such a license is mandatory if you want to modify or
* otherwise use the software for commercial activities involving the Arduino
* software without disclosing the source code of your own applications. To purchase
* a commercial license, send an email to license@arduino.cc.
*
*/

// this module implements a vrtual jtag to avalon bursting master
// it implements a 3 bit Instruction register coded as follows:
// 0: write operation
// 1: read operation
// 2-7: reserved for future use

module JTAG_BRIDGE (
  input         iCLK,
  input         iRESET,
  output [31:0] oADDRESS,
  output        oWRITE,
  output        oREAD,
  output [31:0] oWRITE_DATA,
  input  [31:0] iREAD_DATA,
  output [4:0]  oBURST_COUNT,
  input         iWAIT_REQUEST,
  input         iREAD_DATA_VALID
);

reg [31:0]  rBUFFER, rADDRESS, rDATA;
reg         rCDR,rSDR,rUIR,rUDR,rADDRESS_PHASE,rADDRESS_PHASED;
reg [2:0]   rIR;
reg [4:0]   rBITCNT;
reg         rWR_STROBE, rRD_STROBE;
wire        wWRITE_PHASE, wRD_EMPTY, wWR_EMPTY;
wire [31:0] wREAD_DATA;
wire [1:0]  wIR_OUT, wIR_IN;
wire        wTDI,wTDO,wTCK;
wire        wCIR,wPDR,wUIR,wSDR,wCDR,wUDR,wE1DR,wE2DR;
reg [4:0]   rDATA_CNT;
reg [1:0]   rADDR_BITS;
reg         rCDR_DELAYED,rSDR_DELAYED,rUIR_DELAYED ,rUDR_DELAYED  ;

assign wTDO   = rBUFFER[0];
assign oWRITE = !wWR_EMPTY& wWRITE_PHASE;
assign oREAD  = !wWR_EMPTY&!wWRITE_PHASE;

sld_virtual_jtag_basic  VJTAG_INST (
  .ir_out             (wIR_OUT),
  .tdo                (wTDO),
  .tdi                (wTDI),
  .tck                (wTCK),
  .ir_in              (wIR_IN),
  .virtual_state_cir  (wCIR),
  .virtual_state_pdr  (wPDR),
  .virtual_state_uir  (wUIR),
  .virtual_state_sdr  (wSDR),
  .virtual_state_cdr  (wCDR),
  .virtual_state_udr  (wUDR),
  .virtual_state_e1dr (wE1DR),
  .virtual_state_e2dr (wE2DR)
  );
defparam
  VJTAG_INST.sld_mfg_id              = 110,
  VJTAG_INST.sld_type_id             = 132,
  VJTAG_INST.sld_version             = 1,
  VJTAG_INST.sld_auto_instance_index = "YES",
  VJTAG_INST.sld_instance_index      = 0,
  VJTAG_INST.sld_ir_width            = 3,
  VJTAG_INST.sld_sim_action          = "",
  VJTAG_INST.sld_sim_n_scan          = 0,
  VJTAG_INST.sld_sim_total_length    = 0;

always @(negedge wTCK)
begin
  //  Delay the CDR signal by one half clock cycle 
  rCDR <= wCDR;
  rSDR <= wSDR;
  rUIR <= wUIR;
  rUDR <= wUDR;
  if (wUIR) begin
    rIR <= wIR_IN;
  end
end


always @(posedge wTCK)
begin
  rWR_STROBE<=0;
  rRD_STROBE<=0;
  if (rCDR) begin
    rBUFFER<=0;
    rBITCNT<=0;
  end
  // if we are shifting data register...
  if (rSDR) begin
    /// shift buffer and increment bit count
    rBUFFER <= {wTDI,rBUFFER[31:1]};
    rBITCNT<=rBITCNT+1;
  end
  // if we just wrote some data, increment address 
  if (rWR_STROBE) begin
    rADDRESS<=rADDRESS+1;
  end
  case (rIR)
    // read operation
    0: begin
      // if we get Capture Data Register flag we move in the address phase
      if (rCDR) begin
        rADDRESS_PHASE<=1;
      end
      // if we get Update Data Register we move to data phase
      if (rUDR) begin
        rADDRESS_PHASE<=0;
        if (rBITCNT==3) begin
          rDATA_CNT<={1'b0,wTDI,rBUFFER[31-:3]}+1;
        end
        else rDATA_CNT<=1;
      end
      // if we are shifting data...
      if (rSDR) begin
        // address phase. depending on header we shift in only part of the address
        if (rADDRESS_PHASE) begin
          // the two LSBs specify the size of the address so that we can optimize transaction shortening address:
          // 0: 8 bit
          // 1: 16 bit
          // 2: 24 bit
          // 3: 32 bit  
          case (rBITCNT)
          1: rADDR_BITS <= {wTDI,rBUFFER[31]};
          7: if (rADDR_BITS==0) begin
               // we discard the 2 LSBs as our address is in words
               rADDRESS[5:0]<={wTDI,rBUFFER[31-:5]};
               rBITCNT<=0;
               rADDRESS_PHASE<=0;
             end
          15:if (rADDR_BITS==1) begin
               rADDRESS[13:0]<={wTDI,rBUFFER[31-:13]};
               rBITCNT<=0;
               rADDRESS_PHASE<=0;
             end
          23:if (rADDR_BITS==2) begin
               rADDRESS[21:0]<={wTDI,rBUFFER[31-:21]};
               rBITCNT<=0;
               rADDRESS_PHASE<=0;
             end
          31:if (rADDR_BITS==3) begin
               rADDRESS[29:0]<={wTDI,rBUFFER[31-:29]};
               rBITCNT<=0;
               rADDRESS_PHASE<=0;
             end
          endcase
        end
        else begin
          // we are in data phase... shift bits and issue strobe when we have a word
          if (rBITCNT==31) begin
            rDATA<={wTDI,rBUFFER[31-:31]};
            rWR_STROBE<=1;
          end
        end
      end
    end
    1: begin
      if (rCDR) begin
        rBITCNT<=0;
        rBUFFER<=wREAD_DATA;
        rRD_STROBE<=1;
      end
      if (rSDR) begin
        if (rBITCNT==31) begin
          rBUFFER<=wREAD_DATA;
          rRD_STROBE<=1;
        end
      end
    end
  endcase
end

  dcfifo  #(
    .add_usedw_msb_bit      ("ON"),
    .intended_device_family ("Cyclone 10 LP"),
    .lpm_numwords           (4),
    .lpm_showahead          ("ON"),
    .lpm_type               ("dcfifo"),
    .lpm_width              (70),
    .lpm_widthu             (2),
    .overflow_checking      ("OFF"),
    .rdsync_delaypipe       (5),
    .read_aclr_synch        ("ON"),
    .underflow_checking     ("ON"),
    .use_eab                ("OFF"),
    .write_aclr_synch       ("OFF"),
    .wrsync_delaypipe       (5)
  ) WRFIFO_INST (
    .data       ({rADDRESS,rDATA,rDATA_CNT,rWR_STROBE}),
    .rdclk      (iCLK),
    .rdreq      (!wWR_EMPTY&&!iWAIT_REQUEST),
    .wrclk      (wTCK),
    .wrreq      (rWR_STROBE|(rUIR&&rIR==1)),
    .q          ({oADDRESS,oWRITE_DATA,oBURST_COUNT,wWRITE_PHASE}),
    .rdempty    (wWR_EMPTY),
    .aclr       (),
    .rdfull     (),
    .rdusedw    (),
    .eccstatus  (),
    .wrempty    (),
    .wrfull     (),
    .wrusedw    ());

  dcfifo  #(
    .add_usedw_msb_bit      ("ON"),
    .intended_device_family ("Cyclone 10 LP"),
    .lpm_numwords           (4),
    .lpm_showahead          ("ON"),
    .lpm_type               ("dcfifo"),
    .lpm_width              (32),
    .lpm_widthu             (2),
    .overflow_checking      ("OFF"),
    .rdsync_delaypipe       (5),
    .read_aclr_synch        ("ON"),
    .underflow_checking     ("ON"),
    .use_eab                ("OFF"),
    .write_aclr_synch       ("OFF"),
    .wrsync_delaypipe       (5)
  ) RDFIFO_INST (
    .data       (iREAD_DATA),
    .rdclk      (wTCK),
    .rdreq      (rRD_STROBE&&!wRD_EMPTY),
    .wrclk      (iCLK),
    .wrreq      (iREAD_DATA_VALID),
    .q          (wREAD_DATA),
    .rdempty    (wRD_EMPTY),
    .aclr       (),
    .rdfull     (),
    .rdusedw    (),
    .eccstatus  (),
    .wrempty    (),
    .wrfull     (),
    .wrusedw    ());


endmodule