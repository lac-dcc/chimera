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
//      Checked In          : $Date: 2012-07-30 18:07:21 +0100 (Mon, 30 Jul 2012) $
//
//      Revision            : $Revision: 216980 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Core module for AHB Lite File Reader Bus Master
//-----------------------------------------------------------------------------
//  ---------------------------------------------------------------------------
//  Purpose             : The AHB-Lite file reader bus master reads in a file
//                        and decodes it into AHB-Lite (with ARM11 extensions)
//                        bus transfers.
//  --=======================================================================--

`timescale 1ns/1ps

module cmsdk_ahb_filereadcore #(
  // Parameters
  parameter  input_filename  = "filestim.m2d",   // stimulus data file name
  parameter  message_tag     = "FileReader:",    // tag on each FileReader message
  parameter  stim_array_size = 5000) // array size, should be large enough to hold
                                     //  entire stimulus data file
 (
  input  wire         HCLK,      // system clock
  input  wire         HRESETn,   // system reset

  input  wire         HREADY,    // slave ready signal
  input  wire [2:0]   HRESP,     // slave response (tie HRESP[2] low for non-ARM11)
  input  wire [63:0]  HRDATA,    // data from slave to master
  output wire [1:0]   HTRANS,    // transfer type
  output wire [2:0]   HBURST,    // burst type
  output wire [5:0]   HPROT,     // protection (HPROT[5:4] unconnected for non-ARM11)
  output wire [2:0]   HSIZE,     // transfer size
  output wire         HWRITE,    // transfer direction
  output wire         HMASTLOCK, // transfer is a locked transfer
  output wire [31:0]  HADDR,     // transfer address
  output wire [63:0]  HWDATA,    // data from master to slave
  output wire         HUNALIGN,  // transfer is unaligned (unconnected for non-ARM11)
  output wire [7:0]   HBSTRB,    // byte lane strobes (unconnected for non-ARM11)

  output wire [31:0]  LINENUM);  // Line number in stimulus file

  //----------------------------------------------------------------------------
  // Constant declarations
  //----------------------------------------------------------------------------

  `define ARM_FRBM_UNDEF8        8'hx
  `define ARM_FRBM_LOW32         {32{1'b0}}

  // Sign-on banner
  `define ARM_FRBM_SIGN_ON_MSG1  " ************************************************"
  `define ARM_FRBM_SIGN_ON_MSG2  " **** ARM AMBA Design Kit File Reader Master"
  `define ARM_FRBM_SIGN_ON_MSG3  " **** (C) ARM Limited 2000-2002"
  `define ARM_FRBM_SIGN_ON_MSG4  " ************************************************"

  // Information message
  `define ARM_FRBM_OPENFILE_MSG  "%d %s Reading stimulus file %s"

  // Error messages
  `define ARM_FRBM_SLAVE_ERR_MSG1 "%d %s #ERROR# Expected Okay response was not received from Slave."
  `define ARM_FRBM_SLAVE_ERR_MSG2 "%d %s #ERROR# Expected Error response was not received from Slave."
  `define ARM_FRBM_SLAVE_XFAIL_MSG1 "%d %s #ERROR# Slave responded with an unexpected XFAIL."
  `define ARM_FRBM_SLAVE_XFAIL_MSG2 "%d %s #ERROR# Expected XFAIL response was not received from Slave."
  `define ARM_FRBM_DATA_ERR_MSG "%d %s #ERROR# Data received did not match expectation."
  `define ARM_FRBM_POLL_ERR_MSG "%d %s #ERROR# Poll command timed out after %d repeats."
  `define ARM_FRBM_CMD_MSG "%d %s #ERROR# Unknown command value in file."


  `define ARM_FRBM_ADDRESS_MSG     " Address       = %h"
  `define ARM_FRBM_ACTUAL_DATA     " Actual data   = %h"
  `define ARM_FRBM_EXPECTED_DATA   " Expected data = %h"
  `define ARM_FRBM_DATA_MASK       " Mask          = %h"
  `define ARM_FRBM_LINE_NUM        " Stimulus Line: %d"

  // Inent messages because of the length of the time variable
  `define ARM_FRBM_INDENT          "                     "

  // End of Simulation Summary messages
  `define ARM_FRBM_QUIT_MSG        "Simulation Quit requested."
  `define ARM_FRBM_END_MSG         "Stimulus completed."

  `define ARM_FRBM_SUMMARY_HEADER  " ******* SIMULATION SUMMARY *******"
  `define ARM_FRBM_SUMMARY_FOOTER  " **********************************"
  `define ARM_FRBM_SUMMARY_DATA    " ** Data Mismatches     :%d"
  `define ARM_FRBM_SUMMARY_POLL    " ** Poll timeouts       :%d"
  `define ARM_FRBM_SUMMARY_SLAVE   " ** Response Mismatches :%d"


  // HTRANS signal encoding
  `define ARM_FRBM_TRN_IDLE      2'b00   // Idle transfer
  `define ARM_FRBM_TRN_BUSY      2'b01   // Busy transfer
  `define ARM_FRBM_TRN_NONSEQ    2'b10   // Non-sequential
  `define ARM_FRBM_TRN_SEQ       2'b11   // Sequential

  // HSIZE signal encoding
  `define ARM_FRBM_SZ_BYTE       3'b000  //  8-bit access
  `define ARM_FRBM_SZ_HALF       3'b001  // 16-bit access
  `define ARM_FRBM_SZ_WORD       3'b010  // 32-bit access
  `define ARM_FRBM_SZ_DWORD      3'b011  // 64-bit access

  // HBURST signal encoding
  `define ARM_FRBM_BUR_SINGLE    3'b000  // Single
  `define ARM_FRBM_BUR_INCR      3'b001  // Incrementing
  `define ARM_FRBM_BUR_WRAP4     3'b010  // 4-beat wrap
  `define ARM_FRBM_BUR_INCR4     3'b011  // 4-beat incr
  `define ARM_FRBM_BUR_WRAP8     3'b100  // 8-beat wrap
  `define ARM_FRBM_BUR_INCR8     3'b101  // 8-beat incr
  `define ARM_FRBM_BUR_WRAP16    3'b110  // 16-beat wrap
  `define ARM_FRBM_BUR_INCR16    3'b111  // 16-beat incr

  // HRESP signal encoding
  `define ARM_FRBM_RSP_OKAY      3'b000  // Okay response
  `define ARM_FRBM_RSP_ERROR     3'b001  // Error response
  `define ARM_FRBM_RSP_RETRY     3'b010  // Retry response
  `define ARM_FRBM_RSP_SPLIT     3'b011  // Split response
  `define ARM_FRBM_RSP_XFAIL     3'b100  // XFail response

  // Wrap boundary limits
  `define ARM_FRBM_NOBOUND       3'b000
  `define ARM_FRBM_BOUND4        3'b001
  `define ARM_FRBM_BOUND8        3'b010
  `define ARM_FRBM_BOUND16       3'b011
  `define ARM_FRBM_BOUND32       3'b100
  `define ARM_FRBM_BOUND64       3'b101
  `define ARM_FRBM_BOUND128      3'b110

  // Commands
  `define ARM_FRBM_CMD_WRITE     8'b00000000
  `define ARM_FRBM_CMD_READ      8'b00010000
  `define ARM_FRBM_CMD_SEQ       8'b00100000
  `define ARM_FRBM_CMD_BUSY      8'b00110000
  `define ARM_FRBM_CMD_IDLE      8'b01000000
  `define ARM_FRBM_CMD_POLL      8'b01010000
  `define ARM_FRBM_CMD_LOOP      8'b01100000
  `define ARM_FRBM_CMD_COMM      8'b01110000
  `define ARM_FRBM_CMD_QUIT      8'b10000000

  // Poll command states
  `define ARM_FRBM_ST_NO_POLL    2'b00
  `define ARM_FRBM_ST_POLL_READ  2'b01
  `define ARM_FRBM_ST_POLL_TEST  2'b10

  // Error responses
  `define ARM_FRBM_ERR_OKAY      2'b00
  `define ARM_FRBM_ERR_CONT      2'b01
  `define ARM_FRBM_ERR_CANC      2'b10
  `define ARM_FRBM_ERR_XFAIL     2'b11

