//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//  -------------------------------------------------------------------------
//  Purpose: Simple SPI to APB3 bridge
//  -------------------------------------------------------------------------

module SPI2APB3(

  PRESETn,
  SPICLK,
  SPIDI,
  SPIDO,

  //APB
  PCLK,
  PADDR,
  PSEL,
  PENABLE,
  PWRITE,
  PSTRB,
  PWDATA,
  PRDATA,
  PREADY,
  SPI_CFGDATA
);

  //-----------------------------------------------------------------------------
  // port declarations
  //-----------------------------------------------------------------------------
  // SPI slave interface
  input  wire        SPICLK;
  input  wire        SPIDI;
  output wire        SPIDO;

  // APB interface
  input  wire        PRESETn;
  input  wire        PCLK;
   // APB master
  output reg  [31:0] PADDR;
  output reg         PSEL;
  output reg         PENABLE;
  output reg         PWRITE;
  output wire  [3:0] PSTRB;
  output reg  [31:0] PWDATA;

  input  wire [31:0] PRDATA;
  input  wire        PREADY;

  output wire [31:0] SPI_CFGDATA;// config data

  //-----------------------------------------------------------------------------
  // Constants
  //-----------------------------------------------------------------------------
// Operation command
`define READ_OP      8'h20
`define WRITE_OP     8'hA0
`define CFG_READ  8'h40
`define CFG_WRITE 8'hC0

