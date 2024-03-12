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
//      Checked In          : $Date: 2013-01-09 12:55:25 +0000 (Wed, 09 Jan 2013) $
//
//      Revision            : $Revision: 233070 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : APB time out monitor module, used to monitor the slave's PREADY singal.
//            When the PREADY signal is not active for a pre-defined cycle, the time out
//            monitor will issue an error response to the master and block the access to
//            the slave. The timeout monitor will unblock the slave if a ready signal is
//            issued from the slave
//-----------------------------------------------------------------------------

module cmsdk_apb_timeout_mon #(
//--------------------------------------------------------------------------------------------
// Parameters
//--------------------------------------------------------------------------------------------

parameter      ADDRWIDTH      = 12,  //APB slave address width
parameter      TIME_OUT_VALUE = 16)  //The number of cycles of wait state to triger the timeout, must be greater
                                     // than 2 and less than 1024
 (
//--------------------------------------------------------------------------------------------
// IO delcaration
//--------------------------------------------------------------------------------------------

  input  wire                  PCLK,
  input  wire                  PRESETn,

//Signals connect APB master to timeout monitor
  input  wire                  PSELS,
  input  wire                  PENABLES,
  input  wire [ADDRWIDTH-1:0]  PADDRS,
  input  wire [2:0]            PPROTS,    //APB protect signal
  input  wire                  PWRITES,
  input  wire [31:0]           PWDATAS,
  input  wire [3:0]            PSTRBS,    //APB byte strobe signal

  output wire                  PREADYS,   //slave ready signal
  output wire                  PSLVERRS,  //slave error siganl

//Signals connect timeout monitor to APB slave
  output wire                  PSELM,
  output wire                  PENABLEM,
  output wire [ADDRWIDTH-1:0]  PADDRM,
  output wire [2:0]            PPROTM,    //APB protect signal
  output wire                  PWRITEM,
  output wire [31:0]           PWDATAM,
  output wire [3:0]            PSTRBM,    //APB byte strobe signal

  input  wire                  PREADYM,   //slave ready signal
  input  wire                  PSLVERRM,  //slave error signals

//TIMEOUT indicator
  output wire                  TIMEOUT);  //Timeout signal, indicate slave is in timeout state

//--------------------------------------------------------------------------------------------
// Local Parameters
//--------------------------------------------------------------------------------------------
localparam     ARM_TIMEOUT_COUNT_WIDTH =        //Timout counter width, maximum 10
                             (TIME_OUT_VALUE <= 16)  ?  4 :
                             (TIME_OUT_VALUE <= 32)  ?  5 :
                             (TIME_OUT_VALUE <= 64)  ?  6 :
                             (TIME_OUT_VALUE <= 128) ?  7 :
                             (TIME_OUT_VALUE <= 256) ?  8 :
                             (TIME_OUT_VALUE <= 512) ?  9 : 10;


//--------------------------------------------------------------------------------------------
// Internal signals
//--------------------------------------------------------------------------------------------

//Local parameter for main control FSM
localparam         ARM_TIMEOUT_WAIT_IDLE           = 2'b00,
                   ARM_TIMEOUT_WAIT_CNT            = 2'b01,
                   ARM_TIMEOUT_WAIT_TIMEOUT        = 2'b10,
                   ARM_TIMEOUT_WAIT_TIMEOUT_DELAY  = 2'b11;



//Locked APB transfer control signals from master to slvae
wire               lock_en;             //Lock enable signal, only valid for the first
                                        // cycle when the main control FSM enter TIMEOUT state

reg                locked_psels;
reg                locked_penables;
reg[ADDRWIDTH-1:0] locked_paddrs;
reg[2:0]           locked_pprots;      //APB protect signal
reg                locked_pwrites;
reg[31:0]          locked_pwdatas;
reg[3:0]           locked_pstrbs;      //APB byte strobe signal


//Muxing control signals
wire               timeout_sel_s;      //timeout control signal for muxing the correct
                                       // slave output signal to master
wire               timeout_sel_m;      //timeout control signal for muxing the correct
                                       // master output signal to slave

//wait state counter FSM and counter signals
reg [1:0]          timeout_fsm_state;           //wait state FSM current state register
reg [1:0]          timeout_fsm_state_nxt;       //wait state FSM next state register

reg [ARM_TIMEOUT_COUNT_WIDTH-1:0]  timeout_cnt;        // wait state counter
reg [ARM_TIMEOUT_COUNT_WIDTH-1:0]  nxt_timeout_cnt;    // next state for wait state counter
wire[ARM_TIMEOUT_COUNT_WIDTH-1:0]  timeout_cnt_inc1;   // wait state counter increase 1
wire               reach_timeout_thrhold;              // Counter reach the timeout threshhold
wire               enter_timeout;                      // Enter timeout state control signal



//Error response signal generated by timeout monitor
wire               err_resp_ready;             //Fake ready signal from timeout monitor
wire               err_resp_slverr;            //Fake response signal from timeout monitor