//---------------------------------------------------------------------------
// Signal declarations
//---------------------------------------------------------------------------

  // File read control
  wire        rd_next;

  // Signals from file data
  reg  [7:0]  vec_cmd; // command
  reg  [31:0] vec_addr;
  reg  [63:0] vec_data;
  reg  [63:0] vec_data_mask;
  reg  [2:0]  vec_burst;
  reg  [2:0]  vec_size;
  reg         vec_lock;
  reg  [5:0]  vec_prot;
  reg         vec_dir;
  reg  [1:0]  err_resp;
  reg         wait_rdy;
  reg  [7:0]  vec_bstrb;
  reg         unalign;
  reg         use_bstrb_flag;

  // Registered signals
  reg  [7:0]  cmd_reg;
  reg  [63:0] data_reg;
  reg  [63:0] mask_reg;
  reg  [2:0]  size_reg;
  reg  [1:0]  err_resp_reg;

  // Address calculation signals
  wire        non_zero;
  reg  [3:0]  add_value;
  reg  [2:0]  align_mask;
  reg  [2:0]  boundary;
  wire [31:0] incr_addr;
  reg  [31:0] wrapped_addr;
  wire [31:0] aligned_addr;
  wire [2:0]  aligned_addr_l;

  // Error signal
  wire        data_err;

  // Internal signals
  wire [31:0] i_haddr;
  wire [63:0] i_hwdata;
  reg  [1:0]  i_htrans;
  wire        i_hwrite;
  reg  [7:0]  i_hbstrb;

  // Registered internal signals
  reg  [31:0] haddr_reg;
  reg  [63:0] hwdata_reg;
  reg  [1:0]  htrans_reg;
  reg         hwrite_reg;

  // Poll command state machine
  reg  [1:0]  next_poll_state;
  reg  [1:0]  poll_state;

  // Compared read data
  wire [63:0] mask;
  wire [63:0] bstrb_mask;
  reg  [63:0] data_compare;

  // Poll timeout signals
  reg  [31:0] timeout;                                 // timeout value for poll
  reg  [31:0] timeout_reg;                            // registered timeout value
  reg  [31:0] poll_count;                                         // poll counter
  reg  [31:0] next_poll_count;                                  // next poll count

//------------------------------------------------------------------------------
// START OF BEHAVIOURAL CODE
//------------------------------------------------------------------------------

  // Stimulus reading signals
  reg  [31:0] file_array [0:stim_array_size];                 // stimulus file data
  reg  [31:0] file_array_tmp;                    // current value in stimulus file
  integer     array_ptr;                          // pointer to stimulus file data

  integer     stim_line_num;                 // input stimulus line number counter
  integer     stim_line_reg;       // stim line counter registered into data phase

  // Stimulus end signals
  reg         stim_end;                     // signals end of input stimulus file
  reg         stim_end_data;                 // stim_end registered into data phase
  reg         stim_end_data_reg;                          // registered stim_end_data

  reg         skip_seq;             // signals to skip end of sequence upon Error

  reg         banner_done;           // true if sign-on banner has been displayed

  // Error counters for end of simulation summary
  integer     data_err_cnt;                                    // read data errors
  integer     slave_resp_cnt;                  // unexpected slave ERROR responses
  integer     poll_err_cnt;                                       // Poll timeouts

  reg  [7:0]  comm_words_hex [0:79];                              // comment array
  reg  [4:0]  comm_word_num;                 // number of words in comment command


//------------------------------------------------------------------------------
// Print Comment command string to simulation window
//------------------------------------------------------------------------------
// The fileconv script converts the comment into ASCII hex values this
//  task prints the string from the comm_words_hex array.

  task tsk_simulation_comment;                           // no input or return values
     integer c_index;                                           // character index
    begin
     $write   ("%d %s ", $time, message_tag);

      // loop through the characters in the array and print
      for (c_index = 0; c_index < (comm_word_num*4); c_index = c_index + 1)

        // do not print ASCII NULL character
        if (comm_words_hex[c_index] !== 8'b00000000)

          // print each character
          $write("%s", comm_words_hex[c_index]);

      // end the line
      $display("");
    end
  endtask

//----------------------------------------------------------------------------
// Open Command File
//----------------------------------------------------------------------------
// Reads the command file into an array. This process is only executed once.

  initial
    begin : p_open_file_bhav

      // report the stimulus file name to the simulation environment
      $display (`ARM_FRBM_OPENFILE_MSG, $time, message_tag, input_filename);
      $readmemh(input_filename, file_array);

    end


//------------------------------------------------------------------------------
// Sign-on banner
//------------------------------------------------------------------------------
// Writes a message to the simulation environment on exit from reset.
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_banner_bhav
      if (HRESETn !== 1'b1)
       banner_done <= 1'b0;
      else
        if (banner_done !== 1'b1)
          begin
            banner_done <= 1'b1;
            $display ("%d %s", $time, message_tag);
            $write   (`ARM_FRBM_INDENT);
            $display (`ARM_FRBM_SIGN_ON_MSG1);
            $write   (`ARM_FRBM_INDENT);
            $display (`ARM_FRBM_SIGN_ON_MSG2);
            $write   (`ARM_FRBM_INDENT);
            $display (`ARM_FRBM_SIGN_ON_MSG3);
            $write   (`ARM_FRBM_INDENT);
            $display (`ARM_FRBM_SIGN_ON_MSG4);
          end
    end
//------------------------------------------------------------------------------
// Report errors to simulation environment
//------------------------------------------------------------------------------
// This process responds to error signals with an acknowledge signal and
//  reports the error to the simulation environment

  always @ (posedge HCLK or negedge HRESETn)
    begin : p_report_errors_bhav
      if (HRESETn !== 1'b1)
        begin
          data_err_cnt = 0;
          slave_resp_cnt = 0;
          poll_err_cnt = 0;
        end
      else
        if ((HREADY === 1'b1) && (skip_seq !== 1'b1))            // transfer complete

          // report an unexpected XFAIL response from slave
          // (XFAIL response checking has higher priority than ERROR reponse)
          if  ((HRESP === `ARM_FRBM_RSP_XFAIL) && (err_resp_reg !== `ARM_FRBM_ERR_XFAIL))
            begin
              $display (`ARM_FRBM_SLAVE_XFAIL_MSG1, $time, message_tag);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_LINE_NUM, stim_line_reg);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_ADDRESS_MSG, haddr_reg);
              slave_resp_cnt = slave_resp_cnt + 1;  // increment slave error counter
            end

          // report expected XFAIL response missing from slave
          else if ((HRESP !== `ARM_FRBM_RSP_XFAIL) && (err_resp_reg === `ARM_FRBM_ERR_XFAIL))
            begin
              $display (`ARM_FRBM_SLAVE_XFAIL_MSG2, $time, message_tag);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_LINE_NUM, stim_line_reg);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_ADDRESS_MSG, haddr_reg);
              slave_resp_cnt = slave_resp_cnt + 1;  // increment slave error counter
            end

          // report an unexpected error response from slave
          else if ((HRESP !== `ARM_FRBM_RSP_OKAY) && (err_resp_reg === `ARM_FRBM_ERR_OKAY))
            begin
              $display (`ARM_FRBM_SLAVE_ERR_MSG1, $time, message_tag);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_LINE_NUM, stim_line_reg);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_ADDRESS_MSG, haddr_reg);
              slave_resp_cnt = slave_resp_cnt + 1;  // increment slave error counter
            end

          // report expected error response missing from slave
          else if ((HRESP !== `ARM_FRBM_RSP_ERROR) &&
                   ((err_resp_reg === `ARM_FRBM_ERR_CONT) || (err_resp_reg === `ARM_FRBM_ERR_CANC)))
            begin
              $display (`ARM_FRBM_SLAVE_ERR_MSG2, $time, message_tag);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_LINE_NUM, stim_line_reg);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_ADDRESS_MSG, haddr_reg);
              slave_resp_cnt = slave_resp_cnt + 1;  // increment slave error counter
            end

          // report poll timeout error
          else if ( (data_err === 1'b1) &&  (poll_count === 32'h00000001))
            begin
              $display (`ARM_FRBM_POLL_ERR_MSG, $time, message_tag, timeout_reg);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_LINE_NUM, stim_line_reg);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_ADDRESS_MSG, haddr_reg);


              if (size_reg === `ARM_FRBM_SZ_DWORD)                      // 64 bit transfer
                begin
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_ACTUAL_DATA, HRDATA[63:0]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_EXPECTED_DATA, data_reg[63:0]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_DATA_MASK, mask_reg[63:0]);
                end
              else if (haddr_reg[2] === 1'b1)        // less than 64 bit transfer
                begin                                       // display high word
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_ACTUAL_DATA, HRDATA[63:32]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_EXPECTED_DATA, data_reg[63:32]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_DATA_MASK, mask_reg[63:32]);
                end
              else                                           // display low word
                begin
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_ACTUAL_DATA, HRDATA[31:0]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_EXPECTED_DATA, data_reg[31:0]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_DATA_MASK, mask_reg[31:0]);
                end

              poll_err_cnt = poll_err_cnt + 1;       // increment poll error counter
            end // if (data_err === 1'b1 && poll_count === 32'h00000001)

          // report data error
          else if ((data_err === 1'b1) && (poll_state === `ARM_FRBM_ST_NO_POLL))
            begin
              $display (`ARM_FRBM_DATA_ERR_MSG, $time, message_tag);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_LINE_NUM, stim_line_reg);
              $write   (`ARM_FRBM_INDENT);
              $display (`ARM_FRBM_ADDRESS_MSG, haddr_reg);


              if (size_reg === `ARM_FRBM_SZ_DWORD)                      // 64 bit transfer
                begin
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_ACTUAL_DATA, HRDATA[63:0]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_EXPECTED_DATA, data_reg[63:0]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_DATA_MASK, mask_reg[63:0]);
                end
              else if (haddr_reg[2] === 1'b1)        // less than 64 bit transfer
                begin                                       // display high word
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_ACTUAL_DATA, HRDATA[63:32]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_EXPECTED_DATA, data_reg[63:32]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_DATA_MASK, mask_reg[63:32]);
                end
              else                                           // display low word
                begin
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_ACTUAL_DATA, HRDATA[31:0]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_EXPECTED_DATA, data_reg[31:0]);
                  $write   (`ARM_FRBM_INDENT);
                  $display (`ARM_FRBM_DATA_MASK, mask_reg[31:0]);
                end

              data_err_cnt = data_err_cnt + 1;       // increment data error counter
            end // if (data_err === 1'b1 && poll_state === `ARM_FRBM_ST_NO_POLL)
    end // block: p_report_errors_bhav

