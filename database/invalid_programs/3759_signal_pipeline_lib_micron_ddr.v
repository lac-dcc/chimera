// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

/****************************************************************************************
*
*    File Name:  ddr.v
*      Version:  5.1
*        Model:  BUS Functional
*
* Dependencies:  ddr_parameters.v
*
*  Description:  Micron SDRAM DDR (Double Data Rate)
*
*   Limitation:  - Doesn't check for 8K-cycle refresh
*
*         Note:  - Set simulator resolution to "ps" accuracy
*                - Set Debug = 0 to disable $display messages
*                - Model assume Clk and Clk# crossing at both edge
*
*   Disclaimer   This software code and all associated documentation, comments or other 
*  of Warranty:  information (collectively "Software") is provided "AS IS" without 
*                warranty of any kind. MICRON TECHNOLOGY, INC. ("MTI") EXPRESSLY 
*                DISCLAIMS ALL WARRANTIES EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
*                TO, NONINFRINGEMENT OF THIRD PARTY RIGHTS, AND ANY IMPLIED WARRANTIES 
*                OF MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. MTI DOES NOT 
*                WARRANT THAT THE SOFTWARE WILL MEET YOUR REQUIREMENTS, OR THAT THE 
*                OPERATION OF THE SOFTWARE WILL BE UNINTERRUPTED OR ERROR-FREE. 
*                FURTHERMORE, MTI DOES NOT MAKE ANY REPRESENTATIONS REGARDING THE USE OR 
*                THE RESULTS OF THE USE OF THE SOFTWARE IN TERMS OF ITS CORRECTNESS, 
*                ACCURACY, RELIABILITY, OR OTHERWISE. THE ENTIRE RISK ARISING OUT OF USE 
*                OR PERFORMANCE OF THE SOFTWARE REMAINS WITH YOU. IN NO EVENT SHALL MTI, 
*                ITS AFFILIATED COMPANIES OR THEIR SUPPLIERS BE LIABLE FOR ANY DIRECT, 
*                INDIRECT, CONSEQUENTIAL, INCIDENTAL, OR SPECIAL DAMAGES (INCLUDING, 
*                WITHOUT LIMITATION, DAMAGES FOR LOSS OF PROFITS, BUSINESS INTERRUPTION, 
*                OR LOSS OF INFORMATION) ARISING OUT OF YOUR USE OF OR INABILITY TO USE 
*                THE SOFTWARE, EVEN IF MTI HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH 
*                DAMAGES. Because some jurisdictions prohibit the exclusion or 
*                limitation of liability for consequential or incidental damages, the 
*                above limitation may not apply to you.
*
*                Copyright 2003 Micron Technology, Inc. All rights reserved.
*
* Rev  Author Date        Changes
* ---  ------ ----------  ---------------------------------------
* 2.1  SPH    03/19/2002  - Second Release
*                         - Fix tWR and several incompatability
*                           between different simulators
* 3.0  TFK    02/18/2003  - Added tDSS and tDSH timing checks.
*                         - Added tDQSH and tDQSL timing checks.
* 3.1  CAH    05/28/2003  - update all models to release version 3.1
*                           (no changes to this model)
* 3.2  JMK    06/16/2003  - updated all DDR400 models to support CAS Latency 3
* 3.3  JMK    09/11/2003  - Added initialization sequence checks.
* 4.0  JMK    12/01/2003  - Grouped parameters into "ddr_parameters.v"
*                         - Fixed tWTR check
* 4.1  JMK    01/14/2001  - Grouped specify parameters by speed grade
*                         - Fixed mem_sizes parameter
* 4.2  JMK    03/19/2004  - Fixed pulse width checking on Dqs
* 4.3  JMK    04/27/2004  - Changed BL wire size in tb module
*                         - Changed Dq_buf size to [15:0]
* 5.0  JMK    06/16/2004  - Added read to write checking.
*                         - Added read with precharge truncation to write checking.
*                         - Added associative memory array to reduce memory consumption.
*                         - Added checking for required DQS edges during write.
* 5.1  JMK    08/16/2004  - Fixed checking for required DQS edges during write.
*                         - Fixed wdqs_valid window.
****************************************************************************************/

// DO NOT CHANGE THE TIMESCALE
// MAKE SURE YOUR SIMULATOR USE "PS" RESOLUTION
`timescale 1ns / 1ps

module ddr (
    Dq,
    Dqs,
    Addr,
    Ba,
    Clk,
    Clk_n,
    Cke,
    Cs_n,
    Ras_n,
    Cas_n,
    We_n,
    Dm
);

  `include "ddr_parameters.v"

  // Port Declarations
  inout [DQ_BITS - 1 : 0] Dq;
  inout [DQS_BITS - 1 : 0] Dqs;
  input [ADDR_BITS - 1 : 0] Addr;
  input [1 : 0] Ba;
  input Clk;
  input Clk_n;
  input Cke;
  input Cs_n;
  input Ras_n;
  input Cas_n;
  input We_n;
  input [DM_BITS - 1 : 0] Dm;

  // Internal Wires (fixed width)
  wire [15 : 0] Dq_in;
  wire [ 1 : 0] Dqs_in;
  wire [ 1 : 0] Dm_in;

  assign Dq_in[DQ_BITS-1 : 0]   = Dq;
  assign Dqs_in[DQS_BITS-1 : 0] = Dqs;
  assign Dm_in[DM_BITS-1 : 0]   = Dm;

  // Data pair
  reg [           15 : 0] dq_rise;
  reg [            1 : 0] dm_rise;
  reg [           15 : 0] dq_fall;
  reg [            1 : 0] dm_fall;
  reg [            3 : 0] dm_pair;
  reg [           15 : 0] Dq_buf;

  // Mode Register
  reg [ADDR_BITS - 1 : 0] Mode_reg;

  // Internal System Clock
  reg CkeZ, Sys_clk;

  // Internal Dqs initialize
  reg                        Dqs_int;

  // Dqs buffer
  reg     [DQS_BITS - 1 : 0] Dqs_out;

  // Dq buffer
  reg     [ DQ_BITS - 1 : 0] Dq_out;

  // Read pipeline variables
  reg                        Read_cmnd      [0 : 6];
  reg     [           1 : 0] Read_bank      [0 : 6];
  reg     [COL_BITS - 1 : 0] Read_cols      [0 : 6];

  // Write pipeline variables
  reg                        Write_cmnd     [0 : 3];
  reg     [           1 : 0] Write_bank     [0 : 3];
  reg     [COL_BITS - 1 : 0] Write_cols     [0 : 3];

  // Auto precharge variables
  reg                        Read_precharge [0 : 3];
  reg                        Write_precharge[0 : 3];
  integer                    Count_precharge[0 : 3];

  // Manual precharge variables
  reg                        A10_precharge  [0 : 6];
  reg     [           1 : 0] Bank_precharge [0 : 6];
  reg                        Cmnd_precharge [0 : 6];

  // Burst terminate variables
  reg                        Cmnd_bst       [0 : 6];

  // Memory Banks
