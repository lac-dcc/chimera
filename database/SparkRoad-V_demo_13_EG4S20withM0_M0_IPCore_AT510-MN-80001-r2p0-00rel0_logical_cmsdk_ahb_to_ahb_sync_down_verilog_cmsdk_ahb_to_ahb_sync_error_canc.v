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
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
//  Abstract             : Error Canc - Burst Error Cancelling gasket. If during
//                        a burst an error response is received then this block
//                        will abort the burst respond with error to any further
//                        transfers in the burst.
//============================================================================--

module cmsdk_ahb_to_ahb_sync_error_canc
  (
//------------------------------------------------------------------------------
// Port Declarations
//------------------------------------------------------------------------------

  // Global signals ------------------------------------------------------------
  input  wire        HCLK,       // bus clock
  input  wire        HCLKEN,     // clock enable
  input  wire        HRESETn,    // reset

  // AHB1 inputs ---------------------------------------------------------------
  input  wire  [1:0] HTRANSS,    // transfer type,

  // AHB1 outputs  -------------------------------------------------------------
  output reg         HREADYOUTS, // transfer done
  output reg         HRESPS,     // slave response

  // AHB2 outputs  -------------------------------------------------------------
  output reg   [1:0] HTRANSM,    // transfer type,

  // AHB2 inputs  --------------------------------------------------------------
  input  wire        HREADYM,    // transfer done
  input  wire        HRESPM);    // slave response

//------------------------------------------------------------------------------
// Overview
//------------------------------------------------------------------------------
//
//              +------------+
//    AHB1  +---+ ErrorCanc  +---+ AHB2
//              +------------+
//    HCLK                         HCLK
//
//
// Purpose
// =======
//
// When an AHB master receives an ERROR response from a slave, it can either
// continue with the next transfer or abort the current transfer (and burst) by
// driving HTRANS to IDLE in the 2nd cycle of the ERROR response. As a
// registered bridge or slave gasket cannot predict the master's action
// early enough, it must assume that the master either continues or aborts. This
// block is necessary to support masters that do not exhibit the expected ERROR
// behaviour. i.e. if the master aborts when the gasket or bridge has continued
// with the next transfer or vice versa.
//
// Connection
// ==========
//
// The ErrorCanc block can act as either a master or slave gasket to a
// registered bridge or other gasket interface. If the associated bridge/gasket
// aborts bursts by default then the ErrorCanc block should be placed before it:
//
//   AHB1 -->ErrorCanc --> Bridge --> AHB2
//
// If the bridge/gasket continues bursts by default then the ErrorCanc block
// should be placed after it:
//
//   AHB1 --> Bridge --> ErrorCanc --> AHB2
//
//
// Operation
// =========
//
// When the ErrorCanc block recieves an ERROR response from the slave on AHB2
// it responds with an ERROR to each further transfer in the burst and drives
// IDLE on HTRANSM until the burst on AHB1 is complete.
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Constant declarations
//------------------------------------------------------------------------------

  // HTRANS transfer type signal encoding
  localparam TRN_IDLE         = 2'b00;   // idle transfer
  localparam TRN_BUSY         = 2'b01;   // busy transfer
  localparam TRN_NONSEQ       = 2'b10;   // non-sequential
  localparam TRN_SEQ          = 2'b11;   // sequential

  // HRESP signal encoding
  localparam RSP_OKAY         = 1'b0;    // okay response
  localparam RSP_ERROR        = 1'b1;    // error response

  // Error Canc block control States
  localparam ST_CONTROL_IDLE  = 1'b0;      // pass through HTRANS
  localparam ST_CONTROL_ERROR = 1'b1;     // drive HTRANS

  // Error Response Generation States
  localparam ST_GEN_IDLE      = 2'b01;
  localparam ST_GEN_ERROR1    = 2'b10;
  localparam ST_GEN_ERROR2    = 2'b11;

//------------------------------------------------------------------------------
// Signal declarations
//------------------------------------------------------------------------------

  // Control State Machine Signals
  reg            next_control_state;
  reg            control_state;

  // Error Response Generation States
  reg    [1:0]   next_gen_state;
  reg    [1:0]   gen_state;

  // Burst Transfer is true when HTRANS is BUSY or SEQ
  wire           burst_transfer;

  // Generated HREADYOUTS and HRESPS responses to AHB1
  wire           gen_hready_outs;
  wire           gen_hresps;

//------------------------------------------------------------------------------
// Beginning of main code
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Input Interface Logic
//------------------------------------------------------------------------------

  // burst_transfer indicates the current transfer is part of a burst

  assign burst_transfer = ((HTRANSS ==TRN_BUSY) | (HTRANSS ==TRN_SEQ));

