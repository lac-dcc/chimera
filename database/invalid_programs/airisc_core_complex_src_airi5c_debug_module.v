//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File             : airi5c_debug_module.v
// Author           : A. Stanitzki
// Creation Date    : 09.10.20
// Last Modified    : Tue 18 Jan 2022 10:02:13 AM CET
// Version          : 1.0
// Abstract         : Debug module implementation according to the external debug support spec 

`include "airi5c_hasti_constants.vh"
`include "airi5c_ctrl_constants.vh"
`include "airi5c_csr_addr_map.vh"
`include "airi5c_arch_options.vh"
`include "airi5c_dmi_constants.vh"
`include "rv32_opcodes.vh"

module airi5c_debug_module(
   input rst_ni,
   input clk_i,

   // ================================
   // = Debug Module Interface (DMI) =
   // ================================
   //
   // Interface to the JTAG-TAP or other means of transport (e.g. serial)
   //

   input                                 dmi_en_i,      // enable (for read or write)
   input         [`DMI_ADDR_WIDTH-1:0]   dmi_addr_i,    // addr of target register within Debug Module (DM)
   output  reg   [`DMI_WIDTH-1:0]        dmi_rdata_o,   // data from DM to JTAG-TAP
   output                                dmi_error_o,   // error signalin from DM to JTAG-TAP
   input         [`DMI_WIDTH-1:0]        dmi_wdata_i,   // data from JTAG-TAP to DM
   input                                 dmi_wen_i,     // write enable
   output  reg                           dmi_dm_busy_o, // busy signaling from DM to JTAG-TAP

   // ===================================
   // = Processor register access ports =
   // ===================================
   //
   // interface to general purpose (gpr) register file

   output  reg                           dm_regfile_wen,  // write enable
   output  reg  [`REG_ADDR_WIDTH-1:0]    dm_regfile_wara, // write/read register address
`ifdef ISA_EXT_F
   output  reg                           dm_sel_fpu_reg,  // switch between float and int registers
`endif
   output  reg  [`XPR_LEN-1:0]           dm_regfile_wd,   // write data
   input        [`XPR_LEN-1:0]           dm_regfile_rd,   // read data

   // interface to control and status register (csr) file
   input                                 dm_illegal_csr_access, // illegal access (not existing, prohibited etc.) signaling; unused/not implemented
   output  reg  [`CSR_ADDR_WIDTH-1:0]    dm_csr_addr,           // register addr (see csr_addr_map header file)
   output  reg  [`CSR_CMD_WIDTH-1:0]     dm_csr_cmd,            // command (100 = read, 101 = write, others are bit-set / -unset
   output  reg  [`XPR_LEN-1:0]           dm_csr_wdata,          // data from DM to CSR
   input        [`XPR_LEN-1:0]           dm_csr_rdata,          // data from CSR to DM

   // ===============
   // = Run control =
   // ===============

   // run control signals for individual harts
   output                                dm_hart0_haltreq,     // halt request interrupt to core
   output                                dm_hart0_resumereq,   // resume request to core (memory mapped)
   input                                 dm_hart0_halted,      // core signals it has been halted (memory mapped)
   output                                dm_hart0_ndmreset,
   output  reg                           dm_hart0_postexecreq, // request execution of the program buffer
   input                                 dm_hart0_resumeack,   // hart0 acknoledges it is about to resume...

   // single instruction debug program buffer output
   output       [`XPR_LEN-1:0]           dm_hart0_progbuf0,    // memory mapped into debug ROM
   output       [`XPR_LEN-1:0]           dm_hart0_progbuf1,
                                        
   // ====================
   // = DM Debug signals =
   // ====================

   output       [3:0]                    dm_state_out,       // 4-bit output for debug purposed (e.g. drive LEDs)

   input                                 testmode            // Test Enable in ATPG
);
      
// DMI error signaling

assign dmi_error_o    = 1'b0;                                     // we don't currently handle errors
wire   hart0_halted = dm_hart0_halted;

// =====================
// = DM core registers =
// =====================

