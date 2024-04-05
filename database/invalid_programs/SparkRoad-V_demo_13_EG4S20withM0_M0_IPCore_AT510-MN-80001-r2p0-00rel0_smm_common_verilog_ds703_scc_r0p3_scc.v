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
//-----------------------------------------------------------------------------
// Abstract : Serial Configuration Controller
//              Implementation Notes : All configuration outputs should be treated
//              as static when used within the design
//              A false time path should be placed between PCLK and CFGCLK
//              Loading or read a configuration word while performing a APB
//              read/write could result in unpredictable results
//  
//              Added optional APB LOCK register 0x020 and Text output register 0x40 
//              (simulation only)
//
//              Moved APB LOCK register to 0x120
//              Using parameters instead defines
//              Adding possibility to use configurable registers for reading
//              state of external signals
//              
// ----------------------------------------------------------------------------
// The following registers are implemented in this block:
`include "fpga_options_defs.v"



`timescale 1ns/1ps


module scc (
             PCLK,
             PRESETn,
             PSEL,
             PENABLE,
             PWRITE,
             PADDR,
             PWDATA,
             PRDATA,

             CFGCLK,
             nCFGRST,
             CFGLOAD,
             CFGWnR,
             CFGDATAIN,

             CFGDATAOUT,

             DLL_LOCKED,
             SWITCH_OUTPUT,
             ALT_LED_SOURCE,

             CFGREG_IN,
             CFGREG_OUT,
             CFGINT
           );

// parameters

parameter CFG_REGS        = 8;

parameter BUILD           = `BUILD;
parameter VARIANT         = `VARIANT;
parameter REV             = `REV;
parameter TARGET          = `BOARD_TARGET;