//------------------------------------------------------------------------------
// Control State Machine
//------------------------------------------------------------------------------

  always @ (HRESPM or burst_transfer or control_state or gen_hready_outs)
    begin : p_control_state_comb
      case (control_state)
        ST_CONTROL_IDLE : begin
        // Stay in idle until an ERROR response during a burst (HSEL not
        // required because an ERROR would not be received unless a valid
        // transfer across ErrorCanc was in progress)
              next_control_state = ((HRESPM == RSP_ERROR) & burst_transfer)?
                                   ST_CONTROL_ERROR: ST_CONTROL_IDLE;
          end
        ST_CONTROL_ERROR : begin
        // Stay in ERROR state until the burst finishes and the generated
        // ERROR reponse is complete
             next_control_state =   ((burst_transfer == 1'b0) & gen_hready_outs) ?
                                   ST_CONTROL_IDLE : ST_CONTROL_ERROR;
          end
        default:
          next_control_state = 1'bx; // Illegal state transition

      endcase
    end

//------------------------------------------------------------------------------
// Error Generation State Machine
//------------------------------------------------------------------------------
  // This state machine generates error responses when an error is recieved on
  // AHB2 and, when in error mode an error response is given to each sequential
  //  transfer on AHB1.

  always @ (HRESPM or HTRANSS or gen_state or control_state)
    begin : p_gen_state_comb
      case (gen_state)

        ST_GEN_IDLE : begin
              next_gen_state = (HRESPM == RSP_ERROR) ?
                                ST_GEN_ERROR2 :
                                ((HTRANSS == TRN_SEQ)  & (control_state == ST_CONTROL_ERROR))?
                                ST_GEN_ERROR1 :
                                ST_GEN_IDLE;
          end
        ST_GEN_ERROR1 :
              next_gen_state = ST_GEN_ERROR2;      // First cycle of error response

        ST_GEN_ERROR2 : begin
              next_gen_state =  (HTRANSS == TRN_SEQ) ?
                                ST_GEN_ERROR1:  // Another Burst transfer
                                ST_GEN_IDLE; // No transfer, go to idle
            end

        default:
          next_gen_state = 2'bxx;        // Illegal state transition

      endcase
    end

//------------------------------------------------------------------------------
// State Machine Registers
//------------------------------------------------------------------------------
  // register state signals

  always @ (posedge HCLK or negedge HRESETn)
    begin : p_state_seq
      if  (~HRESETn )
        begin
          control_state <= ST_CONTROL_IDLE;
          gen_state     <= ST_GEN_IDLE;
        end
      else if (HCLKEN)
        begin
          control_state <= next_control_state;
          gen_state     <= next_gen_state;
        end
    end


//------------------------------------------------------------------------------
// State Decodes
//------------------------------------------------------------------------------
  // The decode and state bit ordering should result in the following signals
  // being driven directly by the outputs of the gen_state registers.

  // Error Generation: HREADYS output - high when idle and 2nd cycle of error

  assign gen_hready_outs = ((gen_state == ST_GEN_IDLE) |
                          (gen_state == ST_GEN_ERROR2));


  // Error Generation: HRESPS output - high for both cycles of error response
  assign gen_hresps = ((gen_state == ST_GEN_ERROR1) |
                      (gen_state == ST_GEN_ERROR2)) ? RSP_ERROR :
                      RSP_OKAY;

//------------------------------------------------------------------------------
// AHB1 Output Logic
//------------------------------------------------------------------------------

  // HREADYS and HRESPS outputs from mux controlled by control_state
  always @ (control_state or HREADYM or HRESPM or gen_hready_outs or gen_hresps)
    begin : p_ahb1_output_comb
      if  (control_state == ST_CONTROL_IDLE) // normal, no errors AHB1 = AHB2
        begin
          HREADYOUTS = HREADYM;
          HRESPS     = HRESPM;
        end
      else                                  // error mode, use generated signals
        begin
          HREADYOUTS = gen_hready_outs;
          HRESPS     = gen_hresps;
        end
    end // block: p_AHB1OutputComb

//------------------------------------------------------------------------------
// AHB2 Output Logic
//------------------------------------------------------------------------------

  // HTRANSM output from mux controlled by control_state
  always @ (HTRANSS or control_state)
    begin : p_ahb2_output_comb
      if  (control_state ==ST_CONTROL_IDLE)   // normal, pass HTRANS through
        HTRANSM = HTRANSS;
      else                       // error mode, drive IDLE till end of burst
        if (HTRANSS == TRN_NONSEQ)
          HTRANSM = HTRANSS;
        else
          HTRANSM = TRN_IDLE;
    end


endmodule // ErrorCanc

// --============================ End ========================================--
