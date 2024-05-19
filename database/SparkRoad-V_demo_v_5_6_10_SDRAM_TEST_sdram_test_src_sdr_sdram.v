// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License



module sdr_sdram(CLK, RESET_N, ADDR, CMD, CMDACK, DATAIN, DATAOUT, SA, BA, CS_N, CKE, RAS_N, CAS_N, WE_N, DQ);
   
   parameter        ASIZE = 21;
   parameter        DSIZE = 32;
   parameter        ROWSIZE = 11;
   parameter        COLSIZE = 8;
   parameter        BANKSIZE = 2;
   parameter        ROWSTART = 8;
   parameter        COLSTART = 0;
   parameter        BANKSTART = 19;
   
   input            CLK;
   input            RESET_N;
   input [20:0]     ADDR;
   input [2:0]      CMD;
   output           CMDACK;
   input [31:0]     DATAIN;
   output [31:0]    DATAOUT;
   reg [31:0]       DATAOUT;
   output [10:0]    SA;
   reg [10:0]       SA;
   output [1:0]     BA;
   reg [1:0]        BA;
   output           CS_N;
   reg              CS_N;
   output           CKE;
   reg              CKE;
   output           RAS_N;
   reg              RAS_N;
   output           CAS_N;
   reg              CAS_N;
   output           WE_N;
   reg              WE_N;
   inout [31:0]     DQ;
   
   
   wire [10:0]      ISA;
   wire [1:0]       IBA;
   wire             ICS_N;
   wire             ICKE;
   wire             IRAS_N;
   wire             ICAS_N;
   wire             IWE_N;
   reg  [DSIZE-1:0] DQIN;
   wire [DSIZE-1:0] IDATAOUT;
   wire [DSIZE-1:0] DQOUT;
   
   wire [ASIZE-1:0] saddr;
   wire [1:0]       sc_cl;
   wire [1:0]       sc_rc;
   wire [3:0]       sc_rrd;
   wire             sc_pm;
   wire [3:0]       sc_bl;
   wire             load_mode;
   wire             nop;
   wire             reada;
   wire             writea;
   wire             precharge;
   wire             oe;
   wire             cm_ack;
   
   wire             CLK133B;
   
   
   control_interface #(ASIZE) ux_control(.CLK(CLK), .RESET_N(RESET_N), .CMD(CMD), .ADDR(ADDR), .CM_ACK(cm_ack), .NOP(nop), .READA(reada), .WRITEA(writea), .PRECHARGE(precharge), .LOAD_MODE(load_mode), .SADDR(saddr), .SC_CL(sc_cl), .SC_RC(sc_rc), .SC_RRD(sc_rrd), .SC_PM(sc_pm), .SC_BL(sc_bl),.CMD_ACK(CMDACK));
   
   
   command #(ASIZE, DSIZE, ROWSIZE, COLSIZE, BANKSIZE, ROWSTART, COLSTART, BANKSTART) ux_command(.CLK(CLK), .RESET_N(RESET_N), .SADDR(saddr), .NOP(nop), .READA(reada), .WRITEA(writea),.PRECHARGE(precharge), .LOAD_MODE(load_mode), .SC_CL(sc_cl), .SC_RC(sc_rc), .SC_RRD(sc_rrd), .SC_PM(sc_pm), .SC_BL(sc_bl),.CM_ACK(cm_ack), .OE(oe), .SA(ISA), .BA(IBA), .CS_N(ICS_N), .CKE(ICKE), .RAS_N(IRAS_N), .CAS_N(ICAS_N), .WE_N(IWE_N));
   
   
   sdr_data_path #(DSIZE) ux_data_path(.CLK(CLK), .RESET_N(RESET_N), .OE(oe), .DATAIN(DATAIN), .DATAOUT(IDATAOUT), .DQIN(DQIN), .DQOUT(DQOUT));
   
   
   always @(posedge CLK)
      
      begin
         SA <= ISA;
         BA <= IBA;
         CS_N <= ICS_N;
         CKE <= ICKE;
         RAS_N <= IRAS_N;
         CAS_N <= ICAS_N;
         WE_N <= IWE_N;
         DQIN <= DQ;
         DATAOUT <= IDATAOUT;
      end
   
   assign DQ = (oe == 1'b1) ? DQOUT : 
               {32{1'bZ}};
   
endmodule