// FSM state
`define TXFER_DETECT    3'b000
`define ADDRESS_PHASE   3'b001
`define DATA_PHASE      3'b010
`define TXFER_COMPLETE  3'b100

  //-----------------------------------------------------------------------------
  // Wire declarations
  //-----------------------------------------------------------------------------

  reg [39:0]   shift_in_register;
  reg [31:0]   shift_out_register;
  reg  [7:0]   op_command;// Operation command
  reg [39:0]   address;   // Address
  reg  [7:0]   count;     // SPI bit counter
  reg          dataread;  // Command to perform data read on APB
  reg          datawrite; // Command to perform data write on APB
  reg          cfgread;   // Command to perform CFG read on cfgdata_i
  reg          cfgwrite;  // Command to perform CFG write on cfgdata_i

  reg [31:0]   rdata_i;   // Sampled PRDATA
  reg [31:0]   wdata_i;   // Write data (sampled from serial to parallel register)
  reg [31:0]   cfgdata_i; // R/W from SPI

  reg          RCAPTURED; // Read data is captured (prevent more than 1 sampling)
  reg  [2:0]   STATE;     // Current State for FSM

  //-----------------------------------------------------------------------------
  // Main body of code
  //-----------------------------------------------------------------------------

  //-------------------------------------------------------------------
  //Shift Data in from MICRO
  //-------------------------------------------------------------------
  // Serial-in/ Serial Out Shift Register
  always @ (posedge SPICLK or negedge PRESETn)
  begin : p_shiftin_reg
  if (!PRESETn) begin
    // Serial Data output assignments
    shift_in_register   <= {40{1'b0}};
  end else begin
    shift_in_register[0]    <= SPIDI;
    shift_in_register[39:1] <= shift_in_register[38:0];
  end
  end

  // Store the serial in packet
  // 112 bit packet: | Comand[7:0] | Address[39:0]| DataIn[31:0] | DataOut[31:0] 

  always @(posedge SPICLK or negedge PRESETn) 
  begin
  if (!PRESETn) begin
   op_command    <= {8{1'b0}};
   address    <= {40{1'b0}};
   count      <= {8{1'b0}};
   dataread   <= 0;
   datawrite  <= 0;
   cfgread    <= 0; 
   cfgwrite   <= 0;
   
   wdata_i    <= {32{1'b0}};
   cfgdata_i  <= {32{1'b0}};
  end else begin
    count <= count + 1;
    if (count == 8)
      op_command <= shift_in_register[7:0];
    if (count == 48)
      address <= shift_in_register[39:0];
    if (count == 48 && op_command == `READ_OP) begin  //READ Command
      dataread  <= 1;
    end
    if (count == 80 && op_command == `WRITE_OP) begin  //WRITE Command
      wdata_i <= shift_in_register[31:0];
      datawrite <= 1;
    end
    if (count == 80 && op_command == `CFG_READ) begin //READ Command
      cfgread   <= 1;
    end
    if (count == 80 && op_command == `CFG_WRITE) begin  //WRITE Command
      cfgdata_i  <= shift_in_register[31:0];
      cfgwrite   <= 1;
    end
    if (count == 111) begin
      count     <= 8'b0; //reset count
      dataread  <= 0;
      datawrite <= 0;
      cfgread   <= 0;
      cfgwrite  <= 0;
    end
  end
  end

  //-------------------------------------------------------------------
  //Shift Data out to MICRO
  //-------------------------------------------------------------------
  // metastability registers  (double DFF synchronization)
  reg [31:0] rdata_i1;
  reg [31:0] rdata_i2;
  always @ (posedge SPICLK or negedge PRESETn)
  begin
    if (!PRESETn) begin
      rdata_i1 <= {32{1'b0}};
      rdata_i2 <= {32{1'b0}};
    end else begin
      rdata_i1 <= rdata_i;
      rdata_i2 <= rdata_i1;
    end
  end

  always @ (posedge SPICLK or negedge PRESETn)
  begin : p_shiftout_reg
    if (!PRESETn) begin
      shift_out_register[31:0] <= 32'h00000000;
    end else begin
      if(dataread && count == 79) begin
        shift_out_register <= {rdata_i2 [31:0]};
      end else if (cfgread && count == 79) begin
        shift_out_register <= {cfgdata_i [31:0]};
      end else begin
        shift_out_register[31:1] <= shift_out_register[30:0];
        shift_out_register[0]    <= 1'b0;
      end
    end
  end

  assign SPIDO = shift_out_register[31];

  // Metastability registers (double DFF synchronization)
  reg dataread1;
  reg dataread2;
  reg datawrite1;
  reg datawrite2;

  always @(posedge PCLK or negedge PRESETn)
  begin
  if(!PRESETn) begin
    dataread1  <= 1'b0;
    datawrite1 <= 1'b0;
    dataread2  <= 1'b0;
    datawrite2 <= 1'b0;    
  end else begin
    dataread1  <= dataread;
    dataread2  <= dataread1;
    datawrite1 <= datawrite;
    datawrite2 <= datawrite1;
  end
  end  


  //state machine to control APB operations
  always @(posedge PCLK or negedge PRESETn)
  begin
    if(!PRESETn) begin
      rdata_i   <= 32'b0;
      PADDR     <= {32{1'b0}};
      PSEL      <= 1'b0;
      PENABLE   <= 1'b0;
      PWRITE    <= 1'b0;
      PWDATA    <= {32{1'b0}};    
        
      RCAPTURED <= 1'b0;
      STATE     <= `TXFER_DETECT;
    end else begin
      case (STATE)
        `TXFER_DETECT: begin
          RCAPTURED <= 1'b0;
          if(dataread2 || datawrite2) begin
            PADDR   <= address[31:0];
            PSEL    <= 1'b1;
            PENABLE <= 1'b0;
            if(datawrite2 == 1'b1) begin //deceide if read or write
              PWRITE <= 1'b1; //WRITE
              PWDATA <= wdata_i;            
            end else begin
              PWRITE <= 1'b0; //READ
              PWDATA <= {32{1'b0}};           
            end 
            STATE <= `ADDRESS_PHASE;
          end else begin
            rdata_i <= 32'b0;
            STATE <= `TXFER_DETECT;
          end
        end

      //setup data phase
      `ADDRESS_PHASE:
        begin
        PENABLE <= 1'b1;        
        STATE <= `DATA_PHASE;
        end

      //read PRDATA if PREADY set
      `DATA_PHASE: 
        begin
        if(PREADY && RCAPTURED == 1'b0) begin //hold data
          rdata_i   <= PRDATA;
          RCAPTURED <= 1'b1;
          STATE     <= `TXFER_COMPLETE;
          end
        end
      `TXFER_COMPLETE: 
        begin
        if(!datawrite2 &!dataread2) begin //wait till both read or write are complete
          RCAPTURED <= 1'b0;
          STATE     <= `TXFER_DETECT;
        end else begin
          PADDR     <= {32{1'b0}};
          PSEL      <= 1'b0;
          PENABLE   <= 1'b0;
          PWRITE    <= 1'b0;
          PWDATA    <= {32{1'b0}};              
          RCAPTURED <= 1'b1;
          STATE     <= `TXFER_COMPLETE;
        end
        end
      default : begin
        rdata_i   <= {32{1'b0}};
        PADDR     <= {32{1'b0}};
        PSEL      <= 1'b0;
        PENABLE   <= 1'b0;
        PWRITE    <= 1'b0;
        PWDATA    <= {32{1'b0}};    
        RCAPTURED <= 1'b0;
        STATE     <= `TXFER_DETECT;
        end
      endcase
     end
  end

  // Write strobes (AMBA4 APB).
  // This signal indicates which byte lanes to update during a write transfer.
  // Write strobes must not be active during a read transfer.
  assign PSTRB = {4{(PWRITE & PSEL)}};

  assign SPI_CFGDATA = cfgdata_i;

endmodule