//-----------------------------------------------------------------------------
parameter ARCHITEC    = 4'h4; //AHB
parameter IDENT           = `IDENT;

parameter FPGAIF          = {8'b00000111,8'b00001000};

parameter APBLOCK         = 1;
parameter APBLOCKREG_MASK = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

// For each config word define the default reset state

parameter CFG_DEFAULT     = {32'h0000_0000,32'h0000_0000,32'h0000_0000,32'h0000_0000,
                             32'h0000_0000,32'h0000_0000,32'h0000_0000,32'h0000_0000};

// For each config word define which bits are read/write bu apb bus (set to 1),
// or read only (set to 0)
parameter CFGRW           = {32'hffff_ffff,32'hffff_ffff,32'hffff_ffff,32'hffff_ffff,
                             32'hffff_ffff,32'hffff_ffff,32'hffff_ffff,32'hffff_ffff};

parameter CFGEXTR         = {32'h0000_0000,32'h0000_0000,32'h0000_0000,32'h0000_0000,
                             32'h0000_0000,32'h0000_0000,32'h0000_0000,32'h0000_0000};

parameter SCC_DLLLOCK_DEFAULT = 8'b11111111;
parameter SCC_LED_DEFAULT     = 8'b00001111;

parameter USE_ALT_LED_SOURCE  = 0; // MCU LEDs and switches locally controlled.

// Do not change
parameter CFG_REGS_SIZE       = CFG_REGS*32;

parameter SCC_AID_DEFAULT     = {BUILD,TARGET,4'b0000,FPGAIF};  
parameter SCC_ID_DEFAULT      = {8'h41,VARIANT,ARCHITEC,IDENT,REV}; 


//------------------------------------------------------------------------------
// Inputs/Outputs
//------------------------------------------------------------------------------

input         PCLK;            // APB Bus Clock
input         PRESETn;         // AMBA Bus reset
input         PSEL;            // APB Peripheral select
input         PENABLE;         // APB Peripheral enable
input         PWRITE;          // APB Peripheral write
input  [11:0] PADDR;           // APB Addr bus
input  [31:0] PWDATA;          // APB write databus
output [31:0] PRDATA;          // APB data out


input         CFGCLK;          // Configuration data serial shift clock
input         nCFGRST;         // Config data reset to defaul settings
input         CFGLOAD;         // Load newly shifter data for read or write
input         CFGWnR;          // 1 = write new config, 0 = Read current config
input         CFGDATAIN;       // Serial shift data, sample on rising edge of CFGCLK

output        CFGDATAOUT;      // Serial shift out data of current config

input  [7:0]  DLL_LOCKED;

output [7:0]  SWITCH_OUTPUT;   // User Switches
input  [7:0]  ALT_LED_SOURCE;  // User leds

output        CFGINT;          // Interrupt to MCU on FPGA board

input  [CFG_REGS_SIZE-1:0] CFGREG_IN;
output [CFG_REGS_SIZE-1:0] CFGREG_OUT;

//------------------------------------------------------------------------------
// Beginning of main code
//------------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register and wire declaration
// -----------------------------------------------------------------------------

wire          CFGCLK;
wire          nCFGRST;
wire          CFGLOAD;
wire          CFGWnR;
wire          CFGDATAIN;
reg           CFGDATAOUT;

wire          PCLK;
wire          PRESETn;
wire          PSEL;
wire          PENABLE;
wire          PWRITE;
wire  [11:0]  PADDR;
wire  [31:0]  PWDATA;
wire  [31:0]  PRDATA;

wire          CFGINT;
integer       i,x;

// Depending the define we need to generate a number of registers to hold the
// config data, all registers are 32-bits wide

reg  [CFG_REGS_SIZE-1:0] cfg_regs_serial;   // Config data from serial shift
reg  [CFG_REGS-1: 0]     cfg_reg_ctrl;      // Selects if the config data comes from serial or APB
reg  [CFG_REGS_SIZE-1:0] cfg_regs_apb;      // Config data from the APB bus
reg  [CFG_REGS_SIZE-1:0] cfg_regs_actual;   // Final config data from serial or APB if written

reg  [43:0] cfgreg_init;        // Serial shift registers

reg  [31:0] cfg_readregs;       // Config data from serial shift
reg  [31:0] prdata_int;         // APB write databus register
reg         read_en;            // APB Read enable output

wire [CFG_REGS_SIZE-1:0]  RWMASK;
wire [CFG_REGS_SIZE-1:0]  EXTRMASK;


reg  [31:24] scc_dlllock_serial;
wire [31:0]  scc_dlllock_actual;

reg  [7:0]  scc_led_apb;
wire [31:0] scc_led_actual;

reg  [31:0] scc_sw_serial;
wire [31:0] scc_sw_actual;

reg  [31:0] scc_aid_serial;
wire [31:0] scc_aid_actual;

reg  [31:0] scc_id_serial;
wire [31:0] scc_id_actual;


wire        LOCKED;
wire  [7:0] DLL_LOCK_EN;

wire [31:0]           scc_apblock_actual;
reg  [CFG_REGS-1: 0]  cfg_regs_apblock;    // Allows write by APB bus
reg  [15:0]           scc_apblock_apb;
  
wire [CFG_REGS-1: 0]  apblocked_mask;       
wire                  apbunlocked;

// Configuration register support
reg   [31:0]         scc_syscfgstat_serial;  //allows write via serial
wire  [31:0]         scc_syscfgstat_actual;  //mirror of write data to allow read via apb or serial

reg   [31:0]         scc_syscfgdat_apb;      //separate data reg for write via apb
reg   [31:0]         scc_syscfgdat_serial;   //separate data reg for write via serial

reg   [31:0]         scc_syscfgctrl_apb;     //allows write via serial
wire  [31:0]         scc_syscfgctrl_actual;  //mirror of write data to allow read via apb or serial

reg                  asynch_stat_clear;      //asynchronous clear used to clear SCC_SysCFGSTAT when write to SCC_SysCFGCTRL[31] occurs
reg                  interrupt_gen;          //used to generate pulse interrupt signal
wire                 syscfgstat_clear;       //used to combine AMBA bus reset and asynchronous clear for clearing SCC_SysCFGSTAT


// ----------------------------------------------------------
// Config register - Not SCC readable
// ----------------------------------------------------------

  //0xA0 SYS_CFGDATA R/W Configuration data
  //0xA4 SYS_CFGCTRL R/W Configuration control
  // Bit 11:0 OSCCLK select (0,1,2)
  // Bit 19:12 Reserved. Set to 0
  // Bit 25:20: OSCCLK (1)
  // Bit 29:26 : Reserved. Set to 0
  // Bit 30 : Write Read or write data
  // Bit 31 : Start Initiates the transfer
  //0xA8 SYS_CFGSTAT
  // Bit 0 : Complete
  // Bit 1 : Error
  
  // Generates an interrupt to the Micro when SYS_CFGCTRL[31] is set.
  assign CFGINT = interrupt_gen;

// ----------------------------------------------------------
// TC Config load control
// ----------------------------------------------------------
assign RWMASK     = CFGRW;
assign EXTRMASK   = CFGEXTR;

// This serial shift chain is used to load the Addr and Data
always @(posedge CFGCLK or negedge nCFGRST)
begin
    //place holder
    if (!nCFGRST) // only update CFGreg if in reset, else ignore cfg inputs
    begin // set default values
      cfgreg_init[43:0] <= {44{1'b0}};
    end
    else
    begin
      cfgreg_init[43:1] <= cfgreg_init[42:0];
      cfgreg_init[0]    <= CFGDATAIN;
    end
end


// When load is asserted, the address from the shift register is used to
// the addressed config holder registers
always @(posedge CFGCLK or negedge nCFGRST)
begin
    //place holder
    if (!nCFGRST) // only update CFGreg if in reset, else ignore cfg inputs
    begin // set default values

      // -----------------------
      // Update for more configs
      // -----------------------
      cfg_regs_serial  <= CFG_DEFAULT;

      // -----------------------

    end
    else
    begin
      for (i=0;i<CFG_REGS;i=i+1)
      begin
        if ((cfgreg_init[43:34] == i) & CFGLOAD & CFGWnR)
        begin
          for (x=0;x<32;x=x+1) 
          begin
            cfg_regs_serial[i*32+x]   <= cfgreg_init[x];
          end
        end
      end
    end
end

assign syscfgstat_clear = (!nCFGRST || asynch_stat_clear);

always @(posedge CFGCLK or posedge syscfgstat_clear)
begin
    if (syscfgstat_clear)             //if reset or asynchronous clear asserted
    begin 
        scc_syscfgstat_serial      <= 32'b0;   //clear SCC_SysCFGSTAT
    end
    else
    begin
      if (CFGLOAD & CFGWnR)
      begin
        case (cfgreg_init[43:32])
          12'h0AC : scc_syscfgstat_serial <= cfgreg_init[31:0];
          default: ;
        endcase
      end
    end
end

always @(posedge CFGCLK or negedge nCFGRST)
begin
    if (!nCFGRST) // only update CFGreg if in reset, else ignore cfg inputs
    begin 
      // set default values
      scc_dlllock_serial[31:24]  <= SCC_DLLLOCK_DEFAULT;
      scc_sw_serial              <= 32'b0;
      scc_aid_serial             <= SCC_AID_DEFAULT;
      scc_id_serial              <= SCC_ID_DEFAULT;
      scc_syscfgdat_serial       <= 32'h0;
    end
    else
    begin
      if (CFGLOAD & CFGWnR)
      begin
        case (cfgreg_init[43:32])
          12'h0A0 : scc_syscfgdat_serial  <= cfgreg_init[31:0];
          12'h100 : scc_dlllock_serial[31:24] <= cfgreg_init[31:24];
          12'h108 : scc_sw_serial             <= cfgreg_init[31:0];
          12'hff8 : scc_aid_serial            <= cfgreg_init[31:0];
          12'hffc : scc_id_serial             <= cfgreg_init[31:0];
          default: ;
        endcase
      end
    end
end


// ----------------------------------------------------------
// TC Config read back
// ----------------------------------------------------------

// When CFGWnR =0 and CFGLOAD is asserted and we get a clock,
// load the configuration word into the shift out registers
always @(posedge CFGCLK or negedge nCFGRST)
begin
    if (!nCFGRST) begin // only update CFGreg if in reset, else ignore cfg inputs
      cfg_readregs <= {32{1'b0}};
      CFGDATAOUT <= 1'b0;
      end
    else
    begin
      if (CFGLOAD & !CFGWnR)
      begin
        if (cfgreg_init[11:2] < CFG_REGS)
        begin
          for (i=0;i<CFG_REGS;i=i+1)
          begin
            if (cfgreg_init[11:2] == i)
            begin
              for (x=0;x<32;x=x+1)
              begin
                cfg_readregs[x] <=  cfg_regs_actual[i*32+x];
              end
            end
          end
        end else begin
          case (cfgreg_init[11:0])
            //read out data to the output reg
            12'h0A0 : cfg_readregs <= scc_syscfgdat_serial; 
            12'h0A4 : cfg_readregs <= scc_syscfgdat_apb; 
            12'h0A8 : cfg_readregs <= scc_syscfgctrl_actual;
            12'h0AC : cfg_readregs <= scc_syscfgstat_actual;
            12'h100 : cfg_readregs <= scc_dlllock_actual;
            12'h104 : cfg_readregs <= scc_led_actual;
            12'h108 : cfg_readregs <= scc_sw_actual;
            12'hff8 : cfg_readregs <= scc_aid_actual;
            12'hffc : cfg_readregs <= scc_id_actual;
            12'h120 : cfg_readregs <= scc_apblock_actual;
            default : cfg_readregs <= 32'h00000000;
          endcase
        end
      end
      else
      begin
        cfg_readregs[30:0] <= cfg_readregs[31:1];
        cfg_readregs[31]   <= 1'b0;
        CFGDATAOUT         <= cfg_readregs[0];
      end
    end
end


// ----------------------------------------------------------
// APB Read/Write Interface
// ----------------------------------------------------------

// The define file details which bits in each config word are
// either read/write or read only
// A define for read/write must be made for all defined config words

// Assign data to PRDATA on read enable and select
assign PRDATA = (read_en && PENABLE && PSEL) ? prdata_int : 32'b0;

// read from/ write to cfg register
always @(posedge PCLK or negedge PRESETn)
begin
    if (PRESETn == 1'b0)
    begin
      // -----------------------
      // Update for more configs
      // -----------------------
      cfg_regs_apb  <= CFG_DEFAULT;
      scc_led_apb   <= SCC_LED_DEFAULT;

     // -----------------------

      cfg_reg_ctrl    <= {CFG_REGS{1'b0}};
      asynch_stat_clear <= 1'b0;

      prdata_int      <= {32{1'b0}};
      read_en         <= 1'b0;
      scc_syscfgdat_apb       <= 32'h0;   
      scc_syscfgctrl_apb      <= {32{1'b0}};
      scc_apblock_apb <= {16{1'b0}};
      
    end
    else if ((PSEL == 1'b1) )//&& (PENABLE == 1'b1))
    begin
      if ( PWRITE == 1'b0 ) // read cycle from cfg register
      begin
        read_en <= 1'b1;
        if (PADDR[11:2] < CFG_REGS)
        begin
          for (i=0;i<CFG_REGS;i=i+1)
          begin
            if (PADDR[11:2] == i)
            begin
              for (x=0;x<32;x=x+1)
              begin
                prdata_int[x] <=  cfg_regs_actual[i*32+x];
              end
            end
          end
        end else begin
          case ( PADDR[11:0] )
            12'h0A0 : prdata_int <= scc_syscfgdat_serial; 
            12'h0A4 : prdata_int <= scc_syscfgdat_apb; 
            12'h0A8 : prdata_int <= scc_syscfgctrl_actual;
            12'h0AC : prdata_int <= scc_syscfgstat_actual;
            12'h100 : prdata_int <= scc_dlllock_actual;
            12'h104 : prdata_int <= scc_led_actual;
            12'h108 : prdata_int <= scc_sw_actual;
            12'hff8 : prdata_int <= scc_aid_actual;
            12'hffc : prdata_int <= scc_id_actual;
            12'h120 : prdata_int <= scc_apblock_actual;
            default : prdata_int <= 32'h00000000;
          endcase
        end
      end // read cycle

      else // write cycle to cfg register
           // Once a config register is written to it becomes completely controlled
           // by the APB until a system reset
      begin
        read_en <= 1'b0;
        if (PADDR[11:2] < CFG_REGS)
        begin
          for (i=0;i<CFG_REGS;i=i+1)
          begin
            if ((PADDR[11:2] == i) && (cfg_regs_apblock[i] == 1'b0))
            begin
              for (x=0;x<32;x=x+1)
              begin
                cfg_regs_apb[i*32+x] <= PWDATA[x];
              end
              cfg_reg_ctrl[i]  <= 1'b1;
            end
          end
        end else begin
          case ( PADDR[11:0] )
            12'h0A4 : scc_syscfgdat_apb  <= PWDATA;   
            12'h0A8 : if (PWDATA[31] != 1'b0)
                        begin
                          if(scc_syscfgstat_actual[1:0] != 2'b00)
                            begin
                              asynch_stat_clear <= 1'b1;
                              scc_syscfgctrl_apb       <= PWDATA;
                              asynch_stat_clear <= 1'b0;

                            end
                          else 
                            begin
                              scc_syscfgctrl_apb <= PWDATA;
                              asynch_stat_clear <= 1'b0;
                              
                            end
                        end
              12'h104 : scc_led_apb     <= PWDATA[7:0];
              12'h120 : scc_apblock_apb <= PWDATA[15:0];
            
            default : ;
          endcase
        end
      end // write cycle
    end // apb transfer
end

//Interrupt pulse generation, when write via apb to SCC_SysCFGCTRL occurs
//set the interrupt_gen bit and then clear on the next 
always @(posedge PCLK or negedge PRESETn)
begin
    if (PRESETn == 1'b0)
    begin
      interrupt_gen <= 1'b0;
    end
    else 
    begin
      if ((PSEL == 1'b1) && ( PWRITE != 1'b0 ) && (PADDR[11:0] == 12'h0A8) && (PWDATA[31] != 1'b0))
      begin
        interrupt_gen <= 1'b1;
      end 
      else 
      begin
        interrupt_gen <= 1'b0;
      end
    end
end

// apb lock register
generate if (APBLOCK != 0) begin: APBLOCK_gen_5
  
  assign apbunlocked        = (scc_apblock_apb[15:0] == 16'ha05f) ? 1'b1 : 1'b0; 
  assign apblocked_mask     = APBLOCKREG_MASK; 

end else begin 
  assign apbunlocked        = 1'b1; 
  assign apblocked_mask     = {CFG_REGS{1'b0}}; 
end 
endgenerate

always @(apbunlocked or apblocked_mask)
 begin
    for (i=0;i<CFG_REGS;i=i+1)
     begin
        if ((apblocked_mask[i] == 1'b0) || (apbunlocked==1'b1))
            cfg_regs_apblock[i] = 1'b0; 
        else
            cfg_regs_apblock[i] = 1'b1;
     end
 end


// ---------------------------------------------------------------------------
// Assign outputs
// ---------------------------------------------------------------------------

// By default the configs are driven from the config bus, however once a register
// write has been performed this overridden by the new software written value
always @(RWMASK or EXTRMASK or CFGREG_IN or 
         cfg_reg_ctrl or cfg_regs_apb or cfg_regs_serial)
begin
  for (i=0;i<CFG_REGS;i=i+1)
  begin
    if (cfg_reg_ctrl[i])   // Config is under control of the APB registers
    begin
      for (x=0;x<32;x=x+1) 
      begin
        if (EXTRMASK[i*32+x])   // Check the read from external signal
          cfg_regs_actual[i*32+x] = CFGREG_IN[i*32+x];
        else 
        begin 
          if (RWMASK[i*32+x] && i != 1) // Check the read/write bits, if read only use
                                // the serial data
            cfg_regs_actual[i*32+x] = cfg_regs_apb[i*32+x];
          else
          begin 
            if (USE_ALT_LED_SOURCE != 0 && i == 1)
              cfg_regs_actual[i*32+x] = scc_led_actual[x];
            else
            begin 
              if (USE_ALT_LED_SOURCE == 0 && RWMASK[i*32+x] && i == 1)
                cfg_regs_actual[i*32+x] = cfg_regs_apb[i*32+x];
              else
                cfg_regs_actual[i*32+x] = cfg_regs_serial[i*32+x];
            end
          end
        end        
      end
    end
    else
    begin
      for (x=0;x<32;x=x+1) 
      begin
        if (EXTRMASK[i*32+x])   // Check the read from external signal
          cfg_regs_actual[i*32+x] = CFGREG_IN[i*32+x]; 
        else
        begin 
          if (USE_ALT_LED_SOURCE != 0 && i == 1)
            cfg_regs_actual[i*32+x] = scc_led_actual[x];
          else
            cfg_regs_actual[i*32+x] = cfg_regs_serial[i*32+x];
        end
      end
    end
  end
end


assign DLL_LOCK_EN = scc_dlllock_serial[31:24];
assign LOCKED = & (DLL_LOCKED | ~DLL_LOCK_EN);
assign scc_dlllock_actual = {DLL_LOCK_EN,DLL_LOCKED,15'b0,LOCKED};

generate if (USE_ALT_LED_SOURCE != 0) begin: USE_ALT_LED_SOURCE_gen_0 
  assign scc_led_actual = {24'b0,ALT_LED_SOURCE};
end else begin
  assign scc_led_actual = {24'b0,scc_led_apb};
end
endgenerate

assign scc_sw_actual  = scc_sw_serial;
assign scc_aid_actual = scc_aid_serial;
assign scc_id_actual  = scc_id_serial;

generate if (APBLOCK != 0) begin: APBLOCK_gen_6
  assign scc_apblock_actual = {{15-CFG_REGS{1'b0}},cfg_regs_apblock,apbunlocked, scc_apblock_apb[15:0]};
end else begin
  assign scc_apblock_actual = 32'h00000000;
end
endgenerate

assign SWITCH_OUTPUT = scc_sw_actual[7:0];

assign CFGREG_OUT = cfg_regs_actual;

assign scc_syscfgctrl_actual = scc_syscfgctrl_apb;

assign scc_syscfgstat_actual = scc_syscfgstat_serial;

`ifdef SIMULATION