reg   [`DMI_WIDTH-1:0]   data0;        // data0,        0x04
reg   [`DMI_WIDTH-1:0]   dmcontrol;    // dmcontrol,    0x10
reg   [`DMI_WIDTH-1:0]   dmstatus;     // dmstatus,     0x11
reg   [`DMI_WIDTH-1:0]   hartinfo;     // hartinfo,     0x12
reg   [`DMI_WIDTH-1:0]   abstractcs;   // abstractcs,   0x16
reg   [`DMI_WIDTH-1:0]   command;      // command,      0x17
reg   [`DMI_WIDTH-1:0]   abstractauto; // abstractauto, 0x18
reg   [`DMI_WIDTH-1:0]   progbuf0;     // progbuf0,     0x20
reg   [`DMI_WIDTH-1:0]   progbuf1;     // progbuf1,     0x21
//reg   [`DMI_WIDTH-1:0]   authdata;     // authdata,     0x30  not yet implemented

// forward progbuf0/1 to debug_rom
assign  dm_hart0_progbuf0 = progbuf0;
assign  dm_hart0_progbuf1 = progbuf1;

// named fields of abstractcs
//wire  [4:0]   progbufsize = abstractcs[28:24]; not yet implemented
//wire          busy        = abstractcs[12]; not yet implemented
//wire          relaxedpriv = abstractcs[11]; not yet implemented
//wire  [2:0]   cmderr      = abstractcs[10:8]; not yet impelemented
//wire  [3:0]   datacount   = abstractcs[3:0]; not yet impelemented

// named fields of dmcontrol
wire          haltreq      = dmcontrol[31];        // halt request for selected harts
wire          resumereq    = dmcontrol[30];        // resume request for selected harts
//wire          hartreset    = dmcontrol[29];        // reset request for selected harts; not used
//wire          ackhavereset = dmcontrol[28];        // acknolege of "havereset" for selected harts; not used
//wire          hasel        = dmcontrol[26];        // hart selection mode (0 = single, 1 = multiple selected); not used
wire  [9:0]   hartsel      = dmcontrol[25:16];     // index of selected hart
wire          ndmreset     = dmcontrol[1];         // reset system excluding debug module
//wire          dmactive     = dmcontrol[0];         // reset for debug module, not yet handled; not used

assign  dm_hart0_ndmreset  = testmode | ~ndmreset; // THE SYSTEM USES A NEGATIVE ASSERTED RESET! THE INVERSION HAPPENS HERE!!!
assign  dm_hart0_haltreq   = haltreq;              // right now only single haltreq in singlecore implementation...
assign  dm_hart0_resumereq = resumereq;            // only single resumereq in singlecore implementation...

// Fields of the dmstatus register

//wire          ndmresetpending = dmstatus[24]; not used
//wire          stickyunavail   = dmstatus[23]; not used
//wire          impebreak       = dmstatus[22]; not used
//wire          allhavereset    = dmstatus[19]; not used
//wire          anyhavereset    = dmstatus[18]; not used 
//wire          allresumeack    = dmstatus[17]; not used
//wire          anyresumeack    = dmstatus[16]; not used
//wire          allnonexistent  = dmstatus[15]; not used
//wire          anynonexistent  = dmstatus[14]; not used
//wire          allunavail      = dmstatus[13]; not used
//wire          anyunavail      = dmstatus[12]; not used
//wire          allrunning      = dmstatus[11]; not used
//wire          anyrunning      = dmstatus[10]; not used
wire          allhalted       = dmstatus[9];
//wire          anyhalted       = dmstatus[8]; not used
//wire          authenticated   = dmstatus[7]; not used
//wire          authbusy        = dmstatus[6]; not used
//wire          hasresethaltreq = dmstatus[5]; not used
//wire          confstrptrvalid = dmstatus[4]; not used
//wire   [3:0]  version         = dmstatus[3:0]; not used

// -------------------

// =======================================
// ==    DMI state machine               =
// ==                                    =
// == This handles the parallel DMI bus  =
// =======================================

reg   [7:0]             dmi_state, dmi_state_next;