//------------------------------------------------------------------------------
// Read Command
//------------------------------------------------------------------------------
// Reads next command from the array, if the previous one has completed,
// indicated by rd_next. If a looped command is being executed, then the
// command is not updated, if no more commands are available in the stimulus,
// default signal values are used.
// Control information that must be preserved is registered by this procedure.

  always @ (posedge HCLK or negedge HRESETn)
    begin : p_cmd_read_bhav

    reg         use_bstrb_tmp;   // flag indicates that Bstrb should be read
                               //  from stimulus file
    integer     stim_line_tmp;   // temporary stimulus line counter
    reg [31:0]  loop_number;    // count looping commands
    integer     i;             // loop counter

      if (HRESETn !== 1'b1)
        begin
          // signal reset values
          vec_cmd           <= `ARM_FRBM_CMD_IDLE;
          vec_addr          <= {32{1'b0}};
          vec_data          <= {64{1'b0}};
          vec_data_mask     <= {64{1'b1}};
          vec_size          <= `ARM_FRBM_SZ_BYTE;
          vec_burst         <= `ARM_FRBM_BUR_SINGLE;
          vec_prot          <= 6'b000000;
          vec_dir           <= 1'b0;
          vec_lock          <= 1'b0;
          wait_rdy       <= 1'b0;
          vec_bstrb         <= 8'b00000000;
          use_bstrb_flag  <= 1'b1;
          unalign       <= 1'b0;

          err_resp       <= 2'b00;
          skip_seq       <= 1'b0;
          stim_end       <= 1'b0;

          loop_number     = {32{1'b0}};
          timeout         <= {32{1'b0}};
          stim_line_num   <= 0;
          stim_line_tmp    = 0;

          array_ptr         = 1'b0;            // Go to beginning of command array
          file_array_tmp    = {32{1'b0}};
        end // if (HRESETn !== 1'b1)
      else  // HCLK rising edge
        begin

          skip_seq <= 1'b0; // sequence skip complete

          // copy signal values into variables
          stim_line_tmp = stim_line_num;
          use_bstrb_tmp = use_bstrb_flag;

          if (rd_next === 1'b1) // ready for next command
            begin

              // If ErrCanc is set, an error received and no new burst
              //  starting, skip the remaining SEQ, BUSY and Comment commands
              //  in this burst.
              if ((HRESP === `ARM_FRBM_RSP_ERROR) &&
                  (HREADY === 1'b1) &&
                  (err_resp_reg === `ARM_FRBM_ERR_CANC) &&
                  ((vec_cmd === `ARM_FRBM_CMD_SEQ) || (vec_cmd === `ARM_FRBM_CMD_BUSY)))
                begin

                  skip_seq <= 1'b1;     // signals that sequence is being skipped

                  // cancel current looping command
                  loop_number = {32{1'b0}};

                  file_array_tmp = file_array [array_ptr];

                  // skip all commands in the current burst
                  while ((file_array_tmp [31:24] === `ARM_FRBM_CMD_SEQ)  ||
                         (file_array_tmp [31:24] === `ARM_FRBM_CMD_BUSY) ||
                         (file_array_tmp [31:24] === `ARM_FRBM_CMD_LOOP) ||
                         (file_array_tmp [31:24] === `ARM_FRBM_CMD_COMM))
                    begin

                      // increment stimulus line counter
                      stim_line_tmp = stim_line_tmp + file_array_tmp [5:0];

                      if (file_array_tmp [31:24] === `ARM_FRBM_CMD_SEQ)         // skip SEQ
                        if (file_array_tmp [6] === 1'b1)
                          // skip Bstrb field if present
                          array_ptr = array_ptr + 6;
                        else
                          array_ptr = array_ptr + 5;

                      else if (file_array_tmp [31:24] === `ARM_FRBM_CMD_BUSY)  // skip BUSY
                        if (file_array_tmp [6] === 1'b1)
                          // skip Bstrb field if present
                          array_ptr = array_ptr + 2;
                        else
                          array_ptr = array_ptr + 1;

                      else if (file_array_tmp [31:24] === `ARM_FRBM_CMD_LOOP)  // skip LOOP
                        array_ptr = array_ptr + 2;

                      else
                        begin                            // skip Comment command
                          array_ptr = array_ptr + 1;
                          file_array_tmp = file_array [array_ptr];
                          array_ptr = array_ptr + file_array_tmp [4:0];
                          array_ptr = array_ptr + 1;
                        end

                      // Read a fresh word from the stimulus array
                      file_array_tmp = file_array [array_ptr];

                    end // while loop
                end // if (HRESP...

              // Read a fresh word from the stimulus array
              file_array_tmp = file_array [array_ptr];

              // Comment command prints a string to the simulation window in
              //  zero simulation time.
              while ((file_array_tmp [31:24] === `ARM_FRBM_CMD_COMM) &&        // comment cmd
                     (loop_number === `ARM_FRBM_LOW32))       // current command not looping
                begin

                  // increment stimulus line counter
                  stim_line_tmp = stim_line_tmp + file_array_tmp [5:0];

                  array_ptr = array_ptr + 1;

                  // get number of words
                  file_array_tmp = file_array [array_ptr];
                  comm_word_num  = file_array_tmp [4:0];

                  array_ptr = array_ptr + 1;
                  file_array_tmp = file_array [array_ptr];

                  // read in lines occupied by comment data
                  for (i = 0; i < comm_word_num; i = i + 1)
                    begin
                      // store each character individually
                      comm_words_hex[((i * 4) + 0)] = file_array_tmp [31:24];
                      comm_words_hex[((i * 4) + 1)] = file_array_tmp [23:16];
                      comm_words_hex[((i * 4) + 2)] = file_array_tmp [15:8];
                      comm_words_hex[((i * 4) + 3)] = file_array_tmp [7:0];

                      array_ptr = array_ptr + 1;
                      file_array_tmp = file_array [array_ptr];
                    end

                  // call task to display the comment
                  tsk_simulation_comment;

                end // while loop

                if (loop_number !== `ARM_FRBM_LOW32)
                  // A command is currently looping
                  loop_number = (loop_number - 1'b1);


                else

                  begin

                    file_array_tmp = file_array [array_ptr];

                    case (file_array_tmp [31:24])

                      `ARM_FRBM_CMD_WRITE : begin
                        // Get each write command field
                        vec_cmd           <= file_array_tmp [31:24];
                        vec_size          <= file_array_tmp [23:21];
                        vec_burst         <= file_array_tmp [20:18];
                        vec_prot          <= file_array_tmp [17:12];
                        vec_lock          <= file_array_tmp [11];
                        err_resp       <= file_array_tmp [9:8];
                        unalign       <= file_array_tmp [7];
                        use_bstrb_tmp    = file_array_tmp [6];
                        stim_line_tmp    = stim_line_tmp + file_array_tmp [5:0];
                        array_ptr        = array_ptr + 1;
                        vec_addr          <= file_array [array_ptr];
                        array_ptr        = array_ptr + 1;
                        vec_data [63:32]  <= file_array [array_ptr];
                        array_ptr        = array_ptr + 1;
                        vec_data [31:0]   <= file_array [array_ptr];
                        array_ptr        = array_ptr + 1;
                        // Bstrb field is present if use_bstrb_tmp is set
                        if (use_bstrb_tmp === 1'b1) begin
                          file_array_tmp    = file_array [array_ptr];
                          vec_bstrb          <= file_array_tmp [7:0];
                          array_ptr         = array_ptr + 1;
                        end

                      end // case: `ARM_FRBM_CMD_WRITE

                      `ARM_FRBM_CMD_READ : begin
                        vec_cmd           <= file_array_tmp [31:24];
                        vec_size          <= file_array_tmp [23:21];
                        vec_burst         <= file_array_tmp [20:18];
                        vec_prot          <= file_array_tmp [17:12];
                        vec_lock          <= file_array_tmp [11];
                        err_resp       <= file_array_tmp [9:8];
                        unalign       <= file_array_tmp [7];
                        use_bstrb_tmp    = file_array_tmp [6];
                        stim_line_tmp    = stim_line_tmp + file_array_tmp [5:0];
                        array_ptr        = array_ptr + 1;
                        vec_addr          <= file_array [array_ptr];
                        array_ptr        = array_ptr + 1;
                        vec_data [63:32]  <= file_array [array_ptr];
                        array_ptr        = (array_ptr + 1);
                        vec_data [31:0]   <= file_array [array_ptr];
                        array_ptr        = (array_ptr + 1);
                        vec_data_mask [63:32] <= file_array [array_ptr];
                        array_ptr        = (array_ptr + 1);
                        vec_data_mask [31:0]  <= file_array [array_ptr];
                        array_ptr        = (array_ptr + 1);
                        // Bstrb field is present if use_bstrb_tmp is set
                        if (use_bstrb_tmp === 1'b1) begin
                          file_array_tmp  = file_array [array_ptr];
                          vec_bstrb        <= file_array_tmp [7:0];
                          array_ptr       = (array_ptr + 1);
                        end
                      end // case: `ARM_FRBM_CMD_READ

                      `ARM_FRBM_CMD_SEQ : begin
                        // Get each sequential command field
                        vec_cmd     <= file_array_tmp [31:24];
                        err_resp <= file_array_tmp [9:8];
                        use_bstrb_tmp = file_array_tmp [6];
                        stim_line_tmp = stim_line_tmp + file_array_tmp [5:0];
                        array_ptr  = array_ptr + 1;
                        vec_data [63:32] <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        vec_data [31:0]  <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        vec_data_mask [63:32] <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        vec_data_mask [31:0]  <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        // Bstrb field is present if use_bstrb_tmp is set
                        if (use_bstrb_tmp === 1'b1) begin
                          file_array_tmp  = file_array [array_ptr];
                          vec_bstrb        <= file_array_tmp [7:0];
                          array_ptr       = array_ptr + 1;
                        end
                      end // case: `ARM_FRBM_CMD_SEQ

                      `ARM_FRBM_CMD_BUSY : begin
                        // Set busy command field
                        vec_cmd     <= file_array_tmp [31:24];
                        wait_rdy <= file_array_tmp [8];
                        use_bstrb_tmp = file_array_tmp [6];
                        stim_line_tmp = stim_line_tmp + file_array_tmp [5:0];
                        err_resp <= `ARM_FRBM_ERR_OKAY;
                        array_ptr  = array_ptr + 1;
                        // Bstrb field is present if use_bstrb_tmp is set
                        if (use_bstrb_tmp === 1'b1) begin
                          file_array_tmp  = file_array [array_ptr];
                          vec_bstrb        <= file_array_tmp [7:0];
                          array_ptr       = (array_ptr + 1);
                        end
                      end // case: `ARM_FRBM_CMD_BUSY

                      `ARM_FRBM_CMD_IDLE : begin
                        // Get each idle command field
                        vec_cmd     <= file_array_tmp [31:24];
                        vec_size    <= file_array_tmp [23:21];
                        vec_burst   <= file_array_tmp [20:18];
                        vec_prot    <= file_array_tmp [17:12];
                        vec_lock    <= file_array_tmp [11];
                        vec_dir     <= file_array_tmp [10];
                        wait_rdy <= file_array_tmp [8];
                        unalign <= file_array_tmp [7];
                        use_bstrb_tmp = file_array_tmp [6];
                        err_resp <= `ARM_FRBM_ERR_OKAY;
                        stim_line_tmp = stim_line_tmp + file_array_tmp [5:0];
                        array_ptr  = array_ptr + 1;
                        vec_addr    <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        // Bstrb field is present if use_bstrb_tmp is set
                        if (use_bstrb_tmp === 1'b1) begin
                          file_array_tmp  = file_array [array_ptr];
                          vec_bstrb        <= file_array_tmp  [7:0];
                          array_ptr       = array_ptr + 1;
                        end
                      end // case: `ARM_FRBM_CMD_IDLE

                      `ARM_FRBM_CMD_POLL : begin
                        // Get each poll command field
                        vec_cmd     <= file_array_tmp [31:24];
                        vec_size    <= file_array_tmp [23:21];
                        vec_burst   <= file_array_tmp [20:18];
                        vec_prot    <= file_array_tmp [17:12];
                        unalign <= file_array_tmp [7];
                        use_bstrb_tmp = file_array_tmp [6];
                        stim_line_tmp = stim_line_tmp + file_array_tmp [5:0];
                        vec_lock    <= 1'b0 ;
                        err_resp <= `ARM_FRBM_ERR_OKAY;// Poll doesn't support ERROR field
                        array_ptr  = array_ptr + 1;
                        file_array_tmp  = file_array [array_ptr];
                        timeout <= file_array_tmp [31:0];    // Poll timeout value
                        array_ptr  = array_ptr + 1;
                        vec_addr    <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        vec_data [63:32] <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        vec_data [31:0]  <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        vec_data_mask [63:32] <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        vec_data_mask [31:0]  <= file_array [array_ptr];
                        array_ptr  = array_ptr + 1;
                        // Bstrb field is present if use_bstrb_tmp is set
                        if (use_bstrb_tmp === 1'b1) begin
                          file_array_tmp  = file_array [array_ptr];
                          vec_bstrb        <= file_array_tmp [7:0];
                          array_ptr       = (array_ptr + 1);
                        end
                      end // case: `ARM_FRBM_CMD_POLL

                      `ARM_FRBM_CMD_LOOP : begin
                        // Loops are counted from n to 0 so the loop number is
                        //  reduced by 1.
                        stim_line_tmp = stim_line_tmp + file_array_tmp [5:0];
                        array_ptr  = array_ptr + 1;
                        file_array_tmp   = file_array [array_ptr];
                        loop_number = (file_array_tmp [31:0] - 1'b1);
                        array_ptr  = array_ptr + 1;
                      end // case: `ARM_FRBM_CMD_LOOP

                      `ARM_FRBM_CMD_QUIT : begin
                        // Exit simulation and print error summary
                        vec_cmd         <= file_array_tmp [31:24];
                        vec_addr        <= {32{1'b0}};
                        vec_data        <= {64{1'b0}};
                        vec_data_mask    <= {64{1'b1}};
                        vec_size        <= `ARM_FRBM_SZ_BYTE;
                        vec_burst       <= `ARM_FRBM_BUR_SINGLE;
                        vec_prot        <= 6'b000000;
                        vec_dir         <= 1'b0;
                        vec_lock        <= 1'b0;
                        wait_rdy     <= 1'b0;
                        vec_bstrb       <= 8'b00000000;
                        unalign     <= 1'b0;
                        err_resp     <= `ARM_FRBM_ERR_OKAY;
                        use_bstrb_tmp = 1;
                        stim_line_tmp = stim_line_tmp + file_array_tmp [5:0];
                      end

                      `ARM_FRBM_UNDEF8 : begin
                        // Set defaults as file stimulus exhausted
                        vec_cmd         <= `ARM_FRBM_CMD_IDLE;
                        vec_addr        <= {32{1'b0}};
                        vec_data        <= {64{1'b0}};
                        vec_data_mask    <= {64{1'b1}};
                        vec_size        <= `ARM_FRBM_SZ_BYTE;
                        vec_burst       <= `ARM_FRBM_BUR_SINGLE;
                        vec_prot        <= 6'b000000;
                        vec_dir         <= 1'b0;
                        vec_lock        <= 1'b0;
                        wait_rdy     <= 1'b0;
                        vec_bstrb       <= 8'b00000000;
                        unalign     <= 1'b0;
                        use_bstrb_tmp = 1;
                        err_resp     <= `ARM_FRBM_ERR_OKAY;
                        stim_end     <= 1'b1;         // set end of stimulus flag
                      end

                      default : begin
                        $display (`ARM_FRBM_CMD_MSG, $time, message_tag);
                        $stop; // stop the simulation
                      end

                    endcase // case(file_array_tmp [2:0])

                    stim_line_num <= stim_line_tmp;  // update stimulus line counter

                  end // else: !if(loop_number !== 32'h00000000)

            use_bstrb_flag <= use_bstrb_tmp;                // update Use Bstrb Flag

            end // rd_next = '1'
        end // else: if (HRESETn !== 1'b1)
    end // always begin

//------------------------------------------------------------------------------
// Quit simulation if found Q command in stimulus file
//------------------------------------------------------------------------------

  always @ (posedge HCLK)
    begin : p_simulation_end
      if  ( (cmd_reg === `ARM_FRBM_CMD_QUIT) ||
            ((stim_end_data === 1'b1) && (stim_end_data_reg === 1'b0))
          )
        begin
          // stimulus just exhausted
          $display ("");
          $write   ("%d %s ", $time, message_tag);

          if  (cmd_reg === `ARM_FRBM_CMD_QUIT)
              // simulation ended by Quit command
              $display (`ARM_FRBM_QUIT_MSG);
          else
              // simulation ended by completion of stimulus
              $display (`ARM_FRBM_END_MSG);

          // write summary info
          $display ("");
          $display (`ARM_FRBM_SUMMARY_HEADER);
          $display (`ARM_FRBM_SUMMARY_DATA, data_err_cnt);
          $display (`ARM_FRBM_SUMMARY_SLAVE, slave_resp_cnt);
          $display (`ARM_FRBM_SUMMARY_POLL, poll_err_cnt);
          $display (`ARM_FRBM_SUMMARY_FOOTER);
          $display ("");

          // if simulation ended by Quit command then halt simulation
          if  ( cmd_reg ===`ARM_FRBM_CMD_QUIT )
            begin
              $display (" Simulation halted.");
              $stop;
            end
        end // if begin
    end  // always begin

//---------------------------------------------------------------------------
// END OF BEHAVIOURAL CODE
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
// Register Current Command
//---------------------------------------------------------------------------
// The current command is registered when a new command is read from the file

  always @ (posedge HCLK or negedge HRESETn)
    begin : p_reg_file_seq
      if (HRESETn !== 1'b1)
        begin
          cmd_reg       <= 8'b00000000;
          data_reg      <= {64{1'b0}};
          mask_reg      <= {64{1'b0}};
          size_reg      <= 3'b000;
          err_resp_reg   <= 2'b00;
          stim_end_data  <= 1'b0;
          stim_line_reg  <= 0;
          timeout_reg   <= {32{1'b0}};
        end // if (HRESETn !== 1'b1)
      else
        if (HREADY === 1'b1)
          begin
            cmd_reg      <= vec_cmd;
            data_reg     <= vec_data;
            mask_reg     <= mask;
            size_reg     <= vec_size;
            err_resp_reg  <= err_resp;
            stim_end_data <= stim_end;
            stim_line_reg <= stim_line_num;
            timeout_reg  <= timeout;
          end // if (HREADY === 1'b1)
    end // block: p_reg_file_seq


//---------------------------------------------------------------------------
// Register Stimulus End Flag
//---------------------------------------------------------------------------
// Stimulus End Flag is registered so that the summary information is only
//  displayed once.

  always @ (posedge HCLK or negedge HRESETn)
    begin : p_stim_end_reg
      if  (HRESETn !== 1'b1)
        stim_end_data_reg <= 1'b0;
      else
        stim_end_data_reg <= stim_end_data;
    end

//---------------------------------------------------------------------------
// Register Output values
//---------------------------------------------------------------------------
// The output address, write signal and transfer type are registered when
//  HREADY is asserted.

  always @ (posedge HCLK or negedge HRESETn)
    begin : p_reg_outputs_seq
      if  (HRESETn !== 1'b1)
        begin
          haddr_reg  <= {32{1'b0}};
          htrans_reg <= {2{1'b0}};
          hwrite_reg <= 1'b0;
        end
      else
        if (HREADY === 1'b1)
          begin
            htrans_reg <= i_htrans;
            haddr_reg  <= i_haddr;
            hwrite_reg <= i_hwrite;
          end // if (HREADY)
    end // block: p_reg_outputs_seq


//------------------------------------------------------------------------------
// Mask used for rounding down address before incrementing
//------------------------------------------------------------------------------
  always @ (vec_size)
    begin : p_align_mask_comb
      case (vec_size )
        `ARM_FRBM_SZ_BYTE  : align_mask = 3'b111;
        `ARM_FRBM_SZ_HALF  : align_mask = 3'b110;
        `ARM_FRBM_SZ_WORD  : align_mask = 3'b100;
        `ARM_FRBM_SZ_DWORD : align_mask = 3'b000;
        default   : align_mask = 3'b111;
      endcase
  end


//------------------------------------------------------------------------------
// Calculate aligned address
//------------------------------------------------------------------------------
//  Base of incremented address is calculated by rounding down initial address
//  to boundary of transfer (container) size.

  assign aligned_addr_l   = (haddr_reg [2:0] & align_mask);
  assign aligned_addr    = {haddr_reg [31:3], aligned_addr_l};


//---------------------------------------------------------------------------
// Determine add_value and calculate address
//---------------------------------------------------------------------------

// The value to be added to the address is based on the current command, the
//  previous command and the width of the data.
//
// The address should be incremented when:
//   HTRANS is sequential or busy and previous vec_cmd is sequential or read
//   or write (NONSEQ).

  assign non_zero = (((vec_cmd === `ARM_FRBM_CMD_SEQ)  && (cmd_reg === `ARM_FRBM_CMD_SEQ))   ||
                    ((vec_cmd === `ARM_FRBM_CMD_SEQ)  && (cmd_reg === `ARM_FRBM_CMD_WRITE)) ||
                    ((vec_cmd === `ARM_FRBM_CMD_SEQ)  && (cmd_reg === `ARM_FRBM_CMD_READ))  ||
                    ((vec_cmd === `ARM_FRBM_CMD_BUSY) && (cmd_reg === `ARM_FRBM_CMD_SEQ))   ||
                    ((vec_cmd === `ARM_FRBM_CMD_BUSY) && (cmd_reg === `ARM_FRBM_CMD_WRITE)) ||
                    ((vec_cmd === `ARM_FRBM_CMD_BUSY) && (cmd_reg === `ARM_FRBM_CMD_READ))) ? 1'b1
                   : 1'b0;

  always @ (vec_size or non_zero)
    begin : p_calc_add_value_comb
      if (non_zero === 1'b1)
        begin
          case (vec_size)
            `ARM_FRBM_SZ_BYTE : add_value = 4'b0001;
            `ARM_FRBM_SZ_HALF : add_value = 4'b0010;
            `ARM_FRBM_SZ_WORD : add_value = 4'b0100;
            `ARM_FRBM_SZ_DWORD: add_value = 4'b1000;
            default  : add_value = 4'b0000;
          endcase // case(vec_size)
        end // if non_zero
      else
        add_value = 4'b0000;
    end // block: p_calc_add_value_comb

//---------------------------------------------------------------------------
// Calculate new address value
//---------------------------------------------------------------------------
// A 10-bit incrementer is not used, so that bursts >1k bytes may be tested

  // Pad AddValue to 32 bits
  assign  incr_addr = aligned_addr + { {28{1'b0}}, add_value };

//---------------------------------------------------------------------------
// Trap wrapping burst boundaries
//---------------------------------------------------------------------------

// When the burst is a wrapping burst the calculated address must not cross
//  the boundary (size(bytes) x beats in burst).
// The boundary value is set based on the Burst and Size values

  always @ (vec_size or vec_burst)
    begin : p_boundary_value_comb
      case (vec_size)

        `ARM_FRBM_SZ_BYTE :
          case (vec_burst)
            `ARM_FRBM_BUR_WRAP4  : boundary = `ARM_FRBM_BOUND4;
            `ARM_FRBM_BUR_WRAP8  : boundary = `ARM_FRBM_BOUND8;
            `ARM_FRBM_BUR_WRAP16 : boundary = `ARM_FRBM_BOUND16;
            `ARM_FRBM_BUR_SINGLE,
            `ARM_FRBM_BUR_INCR,
            `ARM_FRBM_BUR_INCR4,
            `ARM_FRBM_BUR_INCR8,
            `ARM_FRBM_BUR_INCR16 : boundary = `ARM_FRBM_NOBOUND;
            default     : boundary = `ARM_FRBM_NOBOUND;
          endcase // case (vec_burst)

        `ARM_FRBM_SZ_HALF :
          case (vec_burst)
            `ARM_FRBM_BUR_WRAP4  : boundary = `ARM_FRBM_BOUND8;
            `ARM_FRBM_BUR_WRAP8  : boundary = `ARM_FRBM_BOUND16;
            `ARM_FRBM_BUR_WRAP16 : boundary = `ARM_FRBM_BOUND32;
            `ARM_FRBM_BUR_SINGLE,
            `ARM_FRBM_BUR_INCR,
            `ARM_FRBM_BUR_INCR4,
            `ARM_FRBM_BUR_INCR8,
            `ARM_FRBM_BUR_INCR16 : boundary = `ARM_FRBM_NOBOUND;
            default     : boundary = `ARM_FRBM_NOBOUND;
          endcase // case (vec_burst)

        `ARM_FRBM_SZ_WORD :
          case (vec_burst)
            `ARM_FRBM_BUR_WRAP4  : boundary = `ARM_FRBM_BOUND16;
            `ARM_FRBM_BUR_WRAP8  : boundary = `ARM_FRBM_BOUND32;
            `ARM_FRBM_BUR_WRAP16 : boundary = `ARM_FRBM_BOUND64;
            `ARM_FRBM_BUR_SINGLE,
            `ARM_FRBM_BUR_INCR,
            `ARM_FRBM_BUR_INCR4,
            `ARM_FRBM_BUR_INCR8,
            `ARM_FRBM_BUR_INCR16 : boundary = `ARM_FRBM_NOBOUND;
            default     : boundary = `ARM_FRBM_NOBOUND;
          endcase // case (vec_burst)

        `ARM_FRBM_SZ_DWORD :
          case (vec_burst)
            `ARM_FRBM_BUR_WRAP4  : boundary = `ARM_FRBM_BOUND32;
            `ARM_FRBM_BUR_WRAP8  : boundary = `ARM_FRBM_BOUND64;
            `ARM_FRBM_BUR_WRAP16 : boundary = `ARM_FRBM_BOUND128;
            `ARM_FRBM_BUR_SINGLE,
            `ARM_FRBM_BUR_INCR,
            `ARM_FRBM_BUR_INCR4,
            `ARM_FRBM_BUR_INCR8,
            `ARM_FRBM_BUR_INCR16 : boundary = `ARM_FRBM_NOBOUND;
            default     : boundary = `ARM_FRBM_NOBOUND;
          endcase // case (vec_burst)

        default         : boundary = `ARM_FRBM_NOBOUND;
      endcase // case (vec_size)
    end // block: p_boundary_value_comb

// The calculated address is checked to see if it has crossed the boundary.
//  If it has the result address is wrapped, otherwise it is equal to the
//  calculated address.

 always @ (boundary or incr_addr or aligned_addr)
   begin : p_wrapped_addr_comb

      case (boundary)

        `ARM_FRBM_NOBOUND :
            wrapped_addr = incr_addr;

        `ARM_FRBM_BOUND4  :
          if  (incr_addr [1:0] === 2'b00)
            begin
              wrapped_addr [31:2] = aligned_addr [31:2];
              wrapped_addr [1:0] = 2'b00;
            end // if (incr_addr [1:0] === 2'b00)
          else
            wrapped_addr = incr_addr;

        `ARM_FRBM_BOUND8 :
          if  (incr_addr [2:0] === 3'b000)
            begin
              wrapped_addr [31:3] = aligned_addr [31:3];
              wrapped_addr [2:0] = 3'b000;
            end // if (incr_addr [2:0] === 3'b000)
          else
            wrapped_addr = incr_addr;

        `ARM_FRBM_BOUND16 :
          if  (incr_addr [3:0] === 4'b0000)
            begin
              wrapped_addr [31:4] = aligned_addr [31:4];
              wrapped_addr [3:0] = 4'b0000;
            end // if (incr_addr [3:0] === 4'b0000)
          else
            wrapped_addr = incr_addr;

        `ARM_FRBM_BOUND32 :
          if  (incr_addr [4:0] === 5'b00000)
            begin
              wrapped_addr [31:5] = aligned_addr [31:5];
              wrapped_addr [4:0] = 5'b00000;
            end // if (incr_addr [4:0] === 5'b00000)
          else
            wrapped_addr = incr_addr;

        `ARM_FRBM_BOUND64 :
          if  (incr_addr [5:0] === 6'b000000)
            begin
              wrapped_addr [31:6] = aligned_addr [31:6];
              wrapped_addr [5:0] = 6'b000000;
            end // if (incr_addr [5:0] === 6'b000000)
          else
            wrapped_addr = incr_addr;

        `ARM_FRBM_BOUND128 :
          if  (incr_addr [6:0] === 7'b0000000)
            begin
              wrapped_addr [31:7] = aligned_addr [31:7];
              wrapped_addr [6:0] = 7'b0000000;
            end // if (incr_addr [6:0] === 7'b000000)
          else
            wrapped_addr = incr_addr;

        default :
          wrapped_addr  = {32{1'b0}};

      endcase // case(boundary)

    end // block: p_wrapped_addr_comb

//---------------------------------------------------------------------------
// Address Output
//---------------------------------------------------------------------------
// Address is calculated when there is a busy or sequential command otherwise
//  the value from the input file is used. The registered address is used for
//  poll commands.

  assign i_haddr  = ((vec_cmd ===`ARM_FRBM_CMD_SEQ) || (vec_cmd ===`ARM_FRBM_CMD_BUSY)) ? wrapped_addr
                   : vec_addr;

  assign  HADDR  = i_haddr;

//---------------------------------------------------------------------------
// Next Line File Read Control
//---------------------------------------------------------------------------
// If the FileReader is not attempting a transfer that will result in data
//  transfer, the master can continue to read commands from the file when HREADY
//  is low. The exception is when the command being executed is a poll command.

  assign rd_next = (next_poll_state ===`ARM_FRBM_ST_NO_POLL) &&
                    ( (HREADY === 1'b1) ||
                      ( (wait_rdy === 1'b0) &&
                        ((vec_cmd ===`ARM_FRBM_CMD_BUSY ) || (vec_cmd ===`ARM_FRBM_CMD_IDLE ))
                      )
                    ) ? 1'b1

                  : 1'b0;

//---------------------------------------------------------------------------
// Transfer Type Control
//---------------------------------------------------------------------------
// Transfer type output, when executing a poll command HTRANS can only be
//  set to NONSEQ or IDLE, depending on the poll state.
// HTRANS over-ridden to IDLE when cancelling a burst due to error response.
// For the other commands HTRANS is set to NONSEQ for read and write commands,
//  SEQ for sequential and BUSY for busy commands.

  always @ (vec_cmd or err_resp_reg or HRESP or HREADY or next_poll_state)
    begin : p_htrans_control_comb
      if  (vec_cmd === `ARM_FRBM_CMD_POLL)
        begin
          if (next_poll_state === `ARM_FRBM_ST_POLL_TEST)
            i_htrans = `ARM_FRBM_TRN_NONSEQ;
          else
            i_htrans = `ARM_FRBM_TRN_IDLE;
        end
      else if ((HRESP === `ARM_FRBM_RSP_ERROR) &&              // ERROR response received
               (err_resp_reg === `ARM_FRBM_ERR_CANC) &&          // ERROR response expected
               (HREADY === 1'b1) &&               // 2nd cycle of ERROR response
               ((vec_cmd === `ARM_FRBM_CMD_SEQ) || (vec_cmd === `ARM_FRBM_CMD_BUSY)))        // burst transfer
        i_htrans = `ARM_FRBM_TRN_IDLE;                          // cancel pending transfer
      else
        case (vec_cmd)
          `ARM_FRBM_CMD_WRITE : i_htrans = `ARM_FRBM_TRN_NONSEQ;
          `ARM_FRBM_CMD_READ  : i_htrans = `ARM_FRBM_TRN_NONSEQ;
          `ARM_FRBM_CMD_SEQ   : i_htrans = `ARM_FRBM_TRN_SEQ;
          `ARM_FRBM_CMD_BUSY  : i_htrans = `ARM_FRBM_TRN_BUSY;
          `ARM_FRBM_CMD_IDLE  : i_htrans = `ARM_FRBM_TRN_IDLE;
          `ARM_FRBM_CMD_QUIT  : i_htrans = `ARM_FRBM_TRN_IDLE;
          default    : i_htrans = `ARM_FRBM_TRN_IDLE;
        endcase // case (vec_cmd)
    end // block: p_htrans_control_comb

  assign  HTRANS = i_htrans;

//---------------------------------------------------------------------------
// Direction Control
//---------------------------------------------------------------------------
// HWRITE is only asserted for a write command or the idle command, when dir
// set. HWRITE retains its value until the end of the burst.

  assign i_hwrite = ((vec_cmd === `ARM_FRBM_CMD_BUSY) ||
                    (vec_cmd === `ARM_FRBM_CMD_SEQ)) ? hwrite_reg

                   : ((vec_cmd === `ARM_FRBM_CMD_WRITE) ||
                      ((vec_cmd === `ARM_FRBM_CMD_IDLE) && (vec_dir === 1'b1))) ? 1'b1

                   : 1'b0;

  assign  HWRITE = i_hwrite;

//------------------------------------------------------------------------------
// Other Transfer Control Information
//------------------------------------------------------------------------------

  assign HMASTLOCK  = vec_lock;
  assign HSIZE      = vec_size;
  assign HBURST     = vec_burst;
  assign HPROT      = vec_prot;
  assign HUNALIGN   = unalign;

  assign LINENUM    = stim_line_num;

//------------------------------------------------------------------------------
// Byte Lane Strobes
//------------------------------------------------------------------------------
// HSTRB is calculated when Bstrb is not specified in the stimulus, otherwise
//  the value from the input file is used. The registered version is used for
//  poll commands.
//
// Assumes 64-bit data bus, and that use_bstrb_flag signal is asserted for all
//  unaligned transfers.

  always @ (i_haddr[2:0] or vec_size or use_bstrb_flag or vec_bstrb)
    begin : p_bstrb_comb
      // If Bstrb is specified in the stimulus file, byte lane strobes are used
      //  directly from the stimulus file.
      if  (use_bstrb_flag === 1'b1)
       i_hbstrb  = vec_bstrb;
      else
        begin
// If use_bstrb_flag is not specified in the stimulus file, byte lane strobes
//  are calculated. Aligned transfers only are supported.
        case (vec_size)
          `ARM_FRBM_SZ_BYTE : begin
            case (i_haddr [2:0])
              3'b000  : i_hbstrb = 8'b00000001;
              3'b001  : i_hbstrb = 8'b00000010;
              3'b010  : i_hbstrb = 8'b00000100;
              3'b011  : i_hbstrb = 8'b00001000;
              3'b100  : i_hbstrb = 8'b00010000;
              3'b101  : i_hbstrb = 8'b00100000;
              3'b110  : i_hbstrb = 8'b01000000;
              3'b111  : i_hbstrb = 8'b10000000;
              default : i_hbstrb = 8'b00000000;                // Invalid address
            endcase
          end

          `ARM_FRBM_SZ_HALF : begin
            case (i_haddr [2:0])
              3'b000  : i_hbstrb = 8'b00000011;
              3'b010  : i_hbstrb = 8'b00001100;
              3'b100  : i_hbstrb = 8'b00110000;
              3'b110  : i_hbstrb = 8'b11000000;
              default : i_hbstrb = 8'b00000000;      // Invalid/unaligned address
            endcase
          end

          `ARM_FRBM_SZ_WORD : begin
            case (i_haddr [2:0])
              3'b000  : i_hbstrb = 8'b00001111;
              3'b100  : i_hbstrb = 8'b11110000;
              default : i_hbstrb = 8'b00000000;      // Invalid/unaligned address
            endcase
          end


          `ARM_FRBM_SZ_DWORD : begin
              case (i_haddr [2:0])
              3'b000  : i_hbstrb = 8'b11111111;
              default : i_hbstrb = 8'b00000000;      // Invalid/unaligned address
            endcase
          end

          default     : i_hbstrb  = 8'b00000000;    // Invalid size (> bus width)
       endcase
      end
    end
//------------------------------------------------------------------------------
// HSTRB Output
//------------------------------------------------------------------------------

  assign HBSTRB = i_hbstrb;


//------------------------------------------------------------------------------
// Byte Lane Strobe data mask
//------------------------------------------------------------------------------
// Calculate 64-bit mask, based on iHSTRB
// Note: This assumes little-endian mode.

  assign bstrb_mask [7:0]    = i_hbstrb [0] ? 8'b11111111 : 8'b00000000;
  assign bstrb_mask [15:8]   = i_hbstrb [1] ? 8'b11111111 : 8'b00000000;
  assign bstrb_mask [23:16]  = i_hbstrb [2] ? 8'b11111111 : 8'b00000000;
  assign bstrb_mask [31:24]  = i_hbstrb [3] ? 8'b11111111 : 8'b00000000;
  assign bstrb_mask [39:32]  = i_hbstrb [4] ? 8'b11111111 : 8'b00000000;
  assign bstrb_mask [47:40]  = i_hbstrb [5] ? 8'b11111111 : 8'b00000000;
  assign bstrb_mask [55:48]  = i_hbstrb [6] ? 8'b11111111 : 8'b00000000;
  assign bstrb_mask [63:56]  = i_hbstrb [7] ? 8'b11111111 : 8'b00000000;

//------------------------------------------------------------------------------
// Resultant mask - taking into account Bstrb values
//------------------------------------------------------------------------------
// Assumes 64-bit data bus, and that use_bstrb_flag signal will be asserted
//  for all unaligned transfers.

  assign mask = (use_bstrb_flag === 1'b1) ? (vec_data_mask & bstrb_mask) : vec_data_mask;

//---------------------------------------------------------------------------
// Data Control and Compare
//---------------------------------------------------------------------------
// When the transfer type from the previous address cycle was TRN_NONSEQ or
//  TRN_SEQ then either the read or write data bus will be active in the
//  next cycle.
// write data is recorded in the address cycle

  assign i_hwdata = (
                    (i_hwrite === 1'b1) &&
                    (HREADY === 1'b1) &&
                    ((i_htrans === `ARM_FRBM_TRN_NONSEQ) ||
                     (i_htrans === `ARM_FRBM_TRN_SEQ))
                   ) ? vec_data
                   : {64{1'b0}};

  // The write data is registered when HREADY is asserted
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_reg_wdata_seq
      if (HRESETn !== 1'b1)
        hwdata_reg <= {64{1'b0}};
      else if (HREADY === 1'b1)
        hwdata_reg <= i_hwdata;
    end // block: p_reg_wdata_seq

  // The registered value is output on the AHB-Lite interface
  assign  HWDATA = hwdata_reg;

  // Read data is recorded in the cycle after the address and compared with
  //  the expected data value after applying the mask.
  // Note that the data is checked only if an OKAY response is received.
     always @ (data_reg or HRESP or HRDATA or mask_reg or htrans_reg or hwrite_reg)
    begin : p_data_compare_comb
      if  ((hwrite_reg === 1'b0) && (HRESP === `ARM_FRBM_RSP_OKAY) &&
           ((htrans_reg ===`ARM_FRBM_TRN_NONSEQ) || (htrans_reg ===`ARM_FRBM_TRN_SEQ)))
        data_compare = ((data_reg & mask_reg) ^ (HRDATA & mask_reg));
      else
        data_compare = {64{1'b0}};
    end // block: p_data_compare_comb

  // If data_compare is non-zero, flag an error.
  assign data_err = (data_compare !== {64{1'b0}}) ? 1'b1
                     : 1'b0;

//------------------------------------------------------------------------------
// Poll State Machine
//------------------------------------------------------------------------------
// The poll command requires two AHB transfers: a read followed by an idle to
//  get the data from the read transfer. This command will continue until the
//  data read matches the expected data or the poll timeout count is reached.
// The state machine is used to control the read and idle transfers and the
//  completion of the poll command.

  always @ (poll_state or vec_cmd or data_err or poll_count or timeout)
    begin : p_poll_state_comb
      case (poll_state)

        `ARM_FRBM_ST_NO_POLL : begin
          if (vec_cmd === `ARM_FRBM_CMD_POLL) // if poll command, read transfer in this cycle
            begin
              next_poll_state = `ARM_FRBM_ST_POLL_TEST;          // test data in next cycle
              next_poll_count = timeout;   // load poll counter with timeout value
            end
          else                                                // no poll command
            begin
              next_poll_state = `ARM_FRBM_ST_NO_POLL;
              next_poll_count = poll_count;
            end
        end // case: `ARM_FRBM_ST_NO_POLL

        `ARM_FRBM_ST_POLL_TEST : begin                     // data phase of poll transfer
          if ((data_err === 1'b0) ||        // data matched and non-ERROR response
              (poll_count === 32'h00000001))                      // poll timed out
            begin
              next_poll_state = `ARM_FRBM_ST_NO_POLL;
              next_poll_count = 32'b00000000;
            end
          else
            begin                     // data not matched and poll not timed out
              next_poll_state = `ARM_FRBM_ST_POLL_READ;                       // poll again
              if (poll_count !== 32'b00000000)
                next_poll_count = poll_count - 1'b1;   // decrement timeout counter
              else
                next_poll_count = poll_count;
            end
        end // case: `ARM_FRBM_ST_POLL_TEST

        `ARM_FRBM_ST_POLL_READ :                        // address phase of poll transfer
          begin
            next_poll_state = `ARM_FRBM_ST_POLL_TEST; // next state always to test the data
            next_poll_count = poll_count;
          end

        default:                                     // illegal state transition
          begin
            next_poll_state = `ARM_FRBM_ST_NO_POLL;
            next_poll_count = poll_count;
          end

      endcase // case(poll_state)
    end // block: p_poll_state_comb

  // Poll state and count registers
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_poll_state_seq
      if  (HRESETn !== 1'b1)
        begin
          poll_state <= `ARM_FRBM_ST_NO_POLL;
          poll_count <= 32'b00000000;
        end
      else
        if (HREADY === 1'b1)              // updated on each transfer completion
          begin
            poll_state <= next_poll_state;
            poll_count <= next_poll_count;
          end
    end // block: p_poll_state_seq

endmodule // FileReadCore

// --================================ End ==================================--
