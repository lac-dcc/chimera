//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-04-10 15:07:36 +0100 (Wed, 10 Apr 2013) $
//
//      Revision            : $Revision: 243494 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//     Simple Coresight trace capture module for System Design Kit
//-----------------------------------------------------------------------------
//
//     A simple module to capture data from a [1,2,4] bit trace port or SWV
//
//     Provides 1k bytes of buffer for trace (not circular buffer, fills once)
//
//     Trace stream is not decompressed, but synchronisation is detected
//     and discarded
//     Valid data is read word at a time.
//     No valid data is indicated as a sync packet 0xFFFFFFFE
//
//     It is assumed that HCLK can be used as a sampling clock for
//     the data inputs. Typically, this requires HCLK=TRACECLKIN*2.
//     If used with a free-running clock for the debug_tester, some
//     degree of phase synchronisation will be required.
//
//     TRACECLK is sampled to check integration in this example.
//
//     Memory Map (only supports word accesses, not AHB compliant)
//     0x0000 - {000,prescaler[12:0],0000_0000_00,port_mode[1:0],port_size[3:0]} (R/W)
//              Note: prescaler function not available in this version.
//     0x0004 - TraceData (Read, poping)
//     0x0008 - Buffer Depth
//     0x000C - Reserved
//     0x0010 - Reserved
//     0x0014 - Status
//              [0] -
//              [1] -
//              [2] -
//              [3] - Full
//              [4] - Serial encode error
//              [8] - Not synchronised
//
// A write to 0x0000 will clear current status, capturing stops when and
// of status bits[3:1] are set
//-----------------------------------------------------------------------------

module cmsdk_debug_tester_trace_capture #(
  //---------------------------------------------------------------------------
  //   Capture trace log file
  //---------------------------------------------------------------------------
`ifdef ARM_CMSDK_INCLUDE_TPIU_LOGFILE
  // For ARM internal verification
  parameter        LOGFILE = "log.tpiu")
`else
  parameter        LOGFILE = "")
