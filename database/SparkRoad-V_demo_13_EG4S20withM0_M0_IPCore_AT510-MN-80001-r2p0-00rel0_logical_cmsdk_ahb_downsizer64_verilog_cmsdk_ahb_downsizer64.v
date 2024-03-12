//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2002-2013 ARM Limited.
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
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//  -------------------------------------------------------------------------
//  Abstract            : Translates a 64-bit-wide AMBA 3 AHB-Lite data bus to a
//                        32-bit-wide one.
//                        For a 64 bit transfer, bit[31:0] will always be
//                        mapped to address xxxx_x000, and bit[63:32] will
//                        always be mapped to xxxx_x100.
//=========================================================================--


module cmsdk_ahb_downsizer64
  #(
  //----------------------------------------------------------------------------
  // Block Parameters
  //----------------------------------------------------------------------------

  // Select the number of channel ID bits required
  parameter HMASTER_WIDTH   = 1,                // HMASTER width

  // Error handling in burst
  // - If set to 1, block the rest of the burst if an error occurred, independent to size of data
  // - If set to 0, block the rest of the burst if an error occurred only for 64-bit transfers
  parameter ERR_BURST_BLOCK_ALL = 1)
  (
  //----------------------------------------------------------------------------
  // Port declarations
  //----------------------------------------------------------------------------
  input  wire                      HCLK,         // AHB Clock
  input  wire                      HRESETn,      // AMBA AHB reset

  input  wire                      HSELS,        // Slave Select from AHB
  input  wire [31:0]               HADDRS,       // Address bus from AHB
  input  wire [1:0]                HTRANSS,      // Transfer type from AHB
  input  wire [2:0]                HBURSTS,      // Burst type from AHB
  input  wire [3:0]                HPROTS,       // Protection control from AHB
  input  wire                      HWRITES,      // Transfer direction from AHB
  input  wire [2:0]                HSIZES,       // Transfer size from AHB
  input  wire                      HMASTLOCKS,   // Locked Sequence from AHB
  input  wire                      HREADYS,      // Transfer done from AHB
  input  wire [63:0]               HWDATAS,      // Write data bus from AHB
  input  wire [HMASTER_WIDTH-1:0]  HMASTERS,     // Master number from AHB

  input  wire [31:0]               HRDATAM,      // Read data bus from slave
  input  wire                      HRESPM,       // Transfer response from slave
  input  wire                      HREADYOUTM,   // HREADY from 32-bit slave mux

  output wire [63:0]               HRDATAS,      // Read data bus to AHB
  output reg                       HRESPS,       // Transfer response to AHB
  output reg                       HREADYOUTS,   // HREADY feedback to AHB

  output wire                      HSELM,        // Slave Select to slave
  output wire [31:0]               HADDRM,       // Address bus to slave
  output reg  [1:0]                HTRANSM,      // Transfer type to slave
  output reg  [2:0]                HBURSTM,      // Burst type to slave
  output reg  [3:0]                HPROTM,       // Protection control to slave
  output reg                       HWRITEM,      // Transfer direction to slave
  output wire [2:0]                HSIZEM,       // Transfer size to slave
  output reg                       HMASTLOCKM,   // Locked Sequence to slave
  output wire [31:0]               HWDATAM,      // Write data bus to slave
  output wire                      HREADYM,      // Transfer done to slave
  output reg  [HMASTER_WIDTH-1:0]  HMASTERM);    // Master number to slave

  //---------------------------------------------------------------------------
  // Constant declarations
  //---------------------------------------------------------------------------

  // HTRANS transfer types
  localparam AHB_TRANS_IDLE        = 2'b00;      // Idle
  localparam AHB_TRANS_BUSY        = 2'b01;      // Busy
  localparam AHB_TRANS_NONSEQ      = 2'b10;      // Non-sequential
  localparam AHB_TRANS_SEQ         = 2'b11;      // Sequential

  // HRESP response type
  localparam AHB_RESP_OKAY         = 1'b0;       // OKAY
  localparam AHB_RESP_ERROR        = 1'b1;       // ERROR

  // HBURST transfer type encoding
  localparam AHB_BURST_SINGLE      = 3'b000;     // Single
  localparam AHB_BURST_INCR        = 3'b001;     // Incrementing (undefined length)
  localparam AHB_BURST_WRAP4       = 3'b010;     // Wrap (length 4)
  localparam AHB_BURST_INCR4       = 3'b011;     // Incrementing (length 4)
  localparam AHB_BURST_WRAP8       = 3'b100;     // Wrap (length 8)
  localparam AHB_BURST_INCR8       = 3'b101;     // Incrementing (length 8)
  localparam AHB_BURST_WRAP16      = 3'b110;     // Wrap (length 16)
  localparam AHB_BURST_INCR16      = 3'b111;     // Incrementing (length 16)

  // HSIZE encoding
  localparam AHB_SIZE_BYTE         = 3'b000;     // 8-bit
  localparam AHB_SIZE_HALF         = 3'b001;     // 16-bit
  localparam AHB_SIZE_WORD         = 3'b010;     // 32-bit
  localparam AHB_SIZE_DWORD        = 3'b011;     // 64-bit


  // Downsizer Burst Cancelling FSM
  localparam BERR_FSM_NORMAL       = 2'b00;      // No error
  localparam BERR_FSM_ERROR1       = 2'b01;      // First error cycle
  localparam BERR_FSM_ERROR2       = 2'b10;      // Second error cycle
  localparam BERR_FSM_BUSY         = 2'b11;      // Response to BUSY during burst with errors

  // Downsizer fragmenter FSM
  localparam DS_FSM_IDLE           = 3'b000;     // No action
  localparam DS_FSM_CYC1           = 3'b001;     // First half of 64-bit transfer
  localparam DS_FSM_CYC2           = 3'b010;     // Second half of 64-bit transfer
  localparam DS_FSM_DELAY          = 3'b011;     // Delay after aborted sequence
  localparam DS_FSM_ABORT          = 3'b101;     // Aborted transfer (ERROR)

  //---------------------------------------------------------------------------
  // Signal declarations
  //---------------------------------------------------------------------------
  // FSM Burst Cancelling signals
  reg [1:0]     berr_current_state;  //  Burst Cancelling Current State
  reg [1:0]     berr_next_state;     //  Burst Cancelling Next State
  reg           reg_seq_to_nseq;     //  Convert SEQ to NSEQ if rest of burst is not block on error
  reg           nxt_seq_to_nseq;     //  Convert SEQ to NSEQ if rest of burst is not block on error

  // FSM Fragmenter signals
  reg [2:0]     dsc_current_state;   //  Fragmenter Current State
  reg [2:0]     ds_next_state;       //  Fragmenter Next State

  // Downsizer inputs & outputs connect to error cancel block (DSIN suffix)
  reg           hsel_ds_in;          //  HSELS cancelled by ERROR
  reg [1:0]     htrans_ds_in;        //  HTRANSS cancelled by ERROR
  reg           hready_ds_out;       //  from DS to burst error handling

  // NSEQ and SEQ transfer detection signal
  reg           htrans_ds_active;    //  htrans_ds_in is NONSEQ or SEQ

  // Detection of double-word WRAP16 boundary
  wire          next_wrapped;        //  Next transfer will be across wrap boundary
  reg           wrapped;             //  Current transfer is across wrap boundary

  // Disable blocking when transfer is 32/16/8-bit
  reg           block_disable;       //  Indicates data-phase of double-word
                                     //  transfer
  wire          next_block_disable;  //  Address phase of double-word transfer

  // Stored transfer control information
  reg [31:0]    haddr_reg;          //  Registered HADDRS
  reg [2:0]     haddr_i16_reg;      //  Registered address bits for INCR16
                                    //  translation
  reg           htrans0_reg;        //  Register HTRANSS[0]
  reg [2:0]     hsize_reg;          //  Registered HSIZES
  reg [2:0]     hburst_reg;         //  Registered HBURSTS
  reg [3:0]     hprot_reg;          //  Registered HPROTS
  reg           hwrite_reg;         //  Registered HWRITES
  reg           hmastlock_reg;      //  Registered HMASTLOCKS
  reg [HMASTER_WIDTH-1:0] hmaster_reg;  //  Master number to slave

  wire          haddr_i16_reg_en;   //  Register enable for haddr_i16_reg
  wire [2:0]    haddr_i16_bound;    //  INCR16 adress boundary

  // Burst size mapping logic
  reg [2:0]     hburst_mapped;      //  Logic output
  reg [2:0]     hburst_mapped_reg;  //  Registered version

  // Output to 32-bit side (for internal read back)
  reg [31:0]    i_haddr_m;          //  Internal version of HADDR output
  wire          i_hready_m;         //  Internal version of HREADYM output
  reg           i_hsel_m;           //  Internal version of SELM output

  // Data path mux (Funnel) signals
  reg           fwd_mux_ctrl;       //  mux ctrl for write data switching
  reg [31:0]    hrdata_reg;         //  storage for first word read
  reg           frd_mux_ctrl;       //  mux ctrl for read data switching
  reg           next_frd_mux_ctrl;  //  D-input of frd_mux_ctrl

  // Ready flags
  wire          s_not_sel_nxt;      //  D-input for s_not_sel
  reg           s_not_sel;          //  Slave-port not selected
  wire          m_not_sel_nxt;      //  D-input for m_not_sel
  reg           m_not_sel;          //  Master-port not selected

  //---------------------------------------------------------------------------
  // Beginning of main code
  //---------------------------------------------------------------------------

  //---------------------------------------------------------------------------
  // Burst Error Handling
  //---------------------------------------------------------------------------
  // finite state machine combinatorial part
  always @ (HTRANSS or HSELS or HREADYS or HRESPM or HREADYOUTM or berr_current_state or
            block_disable)
    begin : p_berrcomb
      if ((~HSELS) & HREADYS)
        berr_next_state = BERR_FSM_NORMAL;
      else
        begin
          case (berr_current_state)
            BERR_FSM_NORMAL :
              begin
                if (block_disable) // block_disable is a data phase signal
                  // No blocking for 32/16/8 bit transfer if ERR_BURST_BLOCK_ALL is 0
                  berr_next_state = BERR_FSM_NORMAL;
                else if ((HRESPM == AHB_RESP_ERROR) & (~HREADYOUTM))
                  // 2nd cycle of err resp on AHB-S interface
                  berr_next_state = BERR_FSM_ERROR2;
                else
                  berr_next_state = BERR_FSM_NORMAL;
              end

            BERR_FSM_ERROR1 :
              begin
                // 1st cycle of err response
                // - Goto 2nd cyc of err resp
                berr_next_state = BERR_FSM_ERROR2;
              end

            BERR_FSM_ERROR2, BERR_FSM_BUSY:
              begin // 2nd cycle of error response, or data phase of a busy transfer
                // BERR_FSM_ERROR2 or BERR_FSM_BUSY
                if (HTRANSS == AHB_TRANS_SEQ)
                  berr_next_state = BERR_FSM_ERROR1;
                // 1st cyc of err resp
                else if (HTRANSS == AHB_TRANS_BUSY)
                  berr_next_state = BERR_FSM_BUSY;
                // okay resp for busy
                else // NSEQ transfer or IDLE
                  berr_next_state = BERR_FSM_NORMAL;
              end
            default :
              berr_next_state = {2{1'bx}};
          endcase
        end
    end

  // finite state machine sequential part
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_berrseq
      if (~HRESETn)
        berr_current_state <= BERR_FSM_NORMAL;
      else
        berr_current_state <= berr_next_state;
    end

  // After error, indicate there is a remaining burst, so that the remaining SEQ
  // transfers can be handled correctly. If ERR_BURST_BLOCK_ALL==1, then this logic
  // is not required (tie low)
  always @(HRESPM or HREADYOUTM or HTRANSS or HSELS or HREADYS or reg_seq_to_nseq)
    begin
    if ((HTRANSS==AHB_TRANS_IDLE)|(HTRANSS==AHB_TRANS_NONSEQ)|((~HSELS) & HREADYS))
      nxt_seq_to_nseq = 1'b0; // clear if next transfer is not SEQ/BUSY, or device not selected
    else if ((HRESPM==AHB_RESP_ERROR) & (~HREADYOUTM) & (ERR_BURST_BLOCK_ALL==1'b0))
      nxt_seq_to_nseq = 1'b1; // Set to one in first cycle of error response
    else
      nxt_seq_to_nseq = reg_seq_to_nseq; // not change
    end

  // Registering nxt_seq_to_nseq into reg_seq_to_nseq
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_burst_err_continue
      if (~HRESETn)
        reg_seq_to_nseq <= 1'b0;
      else if (ERR_BURST_BLOCK_ALL==1'b0)  // if ERR_BURST_BLOCK_ALL is 1,
      // all remaining transfers in the burst will be blocked so no need for special handling
        reg_seq_to_nseq <= nxt_seq_to_nseq;
    end

  //---------------------------------------------------------------------------
  // Assign Downsizer Input/Outputs connection to ERROR-blocking block.
  //---------------------------------------------------------------------------
  // Generate hsel_ds_in and htrans_ds_in
  // Block transfers (if selected)
  // - in first cycle of error response (data phase) in subsequent SEQ
  // - in 2nd cycle of error cycle, or data phase of BUSY, if transfer is SEQ or BUSY
  // Otherwise propagate HSELS and HTRANSS
  always @ (berr_current_state or HTRANSS or HSELS)
    begin : p_hstdsin
      if (((berr_current_state == BERR_FSM_ERROR1) |
          ((berr_current_state !=BERR_FSM_NORMAL) & (HTRANSS !=AHB_TRANS_NONSEQ))
          ) & HSELS)
        begin  // Blocking in place
          hsel_ds_in = 1'b0;
          htrans_ds_in = AHB_TRANS_IDLE;
        end
      else
        begin  // No blocking
          hsel_ds_in = HSELS;
          // force to IDLE when HSELS LOW to avoid breaking protocol on master side
          htrans_ds_in = HTRANSS & {2{HSELS}};
        end
    end

  // Responses mux
  always @ (berr_current_state or hready_ds_out or HRESPM)
    begin : p_berr_resp
    // Note: Insertion of waitstate for delayed transfer and 64-bit transfer is done
    // in process : p_hreadyouts (hready_ds_out generation)
      case (berr_current_state)

        BERR_FSM_NORMAL :
          begin
            HREADYOUTS = hready_ds_out;
            HRESPS = HRESPM;
          end

        BERR_FSM_ERROR1 :
          begin
            // 1st cycle of error response
            HREADYOUTS = 1'b0;
            HRESPS = AHB_RESP_ERROR;
          end

        BERR_FSM_ERROR2 :
          begin
            // 2nd cycle of error response
            HREADYOUTS = 1'b1;
            HRESPS = AHB_RESP_ERROR;
          end

        BERR_FSM_BUSY:
          begin
            // response to busy cycle
            HREADYOUTS = 1'b1;
            HRESPS = AHB_RESP_OKAY;
          end

        default:
          begin
            HREADYOUTS = 1'bx;
            HRESPS = 1'bx;
          end
      endcase
    end

  //---------------------------------------------------------------------------
  //  Downsizer - fragmentor
  //---------------------------------------------------------------------------
  // Store Register transfer info. They are used when
  // - dealing with 64-bit transfers
  // - delayed transfer (after IDLE insertion following an error, and if a transfer has been received)
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_store_ctrls
      if (~HRESETn)
        begin
          haddr_reg        <= {32{1'b0}};
          htrans0_reg      <= 1'b0;
          hsize_reg        <= {3{1'b0}};
          hburst_reg       <= {3{1'b0}};
          hburst_mapped_reg<= {3{1'b0}};
          hprot_reg        <= {4{1'b0}};
          hwrite_reg       <= 1'b0;
          hmastlock_reg    <= 1'b0;
          hmaster_reg      <= {HMASTER_WIDTH{1'b0}};
        end
      else
        begin
          if (HREADYS)
            begin
              haddr_reg        <= HADDRS;
              htrans0_reg      <= HTRANSS[0];
              hsize_reg        <= HSIZES;
              hburst_reg       <= HBURSTS;
              hburst_mapped_reg<= hburst_mapped;
              hprot_reg        <= HPROTS;
              hwrite_reg       <= HWRITES;
              hmastlock_reg    <= HMASTLOCKS;
              hmaster_reg      <= HMASTERS;
            end
        end
    end

  // Detect if transfer is active
  always @ (htrans_ds_in)
    begin : p_trans_active
      if ((htrans_ds_in == AHB_TRANS_NONSEQ) | (htrans_ds_in == AHB_TRANS_SEQ))
        htrans_ds_active = 1'b1;
      else
        htrans_ds_active = 1'b0;
    end

  // Enable to register the relevant address bits during the first transfer of a
  // 64-bit INCR16 burst
  assign haddr_i16_reg_en = (HREADYS & hsel_ds_in & (htrans_ds_in == AHB_TRANS_NONSEQ) &
                            (HBURSTS == AHB_BURST_INCR16));

  // Store address bits for INCR16
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_store_i16addr
      if (~HRESETn)
        haddr_i16_reg <= {3{1'b0}};
      else
        if (haddr_i16_reg_en)
          haddr_i16_reg <= HADDRS[5:3];
    end

  //---------------------------------------------------------------------------
  // Downsizer FSM combinational section
  //---------------------------------------------------------------------------
  always @ (dsc_current_state or hsel_ds_in or HSIZES or hsize_reg or i_hready_m or
            HRESPM or HREADYS or htrans_ds_active)
    begin : p_ds_fsm_comb
      case (dsc_current_state)

        DS_FSM_IDLE :
          begin
            if (HRESPM == AHB_RESP_ERROR)
              begin
                ds_next_state = DS_FSM_ABORT;
              end
            else if (hsel_ds_in & HREADYS)
              begin  // htrans_ds_in = htrans_ds_in[1]
                if ((HSIZES == AHB_SIZE_DWORD) & htrans_ds_active)
                  begin
                    ds_next_state = DS_FSM_CYC1;
                    // goto do first part of transfer
                  end
                else
                  begin
                    ds_next_state = DS_FSM_IDLE;
                    //32/16/8bit or idle/busy
                  end
              end
            else
              begin
                ds_next_state = DS_FSM_IDLE;
              end
          end

        DS_FSM_CYC1 :
          begin
            // first half of the 64-bit transfer (data phase)
            if (HRESPM == AHB_RESP_ERROR)
              begin
                ds_next_state = DS_FSM_ABORT;
                // make sure IDLE is inserted
              end
            else if (i_hready_m)
              begin
                ds_next_state = DS_FSM_CYC2;
                // goto 2nd half of the transfer
              end
            else
              begin
                ds_next_state = DS_FSM_CYC1;
                // wait until 1st half finish
              end
          end

        DS_FSM_CYC2 :
          begin
            // second half of 64-bit transfer
            if (HRESPM == AHB_RESP_ERROR)
              begin
                ds_next_state = DS_FSM_ABORT;
                // make sure IDLE is inserted by abort
              end
            else if (i_hready_m)
              begin
                // Current transfer finished
                if (hsel_ds_in)
                  begin
                    // Downsizer selected
                    if ((HSIZES == AHB_SIZE_DWORD) & htrans_ds_active)
                      begin
                        ds_next_state = DS_FSM_CYC1;
                        // start 1st half of 64bit transfer
                      end
                    else
                      begin
                        ds_next_state = DS_FSM_IDLE;
                      end
                  end
                else
                  begin
                    ds_next_state = DS_FSM_IDLE;
                    // Downsizer not selected
                  end
              end
            else
              begin
                ds_next_state = DS_FSM_CYC2;
                // wait until current transfer finish
              end
          end

        DS_FSM_ABORT :
          begin
            // 2nd cycle of error response in AHB-Master.
            // Idle transfer is inserted to AHB-Master. HREADYS should be 1
            if (hsel_ds_in & htrans_ds_active)
              ds_next_state = DS_FSM_DELAY;
            // insert idle cycle and delay next
            // transfer by 1 cycle
            else
              begin
                ds_next_state = DS_FSM_IDLE;
                // device not selected
              end
          end

        DS_FSM_DELAY :
          begin
            // delayed address phase after a 2 cycle response
            if (hsize_reg == AHB_SIZE_DWORD)
              begin
                // determine hsize by stored info
                ds_next_state = DS_FSM_CYC1;
                // goto 1st half of 64-bit transfer
              end
            else
              begin
                ds_next_state = DS_FSM_IDLE;
                // 32/16/8-bit transfer
              end
          end

        3'b100, 3'b110, 3'b111:
          begin
            ds_next_state = DS_FSM_IDLE;
            // Unused case
          end
        default:
          begin
            ds_next_state = 3'bxxx;
            // default case
          end
      endcase
    end

  // Downsizer state machine sequential section
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_ds_fsm_seq
      if (~HRESETn)
        dsc_current_state <= DS_FSM_IDLE;
      else
        dsc_current_state <= ds_next_state;
    end

  //---------------------------------------------------------------------------
  // Generate disabling logic for burst blocking (error handling) feature
  //---------------------------------------------------------------------------
  // If transfer is active/busy, and if
  //  - size is double word, or
  //  - block all size option is set
  assign  next_block_disable = ((HTRANSS!=AHB_TRANS_IDLE) &
          ((HSIZES == AHB_SIZE_DWORD)|(ERR_BURST_BLOCK_ALL!=1'b0))) ? 1'b0 : 1'b1;

  // Sequential process - data phase on AHB-S
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_disable_seq
    if (~HRESETn)
      block_disable <= 1'b1;
    else if (HREADYS)
      block_disable <= next_block_disable;
    end

  //---------------------------------------------------------------------------
  // HSEL handling
  //---------------------------------------------------------------------------
  always @ (dsc_current_state or hsel_ds_in)
    begin : p_i_hsel_m
      if ((dsc_current_state == DS_FSM_CYC1) | (dsc_current_state == DS_FSM_DELAY))
        begin
          i_hsel_m = 1'b1;
        end
      else
        begin
          i_hsel_m = hsel_ds_in;
        end
    end

  // Connect HSEL to top level
  assign HSELM = i_hsel_m;

  //---------------------------------------------------------------------------
  // HTRANS handling
  //---------------------------------------------------------------------------
  // Detect when a double-word WRAP16 burst wraps the address, or a double-word
  // INCR16 passes the 16-word boundary: in the case of a re-built burst, this
  // transfer must then be degraded SEQ->NONSEQ, BUSY->IDLE

  // INCR16 boundary address detection: add 7 to base address to detect that the
  // 8th 64-bit transfer is next
  wire[3:0]     temp_add_result = (haddr_i16_reg + 3'b111);
  assign haddr_i16_bound = temp_add_result[2:0];

  // Determine when to over-ride HTRANS
  assign next_wrapped = (
                        (
                         // For WRAP16, look for the 0x80 address boundary
                         (htrans_ds_active &
                          (HADDRS[6:3]== 4'b1111) & (HBURSTS == AHB_BURST_WRAP16)) |
                         // For INCR16, look for the 8th 64-bit transfer
                         ((htrans_ds_in == AHB_TRANS_SEQ) &
                          (HADDRS[5:3]== haddr_i16_bound) &
                          (HBURSTS == AHB_BURST_INCR16))
                         ) ? 1'b1 :
                        ((htrans_ds_in == AHB_TRANS_BUSY) ? wrapped : 1'b0)
                        );

  // Assign wrapped in relevant cycle
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_wrapped
      if (~HRESETn)
        wrapped <= 1'b0;
      else
        if (HREADYS)
          wrapped <= next_wrapped;
    end

  // Override HTRANSM as necessary
  always @ (dsc_current_state or htrans_ds_in or
            wrapped or reg_seq_to_nseq or HSIZES or HSELS)
    begin : p_htrans
      if (dsc_current_state == DS_FSM_CYC1)
        begin
          // 2nd half of a 64-bit transfer is always SEQ
          HTRANSM = AHB_TRANS_SEQ;
        end

      else if (dsc_current_state == DS_FSM_ABORT)
        begin  // force to IDLE when abort on 64-bit transfers
          HTRANSM = AHB_TRANS_IDLE;
        end

      else if (dsc_current_state == DS_FSM_DELAY)
        begin
          // Arrive here only when a N-SEQ transfer required after an abort.
          // Output transfer information from storage register.
          // Wait state is asserted this cycle
          HTRANSM = AHB_TRANS_NONSEQ;
        end

      else if ((wrapped & (HSIZES == AHB_SIZE_DWORD) & HSELS))
        begin
          // Wrap16, Incr16 special case: degrade SEQ->NONSEQ, BUSY->IDLE when
          // the transfer crosses the wrap boundary (Wrap16) or the Incr16-word
          // boundary
          HTRANSM[1] = htrans_ds_in[1];
          HTRANSM[0] = 1'b0;
        end

      else
        begin
          // Default for normal operation (i.e. no doubleword access being
          // processed)
          HTRANSM[1] = htrans_ds_in[1];
          HTRANSM[0] = htrans_ds_in[0] & (~reg_seq_to_nseq);
        end
    end

  //---------------------------------------------------------------------------
  // HADDR generation
  //---------------------------------------------------------------------------
  always @ (dsc_current_state or HADDRS or haddr_reg)
    begin : p_haddr
      if (dsc_current_state == DS_FSM_DELAY)
          i_haddr_m = haddr_reg;
          // After an abort, transfer info
          // come from register
      else if (dsc_current_state == DS_FSM_CYC1)
          i_haddr_m = {haddr_reg[31:3],1'b1,haddr_reg[1:0]};
          // 2nd half of 64bit transfers
      else
          i_haddr_m = HADDRS;
    end

  assign HADDRM = i_haddr_m;
  // connect to top level (32-bit side)

  //---------------------------------------------------------------------------
  // HBURST mapping
  //---------------------------------------------------------------------------
  always @ (HBURSTS)
    begin : p_burstmap
      case (HBURSTS)
        AHB_BURST_WRAP4 : begin
          hburst_mapped = AHB_BURST_WRAP8;
        end
        AHB_BURST_INCR4 : begin
          hburst_mapped = AHB_BURST_INCR8;
        end
        AHB_BURST_WRAP8 : begin
          hburst_mapped = AHB_BURST_WRAP16;
        end
        AHB_BURST_INCR8 : begin
          hburst_mapped = AHB_BURST_INCR16;
        end
        AHB_BURST_WRAP16 : begin
          hburst_mapped = AHB_BURST_INCR;
        end
        AHB_BURST_INCR16 : begin
          hburst_mapped = AHB_BURST_INCR16;
        end
        AHB_BURST_INCR : begin
          hburst_mapped = AHB_BURST_INCR;
        end
        default: begin
          hburst_mapped = AHB_BURST_INCR;
          // single mapped to incr
        end
      endcase
    end

  // HBURST handling
  always @ (dsc_current_state or hburst_mapped or hburst_reg or HBURSTS or htrans0_reg or
            hburst_mapped_reg or HSIZES or hsize_reg or HSELS or reg_seq_to_nseq or htrans_ds_in)
    begin : p_hburstm
      if (reg_seq_to_nseq & (ERR_BURST_BLOCK_ALL==1'b0) & (htrans_ds_in[0]|
          ((dsc_current_state == DS_FSM_DELAY) & htrans0_reg))) // after error,
        // if burst is allowed to continue (ERR_BURST_BLOCK_ALL==0),
        // convert rest of burst from SEQ to NSEQ-INCR
        // if transfer is nseq (htrans_ds_in[0]==0), not need to change
        begin
        HBURSTM = AHB_BURST_INCR;
        end
      else if (dsc_current_state == DS_FSM_DELAY)
        begin
          if (hsize_reg == AHB_SIZE_DWORD)
            begin
              HBURSTM = hburst_mapped_reg;
              // Stored mapped value is used
            end
          else
            begin
              HBURSTM = hburst_reg;
              // No mapping required for 32/16/8-bit
            end
        end
      else if (dsc_current_state == DS_FSM_CYC1)
        begin
          // for 2nd half of 64-bit transfers
          HBURSTM = hburst_mapped_reg;
        end
      else
        begin
          if ((HSIZES == AHB_SIZE_DWORD) & HSELS)
            begin
              HBURSTM = hburst_mapped;
              // 64-bit transfer require mapping
            end
          else
            begin
              HBURSTM = HBURSTS;
              // no mapping required for 32/16/8 bit transfers
            end
        end
    end

  //---------------------------------------------------------------------------
  // Other Control signals generation
  //---------------------------------------------------------------------------
  // HPROT handling
  always @ (dsc_current_state or hprot_reg or HPROTS)
    begin : p_hprotm
      if ((dsc_current_state == DS_FSM_CYC1) | (dsc_current_state == DS_FSM_DELAY))
        begin
          HPROTM = hprot_reg;
        end
      else
        begin
          HPROTM = HPROTS;
        end
    end

  // HWRITE handling
  always @ (dsc_current_state or hwrite_reg or HWRITES)
    begin : p_hwritem
      if ((dsc_current_state == DS_FSM_CYC1) | (dsc_current_state == DS_FSM_DELAY))
        begin
          HWRITEM = hwrite_reg;
        end
      else
        begin
          HWRITEM = HWRITES;
        end
    end

  // HMASTLOCK handling
  always @ (dsc_current_state or hmastlock_reg or HMASTLOCKS)
    begin : p_hmastlockm
      if ((dsc_current_state == DS_FSM_CYC1) | (dsc_current_state == DS_FSM_DELAY))
        begin
          HMASTLOCKM = hmastlock_reg;
        end
      else
        begin
          HMASTLOCKM = HMASTLOCKS;
        end
    end

  // HSIZE handling
  reg [2:0] i_hsize_m;
  always @ (dsc_current_state or HSIZES or hsize_reg or HSELS)
    begin : p_hsizem
      if ((dsc_current_state == DS_FSM_CYC1) | (dsc_current_state == DS_FSM_DELAY))
        begin
          i_hsize_m = hsize_reg;
        end
      else
        begin
          i_hsize_m = HSIZES;
        end
    end
  // turn 64-bit into 32-bit
  assign HSIZEM = (i_hsize_m == AHB_SIZE_DWORD) ? AHB_SIZE_WORD : i_hsize_m;

  // HMASTER handling
  always @ (dsc_current_state or hmaster_reg or HMASTERS)
    begin : p_hmasterm
      if ((dsc_current_state == DS_FSM_CYC1) | (dsc_current_state == DS_FSM_DELAY))
        begin
          HMASTERM = hmaster_reg;
        end
      else
        begin
          HMASTERM = HMASTERS;
        end
    end

  // ---------------------------------------------------------------------------
  // HREADY flag generation
  // ---------------------------------------------------------------------------

  // s_not_sel ("Slave-port Not Selected") causes the HREADYOUTS output to be
  // driven high when this slave region is not yet selected
  assign s_not_sel_nxt = ((HSELS & HREADYS) ? 1'b0
                       : (((~HSELS) & HREADYS) ? 1'b1
                          : s_not_sel)
                       );

  // m_not_sel ("Master-port Not Selected") causes the HREADYM output to be
  // driven from the slave port when this slave region is not yet selected
  assign m_not_sel_nxt = ((i_hsel_m & i_hready_m) ? 1'b0
                       : (((~i_hsel_m) & i_hready_m) ? 1'b1
                          : m_not_sel)
                       );

  // HREADY control registers
  always@(negedge HRESETn or posedge HCLK)
    begin : p_hreadyseq
      if (~HRESETn)
        begin
          s_not_sel <= 1'b1;
          m_not_sel <= 1'b1;
        end
      else
        begin
          s_not_sel <= s_not_sel_nxt;
          m_not_sel <= m_not_sel_nxt;
        end
    end

  //---------------------------------------------------------------------------
  // HREADYOUTS generation
  //---------------------------------------------------------------------------
  // Force HREADY(64) output to low after an IDLE is inserted to 32-bit AHB
  // due to an error response so that 32-bit bus can catch up.
  // Also force it to low during first half of 64-bit transfer
  // so that 64-bit transfer can end when second half finished.
  // Force HREADY output high when this slave region is not selected.
  always @ (dsc_current_state or HREADYOUTM or s_not_sel or m_not_sel)
    begin : p_hreadyouts
      if ((dsc_current_state == DS_FSM_DELAY) | (dsc_current_state == DS_FSM_CYC1))
        hready_ds_out = 1'b0;
      else if (s_not_sel | m_not_sel)
        hready_ds_out = 1'b1;
      else
        hready_ds_out = HREADYOUTM;
    end

  //---------------------------------------------------------------------------
  // HREADYM generation
  //---------------------------------------------------------------------------
  assign i_hready_m = (m_not_sel ? HREADYS : HREADYOUTM);

  // Connect to top level
  assign HREADYM  = i_hready_m;

  //---------------------------------------------------------------------------
  // Write data MUX
  //---------------------------------------------------------------------------
  // Write Data path mux ctrl
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_data_muxctrl
      if (~HRESETn)
        begin
          fwd_mux_ctrl <= 1'b0;
          // 64-bit side selected
        end
      else
        begin
          if (i_hready_m)
            begin
              fwd_mux_ctrl <= i_haddr_m[2];
            end
        end
    end

  // Route data bus
  assign HWDATAM = (fwd_mux_ctrl ? HWDATAS[63:32] : HWDATAS[31:0]);

  //---------------------------------------------------------------------------
  // Read data MUX
  //---------------------------------------------------------------------------
  // Write Data path mux ctrl
  always @ (HSIZES or htrans_ds_in)
    begin : p_readmuxcomb
      if ((HSIZES == AHB_SIZE_DWORD) &
          ((htrans_ds_in == AHB_TRANS_NONSEQ) | (htrans_ds_in == AHB_TRANS_SEQ))
          )
        begin
          next_frd_mux_ctrl = 1'b1;
        end
      else
        begin
          next_frd_mux_ctrl = 1'b0;
        end
    end

  // p_ReadMUXComb
  // Sequential process
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_readmuxseq
      if (~HRESETn)
        begin
          frd_mux_ctrl <= 1'b0;
        end
      else
        begin
          if (HREADYS)
            begin
              frd_mux_ctrl <= next_frd_mux_ctrl;
            end
        end
    end

  // Route data bus
  assign HRDATAS = (frd_mux_ctrl ? {HRDATAM,hrdata_reg} : {HRDATAM,HRDATAM});

  //---------------------------------------------------------------------------
  // Generate "hrdata_reg" register to hold first half of 64-bit read data
  //---------------------------------------------------------------------------
  always @ (posedge HCLK or negedge HRESETn)
    begin : p_hrdataseq
      if (~HRESETn)
        hrdata_reg <= {32{1'b0}};
      else
        if (i_hready_m)
          hrdata_reg <= HRDATAM;
    end

 // --------------------------------------------------------------------------------
 // Assertion properties
 // --------------------------------------------------------------------------------

`ifdef ARM_AHB_ASSERT_ON
`include "std_ovl_defines.h"


   // 8-bit, 16-bit and 32-bit transfer no change - HTRANS
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HTRANS mismatch for narrow transfers")
    u_ovl_ahb_8_16_32_no_change_htrans (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1] & (HSIZES!=3'b011) &
                      (dsc_current_state != DS_FSM_ABORT) & (berr_current_state==BERR_FSM_NORMAL) &
                      (reg_seq_to_nseq==1'b0)),
    .consequent_expr (HTRANSS==HTRANSM)
    );

   // 64-bit transfer might be changed at wrap boundary - HTRANS
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HTRANS mismatch for wide transfers")
    u_ovl_ahb_64_htrans (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1] & (HSIZES==3'b011) &
                      (dsc_current_state != DS_FSM_ABORT) & (berr_current_state==BERR_FSM_NORMAL)),
    .consequent_expr (HTRANSS[1]==HTRANSM[1])
    );

   // If there has been an error response, transfer is delayed
   assert_next
    #(`OVL_ERROR, 1,1,0, `OVL_ASSERT, "HTRANS mismatch for delayed transfers")
    u_ovl_ahb_htrans_delayed (
    .clk (HCLK), .reset_n (HRESETn),
    .start_event (HSELS & HREADYS & HTRANSS[1] & (HRESPS==1'b1) & (berr_current_state==BERR_FSM_NORMAL)),
    .test_expr (HTRANSM[1])
    );

   // 8-bit, 16-bit , 32-bit and 64-bit transfers no change - HADDRS
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HADDRS mismatch")
    u_ovl_ahb_8_16_32_no_change_haddr (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1]),
    .consequent_expr (HADDRS==HADDRM)
    );

   // 8-bit, 16-bit and 32-bit transfer no change - HSIZES
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HSIZES mismatch for narrow transfer")
    u_ovl_ahb_8_16_32_no_change_hsize (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1] & (HSIZES!=3'b011)),
    .consequent_expr (HSIZES==HSIZEM)
    );

   // 64-bit transfer change - HSIZES
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HSIZES mismatch for wide (64 bit) transfer")
    u_ovl_ahb_64_change_hsize (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1] & (HSIZES==3'b011)),
    .consequent_expr (HSIZEM==3'b010)
    );

   // 8-bit, 16-bit and 32-bit transfer no change - HBURST
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HBURST mismatch for narrow transfer")
    u_ovl_ahb_8_16_32_no_change_hburst (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1] & (HSIZES!=3'b011) & (~reg_seq_to_nseq)),
    .consequent_expr (HBURSTS==HBURSTM)
    );

   // 64-bit transfer remapped - HBURST
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HBURST mismatch for 64-bit transfer")
    u_ovl_ahb_64_change_hburst (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1] & (HSIZES==3'b011)),
    .consequent_expr (HBURSTM==hburst_mapped)
    );

   // All transfer no change - HPROT
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HPROT mismatch")
    u_ovl_ahb_all_no_change_hprot (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1] ),
    .consequent_expr (HPROTS==HPROTM)
    );

   // All transfer no change - HWRITE
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HWRITE mismatch")
    u_ovl_ahb_all_no_change_hwrite (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1]),
    .consequent_expr (HWRITES==HWRITEM)
    );

   // All transfer no change - HREADY
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "HREADY mismatch")
    u_ovl_ahb_all_no_change_hready (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (HSELS & HREADYS & HTRANSS[1]),
    .consequent_expr (HREADYS==HREADYM)
    );

  // Check FSM cannot enter illegal state
   assert_never
    #(`OVL_ERROR, `OVL_ASSERT, "dsc_current_state in illegal state")
    u_ovl_dsc_current_state_illegal_state (
    .clk (HCLK), .reset_n (HRESETn),
    .test_expr ((dsc_current_state==3'b100)|(dsc_current_state==3'b110)|(dsc_current_state==3'b111))
    );

   // Downstream AHB slave must respond with OKAY when not selected
   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "Downstream AHB slave must response with OKAY when not selected")
    u_ovl_ahb_m_hresp (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (m_not_sel),
    .consequent_expr (HRESPM==AHB_RESP_OKAY)
    );

   assert_implication
    #(`OVL_ERROR, `OVL_ASSERT, "Downstream AHB slave must response with READY when not selected")
    u_ovl_ahb_m_hreadyout (
    .clk (HCLK), .reset_n (HRESETn),
    .antecedent_expr (m_not_sel),
    .consequent_expr (HREADYOUTM)
    );

`endif

endmodule