reg   [`DMI_WIDTH-1:0]  rdata_r;

wire                    dm_command_received;
assign  dm_command_received = (dmi_state == `DMI_STATE_IDLE) && (dmi_wen_i & dmi_en_i) && (dmi_addr_i == `DMI_ADDR_COMMAND);

wire   dm_autoexec;
assign dm_autoexec = ((dmi_state  == `DMI_STATE_IDLE) & dmi_en_i) && 
                     ( ((dmi_addr_i == `DMI_ADDR_DATA0) && (abstractauto[0] == 1'b1))     ||
                       ((dmi_addr_i == `DMI_ADDR_PROGBUF0) && (abstractauto[16] == 1'b1)) ||
                       ((dmi_addr_i == `DMI_ADDR_PROGBUF1) && (abstractauto[17] == 1'b1))  );

always @(posedge clk_i or negedge rst_ni) begin
   if(~rst_ni) begin
      dmi_state   <= `DMI_STATE_IDLE;
      dmi_dm_busy_o <= 1'b0;
      dmi_rdata_o   <= 0;
   end
   else begin   
      dmi_state <= dmi_state_next;

      if((dmi_state == `DMI_STATE_IDLE) & dmi_en_i) 
        dmi_rdata_o <= rdata_r;

      if(dmi_state_next == `DMI_STATE_IDLE)
//      if(dmi_state == `DMI_STATE_IDLE)
        dmi_dm_busy_o <= 1'b0;
      else
        dmi_dm_busy_o <= 1'b1;
      end
end

always @(*) begin
   dmi_state_next = `DMI_STATE_IDLE;
   case (dmi_state) 
      `DMI_STATE_IDLE    : begin 
                             dmi_state_next = dmi_en_i ? `DMI_STATE_WAITEND : `DMI_STATE_IDLE;
                           end
      `DMI_STATE_WAITEND : begin 
                             dmi_state_next = dmi_en_i ? `DMI_STATE_WAITEND : `DMI_STATE_IDLE;
                           end
   endcase
end

always @* begin
   rdata_r = 32'hdeaddead;
   case(dmi_addr_i)
      `DMI_ADDR_ABSTRACTAUTO : begin rdata_r = abstractauto; end
      `DMI_ADDR_ABSTRACTCS   : begin rdata_r = abstractcs; end
      `DMI_ADDR_COMMAND      : begin rdata_r = command; end
      `DMI_ADDR_DATA0        : begin rdata_r = data0; end
      `DMI_ADDR_CONFSTRPTR0  : begin rdata_r = 0; end           
      `DMI_ADDR_DMCONTROL    : begin rdata_r = dmcontrol; end 
      `DMI_ADDR_DMSTATUS     : begin rdata_r = dmstatus; end  
      `DMI_ADDR_HAWINDOW     : begin rdata_r = 0; end            // hawindow is not implemented
      `DMI_ADDR_HAWINDOWSEL  : begin rdata_r = 0; end            // hawindowsel is not implemented.
      `DMI_ADDR_PROGBUF0     : begin rdata_r = progbuf0; end
      `DMI_ADDR_PROGBUF1     : begin rdata_r = progbuf1; end
      `DMI_ADDR_HARTINFO     : begin rdata_r = hartinfo; end
      `DMI_ADDR_SBCS         : begin rdata_r = 0; end
       default               : begin rdata_r = 0; end
   endcase
end

// =============================================
// ==    Debug Module state machine            =
// =============================================

reg    [3:0]   dm_state;
reg    [3:0]   dm_state_next;

wire   [7:0]   dm_command;  assign dm_command  = command[31:24];
wire   [2:0]   dm_size;     assign dm_size     = command[22:20];

wire           dm_postexec; assign dm_postexec = command[18];
wire           dm_transfer; assign dm_transfer = command[17];
wire           dm_write;    assign dm_write    = command[16];

wire           dm_regfile_access; assign dm_regfile_access = command[12]; // GPRs start at 0x1000
//wire           dm_csr_access;     assign dm_csr_access = ~command[12];    // CSRs start at 0x0000; not used

wire   [15:0]  dm_regno;    assign dm_regno    = command[15:0];

wire   dm_size_invalid;     assign dm_size_invalid = ~(dm_size == 3'h2);
//wire   dm_wr_reg_while_running;   
//assign dm_wr_reg_while_running = (dm_regfile_access & dm_transfer & dm_write & ~allhalted); not used

reg    [2:0]   errorcode;

always @(posedge clk_i or negedge rst_ni)
begin
  if(~rst_ni) begin
    dm_state <= `DM_STATE_RESET;
  end else begin
    dm_state <= dm_state_next;
  end
end

always @*
begin
   dm_state_next   = `DM_STATE_IDLE;

   // signals to gpr file
   dm_regfile_wara = `REG_ADDR_WIDTH'd0;
   dm_regfile_wen  = 1'b0;
   dm_regfile_wd   = `XPR_LEN'h0;
`ifdef ISA_EXT_F
   dm_sel_fpu_reg  = 1'b0;
`endif

   // signals to csr file
   dm_csr_addr  = `CSR_ADDR_WIDTH'd834;
   dm_csr_cmd   = `CSR_IDLE;
   dm_csr_wdata = `XPR_LEN'h0;

   dm_hart0_postexecreq = 1'b0;
   hartinfo     = {8'h0,4'h0,3'h0,1'b1,4'h1,12'h43};   
   errorcode    = 3'h0;  

   case(dm_state)
      `DM_STATE_RESET :   begin
                            dm_state_next = `DM_STATE_IDLE;
                          end
      `DM_STATE_IDLE :    begin
                            dm_state_next = (dm_command_received | dm_autoexec) ? `DM_STATE_DECODE : `DM_STATE_IDLE;          
                          end
      `DM_STATE_DECODE :  begin
        case(dm_command)
          `DM_CMD_ACCESSREG : begin
            if(dm_transfer) begin
              if(dm_size_invalid) begin
                dm_state_next = `DM_STATE_ERROR_NOTSUPP;
              end else begin
                dm_state_next = dm_write ? `DM_STATE_ACCESSREG_W :
                                           `DM_STATE_ACCESSREG_R;
              end
            end else begin
              dm_state_next = dm_postexec ? `DM_STATE_POSTEXEC : 
                                            `DM_STATE_IDLE;
            end
          end
          
          default         : dm_state_next = `DM_STATE_ERROR_NOTSUPP;
        endcase 
                                   end
      `DM_STATE_ACCESSREG_R :      begin    // read gpr
                                      dm_state_next   = dm_postexec ? `DM_STATE_POSTEXEC : `DM_STATE_IDLE;        
                                      dm_regfile_wara = dm_regno[4:0];  // GPRs are mapped to 0x1000 - 0x101f
                                   `ifdef ISA_EXT_F
                                      dm_sel_fpu_reg  = dm_regno[5];
                                   `endif
                                      dm_regfile_wen  = 1'b0;
                                      dm_regfile_wd   = data0;      
                                      dm_csr_addr     = dm_regno[11:0];
                                      dm_csr_cmd      = `CSR_READ;   
                                   end
      `DM_STATE_ACCESSREG_W :      begin    // write gpr
                                      dm_state_next   = dm_postexec ? `DM_STATE_POSTEXEC : `DM_STATE_IDLE;
                                      dm_regfile_wara = dm_regno[4:0]; // GPRs are mapped to 0x1000 - 0x101f
                                   `ifdef ISA_EXT_F
                                      dm_sel_fpu_reg  = dm_regno[5];
                                   `endif
                                      dm_regfile_wen  = dm_regno[12] ? 1'b1 : 1'b0;
                                      dm_regfile_wd   = data0;
                                      dm_csr_addr     = dm_regno[11:0];
                                      dm_csr_cmd      = dm_regno[12] ? `CSR_IDLE : `CSR_WRITE;
                                      dm_csr_wdata    = data0;
                                   end
      `DM_STATE_POSTEXEC    :      begin    // run program buffer once
                                      dm_hart0_postexecreq = 1'b1;
                                      dm_state_next        = `DM_STATE_IDLE;
                                      dm_csr_cmd           = `CSR_IDLE;         
                                   end
      `DM_STATE_ERROR_BUSY  :      begin
                                      errorcode     = 3'h1;
                                      dm_state_next = `DM_STATE_IDLE;
                                      dm_csr_cmd    = `CSR_IDLE;
                                   end
      `DM_STATE_ERROR_NOTSUPP :    begin
                                      errorcode     = 3'h2;
                                      dm_state_next = `DM_STATE_IDLE;
                                      dm_csr_cmd    = `CSR_IDLE;
                                   end
      `DM_STATE_ERROR_EXCEPT :     begin
                                      errorcode     = 3'h3;
                                      dm_state_next = `DM_STATE_IDLE;
                                      dm_csr_cmd    = `CSR_IDLE;
                                   end
      `DM_STATE_ERROR_HALTRESUME : begin
                                      errorcode     = 3'h4;
                                      dm_state_next = `DM_STATE_IDLE;
                                      dm_csr_cmd    = `CSR_IDLE;
                                   end
      `DM_STATE_ERROR_OTHER :      begin
                                      errorcode     = 3'h7;
                                      dm_state_next = `DM_STATE_IDLE;
                                      dm_csr_cmd    = `CSR_IDLE;
                                   end
   endcase
end

// write Debug Module registers in various situations
reg had_postexec;

always @(posedge clk_i or negedge rst_ni)
begin
  if(~rst_ni) begin
    dmstatus    <= {7'h0,1'b0,1'b0,1'b1,2'h0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,4'h2};
    abstractcs  <= {3'h0,5'h2,11'h0,1'b0,1'b0,3'h0,4'h0,4'h1}; 
    dmcontrol   <= `XPR_LEN'h00000000;
    data0       <= `XPR_LEN'hbabebabe;
    command     <= `XPR_LEN'h0000;
    progbuf0    <= `XPR_LEN'h13;        // init Progbuf with NOP.
    progbuf1    <= `XPR_LEN'h13;
    abstractauto<= `XPR_LEN'h0;
    had_postexec<= 1'b0;
  end
  else begin
    dmstatus[19] <= ndmreset;               // allhavereset
    dmstatus[18] <= ndmreset;               // anyhavereset
    dmstatus[17] <= dm_hart0_resumeack;     // allresumeack
    dmstatus[16] <= dm_hart0_resumeack;     // anyresumeack
    dmstatus[15] <= |hartsel ? 1'b1 : 1'b0; // allnonexistent
    dmstatus[14] <= |hartsel ? 1'b1 : 1'b0; // anynonexistent
    dmstatus[13] <= 1'b0;                   // allunavail
    dmstatus[12] <= 1'b0;                   // anyunavail
    dmstatus[11] <= ~hart0_halted;          // anyrunning
    dmstatus[10] <= ~hart0_halted;          // allrunning
    dmstatus[9]  <= hart0_halted;           // allhalted
    dmstatus[8]  <= hart0_halted;           // anyhalted
                
    if((dmi_state == `DMI_STATE_IDLE) & dmi_wen_i & dmi_en_i) begin         // write due to DMI bus write access
      case (dmi_addr_i) 
        `DMI_ADDR_DATA0   : data0 <= dmi_wdata_i;
        `DMI_ADDR_DMCONTROL : begin             
                dmcontrol[31:27] <= dmi_wdata_i[31:27];
                dmcontrol[1:0] <= dmi_wdata_i[1:0];
                end 
        `DMI_ADDR_DMSTATUS  : begin 
        end
        `DMI_ADDR_COMMAND : command <= dmi_wdata_i;
        `DMI_ADDR_ABSTRACTCS  : begin
                if(|dmi_wdata_i[10:8]) abstractcs[10:8] <= 3'b000; // clear cmderr is the only write operation allowed to abstractcs
                  abstractcs[11] <= 1'b1;                        // relaxedpriv WARL, but we only support 1.
                end
        `DMI_ADDR_PROGBUF0  : progbuf0 <= dmi_wdata_i;
        `DMI_ADDR_PROGBUF1  : progbuf1 <= dmi_wdata_i;
        `DMI_ADDR_ABSTRACTAUTO  : abstractauto <= dmi_wdata_i;
      endcase
    end
    else if(dm_state == `DM_STATE_ACCESSREG_R) begin      
      data0 <= dm_regfile_access ? dm_regfile_rd : dm_csr_rdata;
    end
    else if(dm_state >= `DM_STATE_ERROR_BUSY) begin         // signal error as soon as we enter error state. Hold flag until cleared.
      abstractcs[10:8] <= errorcode; // set cmderr field
    end
    else if(dm_state == `DM_STATE_POSTEXEC) begin
      had_postexec <= 1'b1;
    end
    else if(dm_state == `DM_STATE_ACCESSREG_W) begin
      had_postexec <= 1'b0;
    end
    // set/clear busy flag when leaving/entering idle state
    if(dm_state_next == `DM_STATE_IDLE) begin
       dmcontrol[0] <= 1'b1;
       abstractcs[12] <= 1'b0;
    end else begin
       abstractcs[12] <= 1'b1;
    end
  end
end

assign dm_state_out = {1'b0,abstractauto[1:0],had_postexec};

endmodule