// -----------------------------------------------------------------------------
// TUBE register for simulation - write only
// -----------------------------------------------------------------------------

/* pragma translate_off */ 

  wire             tubeselected;
  assign tubeselected = PSEL & PWRITE & PENABLE & (PADDR == 12'h040);

  integer          stringlength;
  reg [7:0]        tubestring [99:0];
  reg [7:0]        text_char;
  integer          j;
  
  //Configure timestamp format
  initial
     $timeformat(-9,0," ns",14);

always @ (posedge PCLK or negedge PRESETn)
begin: p_tube
  if (PRESETn == 1'b0)
    begin
    stringlength <= 0;
    end
  else
    if ((PSEL & PWRITE & PENABLE) == 1'b1)
      if (PADDR == 12'h040)
        begin
        if  (PWDATA[7:0]==8'h04) // Stop simulation if 0x04 is received
          $stop;
        else if ((PWDATA[7:0]==13)|(PWDATA[7:0]==10))
    // New line
    begin
    tubestring[stringlength] = 8'h00;
    $write("%t TUBE: ",$time);

    for (i=0; i<= stringlength-1; i=i+1) 
      begin
      text_char = tubestring[i];
      $write("%s",text_char);
      end
      
    $write("\n");
    stringlength = 0;
    end
          //$write ("%c", PWDATA[7:0]);  
        else
    begin
    tubestring[stringlength] = PWDATA[7:0];
    stringlength = stringlength + 1;
    if (stringlength >79) // line too long, display and clear buffer
      begin
      tubestring[stringlength] = 8'h00;
      $write("%t TUBE: ",$time);
    
      for (i=0; i<= stringlength; i=i+1) 
        begin
        text_char = tubestring[i];
        $write("%s",text_char);
        end
      
      $write("\n");
      stringlength = 0;

      end
      
    end
    
  end
          
end // p_TUBE
/* pragma translate_on */ 
`endif
endmodule