`ifdef FULL_MEM
  reg [DQ_BITS - 1 : 0] mem_array[0 : (1<<full_mem_bits)-1];
`else
  reg [      DQ_BITS - 1 : 0] mem_array [0 : (1<<part_mem_bits)-1];
  reg [full_mem_bits - 1 : 0] addr_array[0 : (1<<part_mem_bits)-1];
  reg [    part_mem_bits : 0] mem_used;
  initial mem_used = 0;
`endif

  // Dqs edge checking
  integer                    i;
  reg     [             1:0] expect_pos_dqs;
  reg     [             1:0] expect_neg_dqs;

  // Burst counter
  reg     [COL_BITS - 1 : 0] Burst_counter;

  // Precharge variables
  reg Pc_b0, Pc_b1, Pc_b2, Pc_b3;

  // Activate variables
  reg Act_b0, Act_b1, Act_b2, Act_b3;

  // Data IO variables
  reg         Data_in_enable;
  reg         Data_out_enable;

  // Internal address mux variables
  reg [1 : 0] Prev_bank;
  reg [1 : 0] Bank_addr;
  reg [COL_BITS - 1 : 0] Cols_addr, Cols_brst, Cols_temp;
  reg     [ADDR_BITS - 1 : 0] Rows_addr;
  reg     [ADDR_BITS - 1 : 0] B0_row_addr;
  reg     [ADDR_BITS - 1 : 0] B1_row_addr;
  reg     [ADDR_BITS - 1 : 0] B2_row_addr;
  reg     [ADDR_BITS - 1 : 0] B3_row_addr;

  // DLL Reset variable
  reg                         DLL_enable;
  reg                         DLL_reset;
  reg                         DLL_done;
  integer                     DLL_count;
  integer                     aref_count;
  integer                     Prech_count;
  reg                         power_up_done;

  // Write DQS for tDSS, tDSH, tDQSH, tDQSL checks
  wire                        wdqs_valid = Write_cmnd[2] || Write_cmnd[1] || Data_in_enable;

  // Commands Decode
  wire                        Active_enable = ~Cs_n & ~Ras_n & Cas_n & We_n;
  wire                        Aref_enable = ~Cs_n & ~Ras_n & ~Cas_n & We_n;
  wire                        Burst_term = ~Cs_n & Ras_n & Cas_n & ~We_n;
  wire                        Ext_mode_enable = ~Cs_n & ~Ras_n & ~Cas_n & ~We_n & Ba[0] & ~Ba[1];
  wire                        Mode_reg_enable = ~Cs_n & ~Ras_n & ~Cas_n & ~We_n & ~Ba[0] & ~Ba[1];
  wire                        Prech_enable = ~Cs_n & ~Ras_n & Cas_n & ~We_n;
  wire                        Read_enable = ~Cs_n & Ras_n & ~Cas_n & We_n;
  wire                        Write_enable = ~Cs_n & Ras_n & ~Cas_n & ~We_n;

  // Burst Length Decode
  wire    [              3:0] burst_length = 1 << (Mode_reg[2:0]);
  reg                         read_precharge_truncation;

  // CAS Latency Decode
  wire    [              2:0] cas_latency_x2 = (Mode_reg[6:4] === 3'o6) ? 5 : 2 * Mode_reg[6:4];

  // DQS Buffer
  assign Dqs = Dqs_out;

  // DQ Buffer
  assign Dq  = Dq_out;

  // Debug message
  wire Debug = 1'b1;

  // Timing Check
  time MRD_chk;
  time RFC_chk;
  time RRD_chk;
  time RAS_chk0, RAS_chk1, RAS_chk2, RAS_chk3;
  time RAP_chk0, RAP_chk1, RAP_chk2, RAP_chk3;
  time RC_chk0, RC_chk1, RC_chk2, RC_chk3;
  time RCD_chk0, RCD_chk1, RCD_chk2, RCD_chk3;
  time RP_chk0, RP_chk1, RP_chk2, RP_chk3;
  time WR_chk0, WR_chk1, WR_chk2, WR_chk3;

  initial begin
    CkeZ = 1'b0;
    Sys_clk = 1'b0;
    {Pc_b0, Pc_b1, Pc_b2, Pc_b3} = 4'b0000;
    {Act_b0, Act_b1, Act_b2, Act_b3} = 4'b1111;
    Dqs_int = 1'b0;
    Dqs_out = {DQS_BITS{1'bz}};
    Dq_out = {DQ_BITS{1'bz}};
    Data_in_enable = 1'b0;
    Data_out_enable = 1'b0;
    DLL_enable = 1'b0;
    DLL_reset = 1'b0;
    DLL_done = 1'b0;
    DLL_count = 0;
    aref_count = 0;
    Prech_count = 0;
    power_up_done = 0;
    MRD_chk = 0;
    RFC_chk = 0;
    RRD_chk = 0;
    {RAS_chk0, RAS_chk1, RAS_chk2, RAS_chk3} = 0;
    {RAP_chk0, RAP_chk1, RAP_chk2, RAP_chk3} = 0;
    {RC_chk0, RC_chk1, RC_chk2, RC_chk3} = 0;
    {RCD_chk0, RCD_chk1, RCD_chk2, RCD_chk3} = 0;
    {RP_chk0, RP_chk1, RP_chk2, RP_chk3} = 0;
    {WR_chk0, WR_chk1, WR_chk2, WR_chk3} = 0;
    $timeformat(-9, 3, " ns", 12);
  end

  // System Clock
  always begin
    @(posedge Clk) begin
      Sys_clk = CkeZ;
      CkeZ = Cke;
    end
    @(negedge Clk) begin
      Sys_clk = 1'b0;
    end
  end

  // Check to make sure that we have a Deselect or NOP command on the bus when CKE is brought high
  always @(Cke) begin
    if (Cke === 1'b1) begin
      if (!((Cs_n) || (~Cs_n & Ras_n & Cas_n & We_n))) begin
        $display("%m: at time %t MEMORY ERROR:  You must have a Deselect or NOP command applied",
                 $time);
        $display("%m:           when the Clock Enable is brought High.");
      end
    end
  end

  // Check the initialization sequence
  initial begin
    @(posedge Cke) begin
      @(posedge DLL_enable) begin
        aref_count = 0;
        @(posedge DLL_reset) begin
          @(Prech_count) begin
            if (aref_count >= 2) begin
              if (Debug)
                $display(
                    "%m: at time %t MEMORY:  Power Up and Initialization Sequence is complete",
                    $time
                );
              power_up_done = 1;
            end else begin
              aref_count = 0;
              @(aref_count >= 2) begin
                if (Debug)
                  $display(
                      "%m: at time %t MEMORY:  Power Up and Initialization Sequence is complete",
                      $time
                  );
                power_up_done = 1;
              end
            end
          end
        end
      end
    end
  end

  // Write Memory
  task write_mem;
    input [full_mem_bits - 1 : 0] addr;
    input [DQ_BITS - 1 : 0] data;
    reg [part_mem_bits : 0] i;
    begin
`ifdef FULL_MEM
      mem_array[addr] = data;
