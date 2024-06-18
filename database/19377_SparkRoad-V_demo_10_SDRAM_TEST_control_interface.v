// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License




module control_interface(CLK, RESET_N, CMD, ADDR, CM_ACK, NOP, READA, WRITEA, PRECHARGE, LOAD_MODE, SADDR, SC_CL, SC_RC, SC_RRD, SC_PM, SC_BL, CMD_ACK);
   
   parameter          ASIZE = 21;
   
   input              CLK;
   input              RESET_N;
   input [2:0]        CMD;
   input [ASIZE-1:0]  ADDR;
   input              CM_ACK;
   output             NOP;
   reg                NOP;
   output             READA;
   reg                READA;
   output             WRITEA;
   reg                WRITEA;
   output             PRECHARGE;
   reg                PRECHARGE;
   output             LOAD_MODE;
   reg                LOAD_MODE;
   output [ASIZE-1:0] SADDR;
   output [1:0]       SC_CL;
   reg [1:0]          SC_CL;
   output [1:0]       SC_RC;
   reg [1:0]          SC_RC;
   output [3:0]       SC_RRD;
   reg [3:0]          SC_RRD;
   output             SC_PM;
   reg                SC_PM;
   output [3:0]       SC_BL;
   output             CMD_ACK;
   
   
   reg                LOAD_REG1;
   reg                LOAD_REG2;
   reg [ASIZE-1:0]    SADDR_int;
   reg                CMD_ACK_int;
   reg [3:0]          SC_BL_int;
   
   
   always @(posedge CLK or negedge RESET_N)
      if (RESET_N == 1'b0)
      begin
         NOP <= 1'b0;
         READA <= 1'b0;
         WRITEA <= 1'b0;
         PRECHARGE <= 1'b0;
         LOAD_MODE <= 1'b0;
         LOAD_REG1 <= 1'b0;
         LOAD_REG2 <= 1'b0;
         SADDR_int <= {ASIZE{1'b0}};
      end
      else 
      begin
         SADDR_int <= ADDR;
         
         if (CMD == 3'b000)
            NOP <= 1'b1;
         else
            NOP <= 1'b0;
         
         if (CMD == 3'b001)
            READA <= 1'b1;
         else
            READA <= 1'b0;
         
         if (CMD == 3'b010)
            WRITEA <= 1'b1;
         else
            WRITEA <= 1'b0;
         
         
         if (CMD == 3'b100)
            PRECHARGE <= 1'b1;
         else
            PRECHARGE <= 1'b0;
         
         if (CMD == 3'b101)
            LOAD_MODE <= 1'b1;
         else
            LOAD_MODE <= 1'b0;
         
         if ((CMD == 3'b110) & (LOAD_REG1 == 1'b0))
            LOAD_REG1 <= 1'b1;
         else
            LOAD_REG1 <= 1'b0;
         
         if ((CMD == 3'b111) & (LOAD_REG2 == 1'b0))
            LOAD_REG2 <= 1'b1;
         else
            LOAD_REG2 <= 1'b0;
      end
   
   
   always @(posedge CLK or negedge RESET_N)
      if (RESET_N == 1'b0)
      begin
         SC_CL <= {2{1'b0}};
         SC_RC <= {2{1'b0}};
         SC_RRD <= {4{1'b0}};
         SC_PM <= 1'b0;
         SC_BL_int <= {4{1'b0}};
      end
      
      else 
      begin
         if (LOAD_REG1 == 1'b1)
         begin
            SC_CL <= SADDR_int[1:0];
            SC_RC <= SADDR_int[3:2];
            SC_RRD <= SADDR_int[7:4];
            SC_PM <= SADDR_int[8];
            SC_BL_int <= SADDR_int[12:9];
         end
      end
   
   assign SADDR = SADDR_int;
   assign SC_BL = SC_BL_int;
//	assign REF_REQ = 1'b0;
   
   
   always @(posedge CLK or negedge RESET_N)
      if (RESET_N == 1'b0)
         CMD_ACK_int <= 1'b0;
      else 
      begin
         if (((CM_ACK == 1'b1) | (LOAD_REG1 == 1'b1) | (LOAD_REG2 == 1'b1)) & (CMD_ACK_int == 1'b0))
            CMD_ACK_int <= 1'b1;
         else
            CMD_ACK_int <= 1'b0;
      end
   
   assign CMD_ACK = CMD_ACK_int;
   
endmodule
