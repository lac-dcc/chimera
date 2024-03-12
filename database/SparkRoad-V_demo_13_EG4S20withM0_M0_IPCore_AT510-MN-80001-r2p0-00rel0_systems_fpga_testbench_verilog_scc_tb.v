//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2010-2015 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368444 $
//  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//  Purpose: Simple SCC master interface to FPGA
//-----------------------------------------------------------------------------
 
`timescale 1 ns/1 ps
module scc_tb (
  CFGCLK,
  nCFGRST,
  CFGLOAD,
  CFGWnR,
  CFGDATAIN,
  CFGDATAOUT
);

//-----------------------------------------------------------------------------
// port declarations
//-----------------------------------------------------------------------------
output          CFGCLK;       //CLK
input           nCFGRST;      //Reset
output          CFGLOAD;      //High when write data is complete or when read data is expected  
output          CFGWnR;       //Read_n / Write to SCC
output          CFGDATAIN;    //Date In
input           CFGDATAOUT;   //Date Out 
/*

//-----------------------------------------------------------------------------
// Constants
//-----------------------------------------------------------------------------

// Store the serial in packet
// 44 bit packet: | Address[11:0] | Data[31:0]
// WnR 0 = SCC Read, 1 = SCC Write

//-----------------------------------------------------------------------------
// Wire declarations
//-----------------------------------------------------------------------------
reg             iCFGCLK;
reg     [43:0]  ShiftReg;
reg             CFGWnR_reg;
reg             CFGDATAIN_reg;
reg     [43:0]  DCC_datain;
reg             CFGLOAD_reg;

integer         i;

//-----------------------------------------------------------------------------
// Main body of code
//-----------------------------------------------------------------------------


// Read
// 
// 1. Set CFGWnR = 0
// 2. Send Address
// 3. Send CFGLOAD
// 4. Read Data


// Write
// 1. Set CFGWnR = 1
// 2. Send Address
// 4. Read Data
// 3. Send CFGLOAD




initial
  begin 
    CFGLOAD_reg   = 1'b0;
    iCFGCLK       = 1'b0;
    CFGDATAIN_reg = 1'b0;
  end  


always @ (posedge nCFGRST)
begin
  
  scc_write (44'hCCC_CCCC_CCCC, i, CFGWnR_reg, iCFGCLK, CFGLOAD_reg, CFGDATAIN_reg);
#8000
  scc_read (44'hCCC_000_000, i, CFGDATAOUT, CFGWnR_reg, iCFGCLK, CFGLOAD_reg, CFGDATAIN_reg);
end



//       Write
// ----------------
task scc_write;
  input  [43:0] ShiftReg, i;  
  output CFGWnR_reg, iCFGCLK, CFGLOAD_reg, CFGDATAIN_reg; 
 
  begin
    CFGWnR_reg = 1'b1;
    #500 
      send_address (ShiftReg, i, iCFGCLK, CFGDATAIN_reg);
    #20000 
      send_CFGLOAD (iCFGCLK, CFGLOAD_reg); 
    #50000 
      write_data   (ShiftReg, i, iCFGCLK, CFGDATAIN_reg);
  end
endtask
 

//       Read  
// ----------------
task scc_read;
  input [43:0] ShiftReg, i, CFGDATAOUT;  
  output CFGWnR_reg, iCFGCLK, CFGDATAIN_reg, CFGLOAD_reg;
  output [43:0] DCC_datain;

  begin
    CFGWnR_reg = 1'b0;
    #500 
      send_address (ShiftReg, i, iCFGCLK, CFGDATAIN_reg); 
    #20000 
     read_data    (CFGDATAOUT, i, iCFGCLK, DCC_datain);
    #50000 
      send_CFGLOAD (iCFGCLK, CFGLOAD_reg);
  end
endtask    

    
//   Send Address
// ----------------
task send_address; //19500
  input  [43:0] ShiftReg, i;
  output iCFGCLK,CFGDATAIN_reg;
 
  begin
   for (i=0; i < 12 ; i=i+1) //19500
    begin
      #500
        CFGDATAIN_reg <= ShiftReg[43-i];
      #500
        iCFGCLK = ~iCFGCLK;
      #500
        iCFGCLK = ~iCFGCLK;     
    end
  end
endtask

      
//   CFGLOAD
// -----------
task send_CFGLOAD; //4000
  output iCFGCLK, CFGLOAD;
 
  begin
    #500
      CFGLOAD = 1'b1;
    #500
      iCFGCLK = ~iCFGCLK;
    #500
      CFGLOAD = 1'b0;
    #500
      iCFGCLK = ~iCFGCLK; 
  end
endtask

     
//  Write DATA to SCC
// ---------------------
task write_data;  //49500
  input  [43:0] ShiftReg, i;
  output iCFGCLK, CFGDATAIN_reg;

  begin
    for  (i=0; i < 32 ; i=i+1)
    begin 
      #500
        CFGDATAIN_reg <= ShiftReg[31-i];
      #500
        iCFGCLK = ~iCFGCLK;
      #500
        iCFGCLK = ~iCFGCLK; 
    end
  end
endtask
 

//  Read DATA from SCC
// ----------------------
task read_data;  //49500
  input  CFGDATAOUT, i;
  output iCFGCLK;
  output [43:0] DCC_datain;
  begin
    for  (i=0; i < 32 ; i=i+1)
    begin 
      #500
        iCFGCLK = ~iCFGCLK;
      #500  
        DCC_datain[0+i] <= CFGDATAOUT; 
      #500
        iCFGCLK = ~iCFGCLK; 
    end
  end
endtask

  
assign CFGCLK    = iCFGCLK;
assign CFGWnR    = CFGWnR_reg;
assign CFGDATAIN = CFGDATAIN_reg;
assign CFGLOAD   = CFGLOAD_reg;
*/
endmodule