//timeout signals
wire               timeout_main;               //indicate main ctonrl FSM in TIMEOUT state
wire               timeout_delay;              //indicate main ctonrl FSM in TIMEOUT Delay state

//--------------------------------------------------------------------------------------------
// module logic start
//--------------------------------------------------------------------------------------------


//--------------------------------------------------------------------------------------------
// Main control FSM
//--------------------------------------------------------------------------------------------

assign            reach_timeout_thrhold = (timeout_cnt== (TIME_OUT_VALUE-1))? 1'b1:1'b0;

assign            enter_timeout         = ((reach_timeout_thrhold)&(PREADYS==1'b0));
                                //Reach the time out threshhold and no ready signal

//WAIT STATE FSM, state update
always @(posedge PCLK or negedge PRESETn)
begin
  if (~PRESETn)
     timeout_fsm_state <= ARM_TIMEOUT_WAIT_IDLE;
  else
     timeout_fsm_state <= timeout_fsm_state_nxt;
end


//WAIT STATE FSM, next state generation
always @(timeout_fsm_state or PSELS or PENABLES or enter_timeout or PREADYM)
begin
  case (timeout_fsm_state)
     ARM_TIMEOUT_WAIT_IDLE:                        //Current IDLE state
           begin
              timeout_fsm_state_nxt =  ((PSELS==1'b1) & (PENABLES==1'b0)) ?
                                       ARM_TIMEOUT_WAIT_CNT :  //If there is a active transfer request, jump to WAIT_CNT
                                       ARM_TIMEOUT_WAIT_IDLE; //If false, stay in the IDLE state

           end
     ARM_TIMEOUT_WAIT_CNT:                        //Currrent WAIT_CNT state
           begin
              timeout_fsm_state_nxt =  (PREADYM == 1'b1) ?       ARM_TIMEOUT_WAIT_IDLE:
                                       (enter_timeout == 1'b1)?  ARM_TIMEOUT_WAIT_TIMEOUT:
                                        ARM_TIMEOUT_WAIT_CNT;
           end

     ARM_TIMEOUT_WAIT_TIMEOUT:                   //Currrent TIMEOUT state
           begin
              timeout_fsm_state_nxt = (PREADYM == 1'b1)? // When slave give a reaady signal, Jump to IDLE
                                                 // state, or DELAY state,
                                       (((PSELS==1'b1) &(PENABLES==1'b0)) ? // if APB is on its SETUP phase, jump to DELAY state
                                          ARM_TIMEOUT_WAIT_TIMEOUT_DELAY:
                                          ARM_TIMEOUT_WAIT_IDLE):
                                          ARM_TIMEOUT_WAIT_TIMEOUT;
           end
     ARM_TIMEOUT_WAIT_TIMEOUT_DELAY:     //Currrent TIMEOUT DELAY state, go to IDLE next cycle
           begin
              timeout_fsm_state_nxt = ARM_TIMEOUT_WAIT_IDLE;
           end
      default:
           timeout_fsm_state_nxt = 2'bxx;   //default next state
  endcase
end

//--------------------------------------------------------------------------------------------
// Wait cycles counter
//--------------------------------------------------------------------------------------------

assign     timeout_cnt_inc1 = timeout_cnt + 1'b1; //Increasement counter

  // Generate next state for timeout_cnt
always @(timeout_fsm_state or reach_timeout_thrhold or PREADYM or timeout_cnt_inc1)
  begin
  if ((timeout_fsm_state == ARM_TIMEOUT_WAIT_CNT) // Counter will only be enabled in the WAIT_CNT state
       & (reach_timeout_thrhold == 1'b0))
     begin
       if ((PREADYM==1'b1) )                     // If transfer is finishing, reset counter
         nxt_timeout_cnt = ({ARM_TIMEOUT_COUNT_WIDTH{1'b0}});
       else                                      // transfer is on going, increment counter
         nxt_timeout_cnt = timeout_cnt_inc1;
     end
  else                                           // No transfer going on
     nxt_timeout_cnt = ({ARM_TIMEOUT_COUNT_WIDTH{1'b0}});
  end

// Registering timeout_cnt
always @ (posedge PCLK or negedge PRESETn)
begin
  if (~PRESETn)
      timeout_cnt <= {ARM_TIMEOUT_COUNT_WIDTH{1'b0}};
  else
      timeout_cnt <= nxt_timeout_cnt;

end

//--------------------------------------------------------------------------------------------
//Faked error response from timeout monitor
//--------------------------------------------------------------------------------------------
//always response ready signal when in TIMEOUT state and a valid APB transfer occure
assign          err_resp_ready = PSELS & PENABLES & TIMEOUT;

//always response error when err_resp_ready is valid
assign          err_resp_slverr= err_resp_ready;


//--------------------------------------------------------------------------------------------
// Lock control signals when entering TIMEOUT state
//--------------------------------------------------------------------------------------------

//lock the APB master to slave signals when entering TIMEOUT state

assign       lock_en = enter_timeout;

always @(posedge PCLK or negedge PRESETn)
begin
  if (~PRESETn)
    begin
      locked_psels    <= 1'b0;
      locked_penables <= 1'b0;
      locked_paddrs   <= {ADDRWIDTH{1'b0}};
      locked_pprots   <= {3{1'b0}};
      locked_pwrites  <= 1'b0;
      locked_pwdatas  <= {32{1'b0}};
      locked_pstrbs   <= {4{1'b0}};
    end
  else if (lock_en) //Lock the current APB slave control signals
    begin
      locked_psels    <= PSELS;
      locked_penables <= PENABLES;
      locked_paddrs   <= PADDRS;
      locked_pprots   <= PPROTS;
      locked_pwrites  <= PWRITES;
      locked_pwdatas  <= PWDATAS;
      locked_pstrbs   <= PSTRBS;
    end
end


//--------------------------------------------------------------------------------------------
// Signal select when in time out state
//--------------------------------------------------------------------------------------------

//TIMEOUT control signals
assign       timeout_main  = (timeout_fsm_state == ARM_TIMEOUT_WAIT_TIMEOUT) ? 1'b1:1'b0;

assign       timeout_delay = (timeout_fsm_state == ARM_TIMEOUT_WAIT_TIMEOUT_DELAY) ? 1'b1:1'b0;

assign       TIMEOUT       = (timeout_main | timeout_delay);

//muxing control signal generation for the signals to APB slave
assign       timeout_sel_s = (TIMEOUT);       // when in TIMEOUT and TIMEOUT_DELAY state

//muxing control signal generation for the signals to APB master
assign       timeout_sel_m = (timeout_main);  // When in TIMEOUT state


//Assign signals to slave

assign       PSELM     = (timeout_delay==1'b1)? 1'b0:((timeout_sel_m==1'b1)?
                          locked_psels : PSELS);
                          // Force to 0 when in TIMEOUT Delay state

assign       PENABLEM  = (timeout_sel_m==1'b1)? locked_penables : PENABLES;
assign       PADDRM    = (timeout_sel_m==1'b1)? locked_paddrs : PADDRS;
assign       PPROTM    = (timeout_sel_m==1'b1)? locked_pprots : PPROTS;
assign       PWRITEM   = (timeout_sel_m==1'b1)? locked_pwrites : PWRITES;
assign       PWDATAM   = (timeout_sel_m==1'b1)? locked_pwdatas : PWDATAS;
assign       PSTRBM    = (timeout_sel_m==1'b1)? locked_pstrbs : PSTRBS;

//Assign signals to master
assign       PREADYS   = (timeout_sel_s==1'b1)? err_resp_ready: PREADYM;
assign       PSLVERRS  = (timeout_sel_s==1'b1)? err_resp_slverr: PSLVERRM;




//--------------------------------------------------------------------------------------------
// Module logic end
//--------------------------------------------------------------------------------------------
`ifdef ARM_APB_ASSERT_ON

  `include "std_ovl_defines.h"
  // ------------------------------------------------------------
  // Assertions
  // ------------------------------------------------------------

  //Check when TIMEOUT is assert, the timeout monitor will give error response
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "when TIMEOUT is valid, timeout monitor shoud give error response"
      )
     u_ovl_apb_timeout_err_resp
     (.clk             (PCLK),
      .reset_n         (PRESETn),
      .antecedent_expr ( (TIMEOUT==1'b1) &  PSELS & PENABLES & PREADYS ),
      .consequent_expr ( PSLVERRS==1'b1)
      );


  //Check when TIMEOUT is assert, if PREADYM is valid, the TIMEOUT shoudl be deasserted after 1 or 2 cycles
  assert_next
    #(`OVL_ERROR, 2,1,0,
      `OVL_ASSERT,
      "when TIMEOUT is valid, slave PREADYM signal can trigger the timeout monitor jump out timeout state after 1 or 2 cycles"
      )
    u_ovl_apb_timeout_deassert
    (.clk         (PCLK ),
     .reset_n     (PRESETn),
     .start_event ((TIMEOUT==1'b1) & (PREADYM == 1'b1)),
     .test_expr   (TIMEOUT==1'b0)
     );

  //Internal coutner value will not greater than timeout threshhold
  assert_never
     #(`OVL_ERROR,
       `OVL_ASSERT,
       "Timeout counter exceed threshhold value!")
    u_ovl_apb_timeout_cnt_exceed
     (.clk       (PCLK),
      .reset_n   (PRESETn),
      .test_expr ((timeout_cnt >= TIME_OUT_VALUE))
      );


  //  Time out configuration range check
   assert_never
     #(`OVL_FATAL,`OVL_ASSERT,
       "Time Out configuration (TIME_OUT_VALUE) should be >2 and <=1024")
   u_ovl_timeout_cfg
     (.clk(PCLK), .reset_n(PRESETn),
      .test_expr((TIME_OUT_VALUE>1024)|(TIME_OUT_VALUE<2))
      );

`endif


endmodule