`else
      begin : loop
        for (i = 0; i < mem_used; i = i + 1) begin
          if (addr_array[i] === addr) begin
            disable loop;
          end
        end
      end
      if (i === mem_used) begin
        if (i === (1 << part_mem_bits)) begin
          $display(
              "At time %t ERROR: Memory overflow.\n  Write to Address %d with Data %d will be lost.\n  You must increase the part_mem_bits parameter or define FULL_MEM.",
              $time, addr, data);
        end else begin
          mem_used = mem_used + 1;
          addr_array[i] = addr;
        end
      end
      mem_array[i] = data;
`endif
    end
  endtask

  // Read Memory
  task read_mem;
    input [full_mem_bits - 1 : 0] addr;
    output [DQ_BITS - 1 : 0] data;
    reg [part_mem_bits : 0] i;
    begin
`ifdef FULL_MEM
      data = mem_array[addr];
`else
      begin : loop
        for (i = 0; i < mem_used; i = i + 1) begin
          if (addr_array[i] === addr) begin
            disable loop;
          end
        end
      end
      if (i <= mem_used) begin
        data = mem_array[i];
      end
`endif
    end
  endtask

  // Burst Decode
  task Burst_Decode;
    begin

      // Advance Burst Counter
      if (Burst_counter < burst_length) begin
        Burst_counter = Burst_counter + 1;
      end

      // Burst Type
      if (Mode_reg[3] === 1'b0) begin  // Sequential Burst
        Cols_temp = Cols_addr + 1;
      end else if (Mode_reg[3] === 1'b1) begin  // Interleaved Burst
        Cols_temp[2] = Burst_counter[2] ^ Cols_brst[2];
        Cols_temp[1] = Burst_counter[1] ^ Cols_brst[1];
        Cols_temp[0] = Burst_counter[0] ^ Cols_brst[0];
      end

      // Burst Length
      if (burst_length === 2) begin
        Cols_addr[0] = Cols_temp[0];
      end else if (burst_length === 4) begin
        Cols_addr[1 : 0] = Cols_temp[1 : 0];
      end else if (burst_length === 8) begin
        Cols_addr[2 : 0] = Cols_temp[2 : 0];
      end else begin
        Cols_addr = Cols_temp;
      end

      // Data Counter
      if (Burst_counter >= burst_length) begin
        Data_in_enable = 1'b0;
        Data_out_enable = 1'b0;
        read_precharge_truncation = 1'b0;
      end

    end
  endtask

  // Manual Precharge Pipeline
  task Manual_Precharge_Pipeline;
    begin
      // A10 Precharge Pipeline
      A10_precharge[0]  = A10_precharge[1];
      A10_precharge[1]  = A10_precharge[2];
      A10_precharge[2]  = A10_precharge[3];
      A10_precharge[3]  = A10_precharge[4];
      A10_precharge[4]  = A10_precharge[5];
      A10_precharge[5]  = A10_precharge[6];
      A10_precharge[6]  = 1'b0;

      // Bank Precharge Pipeline
      Bank_precharge[0] = Bank_precharge[1];
      Bank_precharge[1] = Bank_precharge[2];
      Bank_precharge[2] = Bank_precharge[3];
      Bank_precharge[3] = Bank_precharge[4];
      Bank_precharge[4] = Bank_precharge[5];
      Bank_precharge[5] = Bank_precharge[6];
      Bank_precharge[6] = 2'b0;

      // Command Precharge Pipeline
      Cmnd_precharge[0] = Cmnd_precharge[1];
      Cmnd_precharge[1] = Cmnd_precharge[2];
      Cmnd_precharge[2] = Cmnd_precharge[3];
      Cmnd_precharge[3] = Cmnd_precharge[4];
      Cmnd_precharge[4] = Cmnd_precharge[5];
      Cmnd_precharge[5] = Cmnd_precharge[6];
      Cmnd_precharge[6] = 1'b0;

      // Terminate a Read if same bank or all banks
      if (Cmnd_precharge[0] === 1'b1) begin
        if (Bank_precharge[0] === Bank_addr || A10_precharge[0] === 1'b1) begin
          if (Data_out_enable === 1'b1) begin
            Data_out_enable = 1'b0;
            read_precharge_truncation = 1'b1;
          end
        end
      end
    end
  endtask

  // Burst Terminate Pipeline
  task Burst_Terminate_Pipeline;
    begin
      // Command Precharge Pipeline
      Cmnd_bst[0] = Cmnd_bst[1];
      Cmnd_bst[1] = Cmnd_bst[2];
      Cmnd_bst[2] = Cmnd_bst[3];
      Cmnd_bst[3] = Cmnd_bst[4];
      Cmnd_bst[4] = Cmnd_bst[5];
      Cmnd_bst[5] = Cmnd_bst[6];
      Cmnd_bst[6] = 1'b0;

      // Terminate a Read regardless of banks
      if (Cmnd_bst[0] === 1'b1 && Data_out_enable === 1'b1) begin
        Data_out_enable = 1'b0;
      end
    end
  endtask

  // Dq and Dqs Drivers
  task Dq_Dqs_Drivers;
    begin
      // read command pipeline
      Read_cmnd[0] = Read_cmnd[1];
      Read_cmnd[1] = Read_cmnd[2];
      Read_cmnd[2] = Read_cmnd[3];
      Read_cmnd[3] = Read_cmnd[4];
      Read_cmnd[4] = Read_cmnd[5];
      Read_cmnd[5] = Read_cmnd[6];
      Read_cmnd[6] = 1'b0;

      // read bank pipeline
      Read_bank[0] = Read_bank[1];
      Read_bank[1] = Read_bank[2];
      Read_bank[2] = Read_bank[3];
      Read_bank[3] = Read_bank[4];
      Read_bank[4] = Read_bank[5];
      Read_bank[5] = Read_bank[6];
      Read_bank[6] = 2'b0;

      // read column pipeline
      Read_cols[0] = Read_cols[1];
      Read_cols[1] = Read_cols[2];
      Read_cols[2] = Read_cols[3];
      Read_cols[3] = Read_cols[4];
      Read_cols[4] = Read_cols[5];
      Read_cols[5] = Read_cols[6];
      Read_cols[6] = 0;

      // Initialize Read command
      if (Read_cmnd[0] === 1'b1) begin
        Data_out_enable = 1'b1;
        Bank_addr = Read_bank[0];
        Cols_addr = Read_cols[0];
        Cols_brst = Cols_addr[2 : 0];
        Burst_counter = 0;

        // Row Address Mux
        case (Bank_addr)
          2'd0:    Rows_addr = B0_row_addr;
          2'd1:    Rows_addr = B1_row_addr;
          2'd2:    Rows_addr = B2_row_addr;
          2'd3:    Rows_addr = B3_row_addr;
          default: $display("At time %t ERROR: Invalid Bank Address", $time);
        endcase
      end

      // Toggle Dqs during Read command
      if (Data_out_enable === 1'b1) begin
        Dqs_int = 1'b0;
        if (Dqs_out === {DQS_BITS{1'b0}}) begin
          Dqs_out = {DQS_BITS{1'b1}};
        end else if (Dqs_out === {DQS_BITS{1'b1}}) begin
          Dqs_out = {DQS_BITS{1'b0}};
        end else begin
          Dqs_out = {DQS_BITS{1'b0}};
        end
      end else if (Data_out_enable === 1'b0 && Dqs_int === 1'b0) begin
        Dqs_out = {DQS_BITS{1'bz}};
      end

      // Initialize dqs for Read command
      if (Read_cmnd[2] === 1'b1) begin
        if (Data_out_enable === 1'b0) begin
          Dqs_int = 1'b1;
          Dqs_out = {DQS_BITS{1'b0}};
        end
      end

      // Read latch
      if (Data_out_enable === 1'b1) begin
        // output data
        read_mem({Bank_addr, Rows_addr, Cols_addr}, Dq_out);
        if (Debug) begin
          $display("At time %t READ : Bank = %d, Row = %d, Col = %d, Data = %d", $time, Bank_addr,
                   Rows_addr, Cols_addr, Dq_out);
        end

      end else begin
        Dq_out = {DQ_BITS{1'bz}};
      end
    end
  endtask

  // Write FIFO and DM Mask Logic
  task Write_FIFO_DM_Mask_Logic;
    begin
      // Write command pipeline
      Write_cmnd[0] = Write_cmnd[1];
      Write_cmnd[1] = Write_cmnd[2];
      Write_cmnd[2] = Write_cmnd[3];
      Write_cmnd[3] = 1'b0;

      // Write command pipeline
      Write_bank[0] = Write_bank[1];
      Write_bank[1] = Write_bank[2];
      Write_bank[2] = Write_bank[3];
      Write_bank[3] = 2'b0;

      // Write column pipeline
      Write_cols[0] = Write_cols[1];
      Write_cols[1] = Write_cols[2];
      Write_cols[2] = Write_cols[3];
      Write_cols[3] = {COL_BITS{1'b0}};

      // Initialize Write command
      if (Write_cmnd[0] === 1'b1) begin
        Data_in_enable = 1'b1;
        Bank_addr = Write_bank[0];
        Cols_addr = Write_cols[0];
        Cols_brst = Cols_addr[2 : 0];
        Burst_counter = 0;

        // Row address mux
        case (Bank_addr)
          2'd0:    Rows_addr = B0_row_addr;
          2'd1:    Rows_addr = B1_row_addr;
          2'd2:    Rows_addr = B2_row_addr;
          2'd3:    Rows_addr = B3_row_addr;
          default: $display("At time %t ERROR: Invalid Row Address", $time);
        endcase
      end

      // Write data
      if (Data_in_enable === 1'b1) begin

        // Data Buffer
        read_mem({Bank_addr, Rows_addr, Cols_addr}, Dq_buf);

        // write negedge Dqs on posedge Sys_clk
        if (Sys_clk) begin
          if (!dm_fall[0]) begin
            Dq_buf[7 : 0] = dq_fall[7 : 0];
          end
          if (!dm_fall[1]) begin
            Dq_buf[15 : 8] = dq_fall[15 : 8];
          end
          if (~&dm_fall) begin
            if (Debug) begin
              $display("At time %t WRITE: Bank = %d, Row = %d, Col = %d, Data = %d", $time,
                       Bank_addr, Rows_addr, Cols_addr, Dq_buf[DQ_BITS-1:0]);
            end
          end
          // write posedge Dqs on negedge Sys_clk
        end else begin
          if (!dm_rise[0]) begin
            Dq_buf[7 : 0] = dq_rise[7 : 0];
          end
          if (!dm_rise[1]) begin
            Dq_buf[15 : 8] = dq_rise[15 : 8];
          end
          if (~&dm_rise) begin
            if (Debug) begin
              $display("At time %t WRITE: Bank = %d, Row = %d, Col = %d, Data = %d", $time,
                       Bank_addr, Rows_addr, Cols_addr, Dq_buf[DQ_BITS-1:0]);
            end
          end
        end

        // Write Data
        write_mem({Bank_addr, Rows_addr, Cols_addr}, Dq_buf);

        // tWR start and tWTR check
        if (Sys_clk && &dm_pair === 1'b0) begin
          case (Bank_addr)
            2'd0:    WR_chk0 = $time;
            2'd1:    WR_chk1 = $time;
            2'd2:    WR_chk2 = $time;
            2'd3:    WR_chk3 = $time;
            default: $display("At time %t ERROR: Invalid Bank Address (tWR)", $time);
          endcase

          // tWTR check
          if (Read_enable === 1'b1) begin
            $display("At time %t ERROR: tWTR violation during Read", $time);
          end
        end
      end
    end
  endtask

  // Auto Precharge Calculation
  task Auto_Precharge_Calculation;
    begin
      // Precharge counter
      if (Read_precharge[0] === 1'b1 || Write_precharge[0] === 1'b1) begin
        Count_precharge[0] = Count_precharge[0] + 1;
      end
      if (Read_precharge[1] === 1'b1 || Write_precharge[1] === 1'b1) begin
        Count_precharge[1] = Count_precharge[1] + 1;
      end
      if (Read_precharge[2] === 1'b1 || Write_precharge[2] === 1'b1) begin
        Count_precharge[2] = Count_precharge[2] + 1;
      end
      if (Read_precharge[3] === 1'b1 || Write_precharge[3] === 1'b1) begin
        Count_precharge[3] = Count_precharge[3] + 1;
      end

      // Read with AutoPrecharge Calculation
      //      The device start internal precharge when:
      //          1.  Meet tRAS requirement
      //          2.  BL/2 cycles after command
      if ((Read_precharge[0] === 1'b1) && ($time - RAS_chk0 >= tRAS)) begin
        if (Count_precharge[0] >= burst_length / 2) begin
          Pc_b0 = 1'b1;
          Act_b0 = 1'b0;
          RP_chk0 = $time;
          Read_precharge[0] = 1'b0;
        end
      end
      if ((Read_precharge[1] === 1'b1) && ($time - RAS_chk1 >= tRAS)) begin
        if (Count_precharge[1] >= burst_length / 2) begin
          Pc_b1 = 1'b1;
          Act_b1 = 1'b0;
          RP_chk1 = $time;
          Read_precharge[1] = 1'b0;
        end
      end
      if ((Read_precharge[2] === 1'b1) && ($time - RAS_chk2 >= tRAS)) begin
        if (Count_precharge[2] >= burst_length / 2) begin
          Pc_b2 = 1'b1;
          Act_b2 = 1'b0;
          RP_chk2 = $time;
          Read_precharge[2] = 1'b0;
        end
      end
      if ((Read_precharge[3] === 1'b1) && ($time - RAS_chk3 >= tRAS)) begin
        if (Count_precharge[3] >= burst_length / 2) begin
          Pc_b3 = 1'b1;
          Act_b3 = 1'b0;
          RP_chk3 = $time;
          Read_precharge[3] = 1'b0;
        end
      end

      // Write with AutoPrecharge Calculation
      //      The device start internal precharge when:
      //          1.  Meet tRAS requirement
      //          2.  Two clock after last burst
      // Since tWR is time base, the model will compensate tRP
      if ((Write_precharge[0] === 1'b1) && ($time - RAS_chk0 >= tRAS)) begin
        if (Count_precharge[0] >= burst_length / 2 + 3) begin
          Pc_b0 = 1'b1;
          Act_b0 = 1'b0;
          RP_chk0 = $time - ((2 * tCK) - tWR);
          Write_precharge[0] = 1'b0;
        end
      end
      if ((Write_precharge[1] === 1'b1) && ($time - RAS_chk1 >= tRAS)) begin
        if (Count_precharge[1] >= burst_length / 2 + 3) begin
          Pc_b1 = 1'b1;
          Act_b1 = 1'b0;
          RP_chk1 = $time - ((2 * tCK) - tWR);
          Write_precharge[1] = 1'b0;
        end
      end
      if ((Write_precharge[2] === 1'b1) && ($time - RAS_chk2 >= tRAS)) begin
        if (Count_precharge[2] >= burst_length / 2 + 3) begin
          Pc_b2 = 1'b1;
          Act_b2 = 1'b0;
          RP_chk2 = $time - ((2 * tCK) - tWR);
          Write_precharge[2] = 1'b0;
        end
      end
      if ((Write_precharge[3] === 1'b1) && ($time - RAS_chk3 >= tRAS)) begin
        if (Count_precharge[3] >= burst_length / 2 + 3) begin
          Pc_b3 = 1'b1;
          Act_b3 = 1'b0;
          RP_chk3 = $time - ((2 * tCK) - tWR);
          Write_precharge[3] = 1'b0;
        end
      end
    end
  endtask

  // DLL Counter
  task DLL_Counter;
    begin
      if (DLL_reset === 1'b1 && DLL_done === 1'b0) begin
        DLL_count = DLL_count + 1;
        if (DLL_count >= 200) begin
          DLL_done = 1'b1;
        end
      end
    end
  endtask

  // Control Logic
  task Control_Logic;
    begin
      // Auto Refresh
      if (Aref_enable === 1'b1) begin
        // Display Debug Message
        if (Debug) begin
          $display("At time %t AREF : Auto Refresh", $time);
        end

        // aref_count is to make sure we have met part of the initialization sequence
        aref_count = aref_count + 1;

        // Auto Refresh to Auto Refresh
        if ($time - RFC_chk < tRFC) begin
          $display("At time %t ERROR: tRFC violation during Auto Refresh", $time);
        end

        // Precharge to Auto Refresh
        if (($time - RP_chk0 < tRP) || ($time - RP_chk1 < tRP) ||
                ($time - RP_chk2 < tRP) || ($time - RP_chk3 < tRP)) begin
          $display("At time %t ERROR: tRP violation during Auto Refresh", $time);
        end

        // Precharge to Auto Refresh
        if (Pc_b0 === 1'b0 || Pc_b1 === 1'b0 || Pc_b2 === 1'b0 || Pc_b3 === 1'b0) begin
          $display("At time %t ERROR: All banks must be Precharge before Auto Refresh", $time);
        end

        // Record Current tRFC time
        RFC_chk = $time;
      end

      // Extended Mode Register
      if (Ext_mode_enable === 1'b1) begin
        if (Debug) begin
          $display("At time %t EMR  : Extended Mode Register", $time);
        end
        if (Pc_b0 === 1'b1 && Pc_b1 === 1'b1 && Pc_b2 === 1'b1 && Pc_b3 === 1'b1) begin
          if (Addr[0] === 1'b0) begin
            DLL_enable = 1'b1;
            if (Debug) begin
              $display("At time %t EMR  : Enable DLL", $time);
            end
          end else begin
            DLL_enable = 1'b0;
            if (Debug) begin
              $display("At time %t EMR  : Disable DLL", $time);
            end
          end
        end else begin
          $display("At time %t ERROR: all banks must be Precharge before Extended Mode Register",
                   $time);
        end

        // Precharge to EMR
        if (($time - RP_chk0 < tRP) || ($time - RP_chk1 < tRP) ||
                ($time - RP_chk2 < tRP) || ($time - RP_chk3 < tRP)) begin
          $display("At time %t ERROR: tRP violation during Extended Mode Register", $time);
        end

        // LMR/EMR to LMR/EMR
        if ($time - MRD_chk < tMRD) begin
          $display("At time %t ERROR: tMRD violation during Extended Mode Register", $time);
        end

        // Record current tMRD time
        MRD_chk = $time;
      end

      // Load Mode Register
      if (Mode_reg_enable === 1'b1) begin
        if (Debug) begin
          $display("At time %t LMR  : Load Mode Register", $time);
        end

        // Register Mode
        Mode_reg = Addr;

        // DLL Reset
        if (DLL_enable === 1'b1 && Addr[8] === 1'b1) begin
          DLL_reset = 1'b1;
          DLL_done  = 1'b0;
          DLL_count = 0;
        end else if (DLL_enable === 1'b1 && DLL_reset === 1'b0 && Addr[8] === 1'b0) begin
          $display("At time %t ERROR: DLL is ENABLE: DLL RESET is required.", $time);
        end else if (DLL_enable === 1'b0 && Addr[8] === 1'b1) begin
          $display("At time %t ERROR: DLL is DISABLE: DLL RESET will be ignored.", $time);
        end

        // Precharge to LMR
        if (Pc_b0 === 1'b0 || Pc_b1 === 1'b0 || Pc_b2 === 1'b0 || Pc_b3 === 1'b0) begin
          $display("At time %t ERROR: all banks must be Precharge before Load Mode Register",
                   $time);
        end

        // Precharge to LMR
        if (($time - RP_chk0 < tRP) || ($time - RP_chk1 < tRP) ||
                ($time - RP_chk2 < tRP) || ($time - RP_chk3 < tRP)) begin
          $display("At time %t ERROR: tRP violation during Load Mode Register", $time);
        end

        // LMR/EMR to LMR/EMR
        if ($time - MRD_chk < tMRD) begin
          $display("At time %t ERROR: tMRD violation during Load Mode Register", $time);
        end

        // Burst Length
        case (Addr[2 : 0])
          3'b001:  $display("At time %t LMR  : Burst Length = 2", $time);
          3'b010:  $display("At time %t LMR  : Burst Length = 4", $time);
          3'b011:  $display("At time %t LMR  : Burst Length = 8", $time);
          default: $display("At time %t ERROR: Burst Length not supported", $time);
        endcase

        // CAS Latency
        case (Addr[6 : 4])
          3'b010:  $display("At time %t LMR  : CAS Latency = 2", $time);
          3'b110:  $display("At time %t LMR  : CAS Latency = 2.5", $time);
          3'b011:  $display("At time %t LMR  : CAS Latency = 3", $time);
          default: $display("At time %t ERROR: CAS Latency not supported", $time);
        endcase

        // Record current tMRD time
        MRD_chk = $time;
      end

      // Activate Block
      if (Active_enable === 1'b1) begin
        if (!(power_up_done)) begin
          $display(
              "%m: at time %t ERROR: Power Up and Initialization Sequence not completed before executing Activate command",
              $time);
        end
        // Display Debug Message
        if (Debug) begin
          $display("At time %t ACT  : Bank = %d, Row = %d", $time, Ba, Addr);
        end

        // Activate an open bank can corrupted.
        if ((Ba === 2'b00 && Pc_b0  === 1'b0) || (Ba === 2'b01 && Pc_b1  === 1'b0) ||
                (Ba === 2'b10 && Pc_b2  === 1'b0) || (Ba === 2'b11 && Pc_b3  === 1'b0)) begin
          $display("At time %t ERROR: Bank = %d is already activated - data can be corrupted",
                   $time, Ba);
        end

        // Activate Bank 0
        if (Ba === 2'b00 && Pc_b0 === 1'b1) begin
          // Activate to Activate (same bank)
          if ($time - RC_chk0 < tRC) begin
            $display("At time %t ERROR: tRC violation during Activate bank %d", $time, Ba);
          end

          // Precharge to Activate
          if ($time - RP_chk0 < tRP) begin
            $display("At time %t ERROR: tRP violation during Activate bank %d", $time, Ba);
          end

          // Record variables for checking violation
          Act_b0 = 1'b1;
          Pc_b0 = 1'b0;
          B0_row_addr = Addr;
          RC_chk0 = $time;
          RCD_chk0 = $time;
          RAS_chk0 = $time;
          RAP_chk0 = $time;
        end

        // Activate Bank 1
        if (Ba === 2'b01 && Pc_b1 === 1'b1) begin
          // Activate to Activate (same bank)
          if ($time - RC_chk1 < tRC) begin
            $display("At time %t ERROR: tRC violation during Activate bank %d", $time, Ba);
          end

          // Precharge to Activate
          if ($time - RP_chk1 < tRP) begin
            $display("At time %t ERROR: tRP violation during Activate bank %d", $time, Ba);
          end

          // Record variables for checking violation
          Act_b1 = 1'b1;
          Pc_b1 = 1'b0;
          B1_row_addr = Addr;
          RC_chk1 = $time;
          RCD_chk1 = $time;
          RAS_chk1 = $time;
          RAP_chk1 = $time;
        end

        // Activate Bank 2
        if (Ba === 2'b10 && Pc_b2 === 1'b1) begin
          // Activate to Activate (same bank)
          if ($time - RC_chk2 < tRC) begin
            $display("At time %t ERROR: tRC violation during Activate bank %d", $time, Ba);
          end

          // Precharge to Activate
          if ($time - RP_chk2 < tRP) begin
            $display("At time %t ERROR: tRP violation during Activate bank %d", $time, Ba);
          end

          // Record variables for checking violation
          Act_b2 = 1'b1;
          Pc_b2 = 1'b0;
          B2_row_addr = Addr;
          RC_chk2 = $time;
          RCD_chk2 = $time;
          RAS_chk2 = $time;
          RAP_chk2 = $time;
        end

        // Activate Bank 3
        if (Ba === 2'b11 && Pc_b3 === 1'b1) begin
          // Activate to Activate (same bank)
          if ($time - RC_chk3 < tRC) begin
            $display("At time %t ERROR: tRC violation during Activate bank %d", $time, Ba);
          end

          // Precharge to Activate
          if ($time - RP_chk3 < tRP) begin
            $display("At time %t ERROR: tRP violation during Activate bank %d", $time, Ba);
          end

          // Record variables for checking violation
          Act_b3 = 1'b1;
          Pc_b3 = 1'b0;
          B3_row_addr = Addr;
          RC_chk3 = $time;
          RCD_chk3 = $time;
          RAS_chk3 = $time;
          RAP_chk3 = $time;
        end

        // Activate to Activate (different bank)
        if ((Prev_bank != Ba) && ($time - RRD_chk < tRRD)) begin
          $display("At time %t ERROR: tRRD violation during Activate bank = %d", $time, Ba);
        end

        // AutoRefresh to Activate
        if ($time - RFC_chk < tRFC) begin
          $display("At time %t ERROR: tRFC violation during Activate bank %d", $time, Ba);
        end

        // Record variable for checking violation
        RRD_chk   = $time;
        Prev_bank = Ba;
      end

      // Precharge Block - consider NOP if bank already precharged or in process of precharging
      if (Prech_enable === 1'b1) begin
        // Display Debug Message
        if (Debug) begin
          $display("At time %t PRE  : Addr[10] = %b, Bank = %b", $time, Addr[10], Ba);
        end

        // EMR or LMR to Precharge
        if ($time - MRD_chk < tMRD) begin
          $display("At time %t ERROR: tMRD violation during Precharge", $time);
        end

        // Precharge bank 0
        if ((Addr[10] === 1'b1 || (Addr[10] === 1'b0 && Ba === 2'b00)) && Act_b0 === 1'b1) begin
          Act_b0  = 1'b0;
          Pc_b0   = 1'b1;
          RP_chk0 = $time;

          // Activate to Precharge Bank
          if ($time - RAS_chk0 < tRAS) begin
            $display("At time %t ERROR: tRAS violation during Precharge", $time);
          end

          // tWR violation check for Write
          if ($time - WR_chk0 < tWR) begin
            $display("At time %t ERROR: tWR violation during Precharge", $time);
          end
        end

        // Precharge bank 1
        if ((Addr[10] === 1'b1 || (Addr[10] === 1'b0 && Ba === 2'b01)) && Act_b1 === 1'b1) begin
          Act_b1  = 1'b0;
          Pc_b1   = 1'b1;
          RP_chk1 = $time;

          // Activate to Precharge Bank 1
          if ($time - RAS_chk1 < tRAS) begin
            $display("At time %t ERROR: tRAS violation during Precharge", $time);
          end

          // tWR violation check for Write
          if ($time - WR_chk1 < tWR) begin
            $display("At time %t ERROR: tWR violation during Precharge", $time);
          end
        end

        // Precharge bank 2
        if ((Addr[10] === 1'b1 || (Addr[10] === 1'b0 && Ba === 2'b10)) && Act_b2 === 1'b1) begin
          Act_b2  = 1'b0;
          Pc_b2   = 1'b1;
          RP_chk2 = $time;

          // Activate to Precharge Bank 2
          if ($time - RAS_chk2 < tRAS) begin
            $display("At time %t ERROR: tRAS violation during Precharge", $time);
          end

          // tWR violation check for Write
          if ($time - WR_chk2 < tWR) begin
            $display("At time %t ERROR: tWR violation during Precharge", $time);
          end
        end

        // Precharge bank 3
        if ((Addr[10] === 1'b1 || (Addr[10] === 1'b0 && Ba === 2'b11)) && Act_b3 === 1'b1) begin
          Act_b3  = 1'b0;
          Pc_b3   = 1'b1;
          RP_chk3 = $time;

          // Activate to Precharge Bank 3
          if ($time - RAS_chk3 < tRAS) begin
            $display("At time %t ERROR: tRAS violation during Precharge", $time);
          end

          // tWR violation check for Write
          if ($time - WR_chk3 < tWR) begin
            $display("At time %t ERROR: tWR violation during Precharge", $time);
          end
        end

        // Prech_count is to make sure we have met part of the initialization sequence
        Prech_count = Prech_count + 1;

        // Pipeline for READ
        A10_precharge[cas_latency_x2] = Addr[10];
        Bank_precharge[cas_latency_x2] = Ba;
        Cmnd_precharge[cas_latency_x2] = 1'b1;
      end

      // Burst terminate
      if (Burst_term === 1'b1) begin
        // Display Debug Message
        if (Debug) begin
          $display("At time %t BST  : Burst Terminate", $time);
        end

        // Burst Terminate Command Pipeline for Read
        Cmnd_bst[cas_latency_x2] = 1'b1;

        // Illegal to burst terminate a Write
        if (Data_in_enable === 1'b1) begin
          $display("At time %t ERROR: It's illegal to burst terminate a Write", $time);
        end

        // Illegal to burst terminate a Read with Auto Precharge
        if (Read_precharge[0] === 1'b1 || Read_precharge[1] === 1'b1 ||
                Read_precharge[2] === 1'b1 || Read_precharge[3] === 1'b1) begin
          $display("At time %t ERROR: It's illegal to burst terminate a Read with Auto Precharge",
                   $time);
        end
      end

      // Read Command
      if (Read_enable === 1'b1) begin
        if (!(power_up_done)) begin
          $display(
              "%m: at time %t ERROR: Power Up and Initialization Sequence not completed before executing Read Command",
              $time);
        end
        // Check for DLL reset before Read
        if (DLL_reset === 1 && DLL_done === 0) begin
          $display(
              "%m: at time %t ERROR: You need to wait 200 tCK after DLL Reset Enable to Read, Not %0d clocks.",
              $time, DLL_count);
        end
        // Display Debug Message
        if (Debug) begin
          $display("At time %t READ : Bank = %d, Col = %d", $time, Ba, {Addr[11], Addr[9 : 0]});
        end

        // CAS Latency pipeline
        Read_cmnd[cas_latency_x2] = 1'b1;
        Read_bank[cas_latency_x2] = Ba;
        Read_cols[cas_latency_x2] = {Addr[ADDR_BITS-1 : 11], Addr[9 : 0]};

        // Terminate a Write
        if (Data_in_enable === 1'b1) begin
          Data_in_enable = 1'b0;
        end

        // Interrupt a Read with Auto Precharge (same bank only)
        if (Read_precharge[Ba] === 1'b1) begin
          $display("At time %t ERROR: It's illegal to interrupt a Write with Auto Precharge",
                   $time);
        end

        // Activate to Read
        if ((Ba === 2'b00 && Pc_b0 === 1'b1) || (Ba === 2'b01 && Pc_b1 === 1'b1) ||
                (Ba === 2'b10 && Pc_b2 === 1'b1) || (Ba === 2'b11 && Pc_b3 === 1'b1)) begin
          $display("At time %t ERROR: Bank is not Activated for Read", $time);
        end

        // Activate to Read without Auto Precharge
        if ((Addr [10] === 1'b0 && Ba === 2'b00 && $time - RCD_chk0 < tRCD) ||
                (Addr [10] === 1'b0 && Ba === 2'b01 && $time - RCD_chk1 < tRCD) ||
                (Addr [10] === 1'b0 && Ba === 2'b10 && $time - RCD_chk2 < tRCD) ||
                (Addr [10] === 1'b0 && Ba === 2'b11 && $time - RCD_chk3 < tRCD)) begin
          $display("At time %t ERROR: tRCD violation during Read", $time);
        end

        // Activate to Read with Auto Precharge
        if ((Addr [10] === 1'b1 && Ba === 2'b00 && $time - RAP_chk0 < tRAP) ||
                (Addr [10] === 1'b1 && Ba === 2'b01 && $time - RAP_chk1 < tRAP) ||
                (Addr [10] === 1'b1 && Ba === 2'b10 && $time - RAP_chk2 < tRAP) ||
                (Addr [10] === 1'b1 && Ba === 2'b11 && $time - RAP_chk3 < tRAP)) begin
          $display("At time %t ERROR: tRAP violation during Read", $time);
        end

        // Auto Precharge
        if (Addr[10] === 1'b1) begin
          Read_precharge[Ba]  = 1'b1;
          Count_precharge[Ba] = 0;
        end
      end

      // Write Command
      if (Write_enable === 1'b1) begin
        if (!(power_up_done)) begin
          $display(
              "%m: at time %t ERROR: Power Up and Initialization Sequence not completed before executing Write Command",
              $time);
        end
        // display debug message
        if (Debug) begin
          $display("At time %t WRITE: Bank = %d, Col = %d", $time, Ba, {Addr[ADDR_BITS-1 : 11],
                                                                        Addr[9 : 0]});
        end

        // Pipeline for Write
        Write_cmnd[3] = 1'b1;
        Write_bank[3] = Ba;
        Write_cols[3] = {Addr[ADDR_BITS-1 : 11], Addr[9 : 0]};

        // Interrupt a Write with Auto Precharge (same bank only)
        if (Write_precharge[Ba] === 1'b1) begin
          $display("At time %t ERROR: It's illegal to interrupt a Write with Auto Precharge",
                   $time);
        end

        // Activate to Write
        if ((Ba === 2'b00 && Pc_b0 === 1'b1) || (Ba === 2'b01 && Pc_b1 === 1'b1) ||
                (Ba === 2'b10 && Pc_b2 === 1'b1) || (Ba === 2'b11 && Pc_b3 === 1'b1)) begin
          $display("At time %t ERROR: Bank is not Activated for Write", $time);
        end

        // Activate to Write
        if ((Ba === 2'b00 && $time - RCD_chk0 < tRCD) ||
                (Ba === 2'b01 && $time - RCD_chk1 < tRCD) ||
                (Ba === 2'b10 && $time - RCD_chk2 < tRCD) ||
                (Ba === 2'b11 && $time - RCD_chk3 < tRCD)) begin
          $display("At time %t ERROR: tRCD violation during Write to Bank %d", $time, Ba);
        end

        // Read to Write
        if (Read_cmnd[0] || Read_cmnd[1] || Read_cmnd[2] || Read_cmnd[3] || 
                Read_cmnd[4] || Read_cmnd[5] || Read_cmnd[6] || (Burst_counter < burst_length)) begin
          if (Data_out_enable || read_precharge_truncation) begin
            $display("At time %t ERROR: Read to Write violation", $time);
          end
        end

        // Auto Precharge
        if (Addr[10] === 1'b1) begin
          Write_precharge[Ba] = 1'b1;
          Count_precharge[Ba] = 0;
        end
      end
    end
  endtask

  task check_neg_dqs;
    begin
      if (Write_cmnd[2] || Write_cmnd[1] || Data_in_enable) begin
        for (i = 0; i < DQS_BITS; i = i + 1) begin
          if (expect_neg_dqs[i]) begin
            $display("At time %t ERROR: Negative DQS[%1d] transition required.", $time, i);
          end
          expect_neg_dqs[i] = 1'b1;
        end
      end else begin
        expect_pos_dqs = 0;
        expect_neg_dqs = 0;
      end
    end
  endtask

  task check_pos_dqs;
    begin
      if (Write_cmnd[2] || Write_cmnd[1] || Data_in_enable) begin
        for (i = 0; i < DQS_BITS; i = i + 1) begin
          if (expect_pos_dqs[i]) begin
            $display("At time %t ERROR: Positive DQS[%1d] transition required.", $time, i);
          end
          expect_pos_dqs[i] = 1'b1;
        end
      end else begin
        expect_pos_dqs = 0;
        expect_neg_dqs = 0;
      end
    end
  endtask

  // Main Logic
  always @(posedge Sys_clk) begin
    Manual_Precharge_Pipeline;
    Burst_Terminate_Pipeline;
    Dq_Dqs_Drivers;
    Write_FIFO_DM_Mask_Logic;
    Burst_Decode;
    check_neg_dqs;
    Auto_Precharge_Calculation;
    DLL_Counter;
    Control_Logic;
  end

  always @(negedge Sys_clk) begin
    Manual_Precharge_Pipeline;
    Burst_Terminate_Pipeline;
    Dq_Dqs_Drivers;
    Write_FIFO_DM_Mask_Logic;
    Burst_Decode;
    check_pos_dqs;
  end

  // Dqs Receiver
  always @(posedge Dqs_in[0]) begin
    // Latch data at posedge Dqs
    dq_rise[7 : 0] = Dq_in[7 : 0];
    dm_rise[0] = Dm_in[0];
    expect_pos_dqs[0] = 0;
  end

  always @(posedge Dqs_in[1]) begin
    // Latch data at posedge Dqs
    dq_rise[15 : 8] = Dq_in[15 : 8];
    dm_rise[1] = Dm_in[1];
    expect_pos_dqs[1] = 0;
  end

  always @(negedge Dqs_in[0]) begin
    // Latch data at negedge Dqs
    dq_fall[7 : 0] = Dq_in[7 : 0];
    dm_fall[0] = Dm_in[0];
    dm_pair[1:0] = {dm_rise[0], dm_fall[0]};
    expect_neg_dqs[0] = 0;
  end

  always @(negedge Dqs_in[1]) begin
    // Latch data at negedge Dqs
    dq_fall[15:8] = Dq_in[15 : 8];
    dm_fall[1] = Dm_in[1];
    dm_pair[3:2] = {dm_rise[1], dm_fall[1]};
    expect_neg_dqs[1] = 0;
  end

  specify
    // SYMBOL UNITS DESCRIPTION
    // ------ ----- -----------
    //              specparams for -5B (CL = 3)
    specparam tDSS = 1.0;  // tDSS   ns    DQS falling edge to CLK rising (setup time) = 0.2*tCK
    specparam tDSH = 1.0;  // tDSH   ns    DQS falling edge from CLK rising (hold time) = 0.2*tCK
    specparam tIH = 0.600;  // tIH    ns    Input Hold Time
    specparam tIS = 0.600;  // tIS    ns    Input Setup Time
    specparam tDQSH = 1.75;  // tDQSH  ns    DQS input High Pulse Width = 0.35*tCK
    specparam tDQSL = 1.75;  // tDQSL  ns    DQS input Low Pulse Width = 0.35*tCK

    $width(posedge Dqs_in[0] &&& wdqs_valid, tDQSH);
    $width(posedge Dqs_in[1] &&& wdqs_valid, tDQSH);
    $width(negedge Dqs_in[0] &&& wdqs_valid, tDQSL);
    $width(negedge Dqs_in[1] &&& wdqs_valid, tDQSL);
    $setuphold(posedge Clk, Cke, tIS, tIH);
    $setuphold(posedge Clk, Cs_n, tIS, tIH);
    $setuphold(posedge Clk, Cas_n, tIS, tIH);
    $setuphold(posedge Clk, Ras_n, tIS, tIH);
    $setuphold(posedge Clk, We_n, tIS, tIH);
    $setuphold(posedge Clk, Addr, tIS, tIH);
    $setuphold(posedge Clk, Ba, tIS, tIH);
    $setuphold(posedge Clk, negedge Dqs &&& wdqs_valid, tDSS, tDSH);
  endspecify

endmodule