`endif
  (
   input  wire          HCLK,       // System clock
   input  wire          HRESETn,    // System reset
   input  wire          HSEL,       // AHB slave selected
   input  wire [10:0]   HADDR,      // AHB transfer address
   input  wire          HWRITE,     // AHB transfer direction
   input  wire [1:0]    HTRANS,     // AHB transaction type
   input  wire [2:0]    HSIZE,      // AHB transfer size
   input  wire [31:0]   HWDATA,     // AHB write data bus
   input  wire          HREADY,     // AHB bus ready
   input  wire          TRACECLK,   // Traceport Clock (used as data)
   input  wire [3:0]    TRACEDATA,  // Data for Traceport
   input  wire          SWV,        // Asynchronous trace data
   // Outputs
   output wire          HREADYOUT,  // AHB slave ready
   output wire          HRESP,      // AHB response
   output wire [31:0]   HRDATA);    // AHB read data bus

//-----------------------------------------------------------------------------
// Signal declarations
//-----------------------------------------------------------------------------

  reg [10:0]    ahb_addr_reg;    // address for use in data phase
  reg [12:0]    prg_prescale;    // Prescale register for async modes
  reg           prg_nrz;
  reg           prg_man;
  reg [3:0]     prg_port_size;
  reg [9:0]     trace_wp;
  wire [9:0]    nxt_trace_wp;
  reg [31:0]    trace_read;
  wire [31:0]   nxt_trace_read;

  reg [9:0]     trace_rp;
  wire [9:0]    nxt_trace_rp;
  reg [31:0]    trace_data [0:1023];
  reg           stat_encode_err;

  reg  [4:0]    sync_high_count;

  wire [4:0]    nxt_sync_high_count;
  integer       log_file;
  reg           sync_state;
  reg           buffer_full;    //Indicate the buffer overflow

// Buffer overflow generation. the depth of the trace data buffer is now 1024, once
// the trace write address reach this maximum address, the buffer_full signal will be
// generated and will only return to 0 after reset.
  always @(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) begin
      buffer_full <= 1'b0;
    end
    else if (trace_wp == 10'h3ff) begin
      buffer_full <= 1'b1;
    end
  end

//-----------------------------------------------------------------------------
// Simplified AHB Interface
//-----------------------------------------------------------------------------
  wire  nxt_ahb_acc   = HREADY & HSEL & HTRANS[1];
  reg   ahb_acc;
  reg   ahb_write_reg;

  always @(posedge HCLK or negedge HRESETn)
    if(~HRESETn)
      ahb_acc <= 1'b0;
    else
      ahb_acc <= nxt_ahb_acc;

  always @(posedge HCLK or negedge HRESETn)
    if(~HRESETn)
      begin
        ahb_addr_reg  <= {11{1'b0}};
        ahb_write_reg <= 1'b0;
      end
    else if (HREADY & HSEL)
      begin
        ahb_addr_reg  <= HADDR;
        ahb_write_reg <= HWRITE;
      end

  wire prg_ctl_addr    = ahb_addr_reg == 11'b000_0000_0000; // 0x000
  wire prg_data_read   = ahb_addr_reg == 11'b000_0000_0100; // 0x004
  wire prg_count_read  = ahb_addr_reg == 11'b000_0000_1000; // 0x008
  wire prg_stat_read   = ahb_addr_reg == 11'b000_0001_0100; // 0x014

  //---------------------------------------------------------------------------
  //   Control Register - Default to trace port, 4 bits
  //---------------------------------------------------------------------------
  wire prg_ctl_write = prg_ctl_addr & ahb_write_reg & ahb_acc;

  always @(posedge HCLK or negedge HRESETn)
    if(~HRESETn)
      begin
        prg_prescale  <= {13{1'b0}};
        prg_nrz       <= 1'b0;
        prg_man       <= 1'b0;
        prg_port_size <= 4'b1000;
      end
    else if (prg_ctl_write)
      begin
        prg_prescale  <= HWDATA[28:16];
        prg_nrz       <= HWDATA[5];
        prg_man       <= HWDATA[4];
        prg_port_size <= HWDATA[3:0];
      end

//-----------------------------------------------------------------------------
// AHB register read mux
//-----------------------------------------------------------------------------

  wire [31:0] rdata  = ({32{prg_ctl_addr}} & {3'b000, prg_prescale, 8'h00,
                                              2'b00, prg_nrz, prg_man,
                                              prg_port_size}) |
                       ({32{prg_data_read}} & trace_read) |
                       ({32{prg_count_read}} & {{22{1'b0}},trace_wp})|
                       ({32{prg_stat_read}} & {{23{1'b0}},~sync_state,
                                                3'b000,stat_encode_err,buffer_full,3'b000});

  assign      HRDATA =  rdata;

//-----------------------------------------------------------------------------
// AHB tie offs
//-----------------------------------------------------------------------------
  assign      HREADYOUT = 1'b1;        // All accesses to capture block are zero-wait
  assign      HRESP     = 1'b0;        // Generate OK responses only


//-----------------------------------------------------------------------------
// Serial mode decode
//-----------------------------------------------------------------------------
  reg [2:0]   bit_count;
  reg         started;
  reg         stop_bit;
  wire [3:0]  nxt_bit_count;
  wire        nxt_started;
  wire        nxt_stop_bit;
  reg  [3:0]  serial_buffer;
  wire [3:0]  nxt_serial_buffer;
  reg         encode;
  wire        nxt_encode;
  reg         swv_reg;
  reg         man_running;
  wire        nxt_man_running;
  wire        encode_err;

  assign encode_err = ((~prg_ctl_write) & (((~SWV) ^ swv_reg) & (~encode) & started & prg_man & (bit_count != 3'b001)))
                      | (stop_bit & (~SWV) & prg_nrz);

  assign nxt_started = (started | (prg_nrz & (~SWV)) | (prg_man & SWV)) & ((~stop_bit) | (prg_man & SWV));
  assign nxt_man_running = (bit_count[2] | man_running) & (~stop_bit);

  assign nxt_stop_bit  = ((bit_count == 3'b111) & prg_nrz) | (started & (~encode) & (~SWV) & (~swv_reg));
  assign nxt_bit_count = ({3{started & (~stop_bit)}}) & (bit_count + {2'b00,prg_nrz | encode});
  assign nxt_encode = started & (prg_nrz | (~encode));
  assign nxt_serial_buffer = (encode | prg_nrz) ? {SWV,serial_buffer[3:1]} : serial_buffer;

  always@(posedge HCLK or negedge HRESETn)
    if(~HRESETn)
      begin
        started   <= 1'b0;
        stop_bit  <= 1'b0;
        encode    <= 1'b0;
        bit_count <= 3'b000;
        serial_buffer <= 4'b0000;
        swv_reg   <= 1'b0;
        man_running <= 1'b0;
        stat_encode_err <= 1'b0;
      end
    else
      begin
        started   <= nxt_started;
        stop_bit  <= nxt_stop_bit;
        encode    <= nxt_encode;
        bit_count <= nxt_bit_count[2:0];
        serial_buffer <= nxt_serial_buffer;
        swv_reg   <= SWV;
        man_running <= nxt_man_running;
        stat_encode_err <= encode_err;
      end


  wire serial_valid = (encode | prg_nrz ) &
      ((bit_count == 3'b100) | (stop_bit & prg_nrz) | ((bit_count == 3'b000) & prg_man & man_running));

//-----------------------------------------------------------------------------
// Synch Detect
//-----------------------------------------------------------------------------
  wire [3:0] trace_in;

  reg [3:0]  sync_ctl;
  wire       sync_full;
  wire       sync_half;
  wire       sync_stop;
  wire       nxt_sync_state;
  wire trace_msb = ((prg_port_size == 4'b0001) & TRACEDATA[0] & (~(prg_nrz | prg_man))) |
                     ((prg_port_size == 4'b0100) & TRACEDATA[1] & (~(prg_nrz | prg_man))) |
                       ((prg_port_size == 4'b1000) & TRACEDATA[3] & (~(prg_nrz | prg_man))) |
       ((prg_nrz | prg_man) & serial_buffer[3]);

  assign trace_in = (prg_nrz | prg_man) ? serial_buffer : TRACEDATA;

  // Assume trace data is aligned to port, end of sync is always at bit[0]
  // Only count if legal port_size
  // Bit[3] used to reset
  always @(prg_port_size or trace_in or trace_msb or prg_nrz or prg_man)
    case ({trace_msb,{prg_nrz | prg_man,3'b000} | ({4{(~(prg_nrz | prg_man))}} & prg_port_size)})
      5'b00001 : sync_ctl = 4'b1000;
      5'b10001 : sync_ctl = 4'b0001;
      5'b00010 : sync_ctl = trace_in[0] ? 4'b1001 : 4'b1000;
      5'b10010 : sync_ctl = trace_in[0] ? 4'b0010 : 4'b1000;
      5'b01000 : sync_ctl = (&trace_in[2:0]) ? 4'b1011 : 4'b1000;
      5'b11000 : sync_ctl = (&trace_in[2:0]) ? 4'b0100 : 4'b1000;
        default: sync_ctl = 4'bXXXX;
    endcase

  wire [5:0] sync_add = (sync_high_count + sync_ctl[2:0]);
  assign nxt_sync_high_count = sync_ctl[3] ? {5{1'b0}} : sync_add[4:0];
  assign sync_full = (sync_add == 5'h1F) & (~trace_msb);
  assign sync_half = (sync_add >= 5'h0F) & (~trace_msb);
  // Loosing sync is not expected and will cause an error at un-formatting
  assign sync_stop = (sync_add == 5'h1F) & trace_msb;
  assign nxt_sync_state = (sync_full | sync_state | prg_nrz | prg_man) & (~sync_stop);

  always @(posedge HCLK or negedge HRESETn)
    if(~HRESETn)
      begin
        sync_high_count <= {5{1'b0}};
      end
    else if ((~(prg_nrz | prg_man)) | serial_valid)
      begin
        sync_high_count <= nxt_sync_high_count;
      end

  //---------------------------------------------------------------------------
  //   Data Pack
  //---------------------------------------------------------------------------
  reg  [32:0] capture_buffer;
  reg  [32:0] nxt_capture_buffer;
  wire [2:0]  capture_control;
  wire [31:0] buffer_data  = capture_buffer[32:1];
  wire        buffer_valid = capture_buffer[0];


  assign capture_control = {3{((~sync_full) & sync_state)}} & // reset state
                           ({prg_port_size[3] | prg_nrz | prg_man,
                             {2{(~(prg_nrz | prg_man))}} & prg_port_size[1:0]} |
                            {3{sync_half}});               // shift back


  always @(capture_control or trace_in or capture_buffer or buffer_valid)
    case (capture_control)
      3'b000: nxt_capture_buffer = {1'b1,{32{1'b0}}};
      3'b001: nxt_capture_buffer = buffer_valid ?
                                   {trace_in[0],1'b1,{31{1'b0}}} :
                                   {trace_in[0],capture_buffer[32:1]};
      3'b010: nxt_capture_buffer = buffer_valid ?
                                   {trace_in[1:0],1'b0,{30{1'b0}}} :
                                   {trace_in[1:0],capture_buffer[32:2]};
      3'b100: nxt_capture_buffer = buffer_valid ?
                                   {trace_in[3:0],1'b1,{28{1'b0}}} :
                                   {trace_in[3:0],capture_buffer[32:4]};
      3'b111: nxt_capture_buffer = {capture_buffer[20:0],{12{1'b0}}};
      default: nxt_capture_buffer = {33{1'bX}};
    endcase

  assign nxt_trace_wp = buffer_valid ? (trace_wp + 9'b000000001) : trace_wp;
  assign nxt_trace_rp = (prg_data_read & ahb_acc &
                         (trace_rp != trace_wp)) ?
                          (trace_rp + 9'b000000001) : trace_rp;
  assign nxt_trace_read = (trace_wp == trace_rp) ? 32'h7FFFFFFF : trace_data[trace_rp];

  always @(posedge HCLK or negedge HRESETn)
    if(~HRESETn)
      begin
        capture_buffer <= {33{1'b0}};
        trace_wp       <= {10{1'b0}};
      end
    else if ((~(prg_nrz | prg_man)) | serial_valid)
      begin
        capture_buffer <= nxt_capture_buffer;
        trace_wp       <= nxt_trace_wp;
      end

  always @(posedge HCLK or negedge HRESETn)
    if(~HRESETn)
      begin
        trace_rp       <= {10{1'b0}};
        trace_read     <= {32{1'b0}};
        sync_state     <= 1'b0;
      end
    else
      begin
        trace_rp       <= nxt_trace_rp;
        trace_read     <= nxt_trace_read;
        sync_state     <= nxt_sync_state;
      end

  // Capture RAM
  always @(posedge HCLK)
    if(buffer_valid)
      begin
        trace_data[trace_wp] <= buffer_data;
      end


  //---------------------------------------------------------------------------
  //   Generate log file dump
  //---------------------------------------------------------------------------
  initial
    begin
      $write("DBG: ---------------------------------------------------------\n");
      $write("DBG: TracePort Logger\n");
      $write("DBG: (C) COPYRIGHT 2010-2013 ARM Limited - All Rights Reserved\n");
      $write("DBG: ---------------------------------------------------------\n");
      if (LOGFILE!="")
        begin
        log_file = $fopen(LOGFILE);

        if (log_file == 0)
          begin
          $display("Could not open %s",LOGFILE);
          $finish;
          end
        end
    end // initial begin

  // Only include first sync, others are stripped out,
  // together with half-syncs
  // Maintain legacy log file format {data}, tracectl,data[1], data[0]
  // TRACECTL is always low, triggers are embedded in the formatting stream.
  always @(posedge sync_state)
    if (LOGFILE!="")
    $fwrite(log_file,"%t  7fffffff 011\n",$time);

  always @(posedge buffer_valid)
    if (LOGFILE!="")
    $fwrite(log_file,"%t  %x %b%b%b\n",$time,buffer_data,1'b0,
                    buffer_data[1],buffer_data[0]);


endmodule //

