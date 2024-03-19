`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 22.02.2017 11:41:25
// Design Name:
// Module Name: lock_ctrl
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module lock_ctrl
    (
    input clk,rst,
    // inputs
    input         [10-1:0] lock_ctrl,
    input  signed [14-1:0] signal,
    input                  ramp_trigger,
    input         [32-1:0] time_threshold,
    input  signed [14-1:0] level_threshold,
    input                  level_rising_trigger,
    // outputs
    output                 ramp_enable,
    output                 pidA_enable,
    output                 pidB_enable,
    output                 lock_ctrl_trig
    );

    /** lock_ctrl has the following bits :
     *
     * lock_ctrl[ 0] --> lock_now         : start the lock rigth now
     * lock_ctrl[ 1] --> launch_lock      : look for lock trigger condition
     * lock_ctrl[ 2] --> pidB_enable_ctrl --|
     * lock_ctrl[ 3] --> pidA_enable_ctrl   |--> actual state of enable controls
     * lock_ctrl[ 4] --> ramp_enable_ctrl --|
     * lock_ctrl[ 5] --> set_pidB_enable --|      end state of enable
     * lock_ctrl[ 6] --> set_pidA_enable   |----> if lock condition
     * lock_ctrl[ 7] --> set_ramp_enable --|      is met
     * lock_ctrl[ 8] --> trig_time        : fires trigger if time condition is met
     * lock_ctrl[ 9] --> trig_val         : fires trigger if threshold condition is met
     * lock_ctrl[10] --> lock_trig_rise   : derivative condition for threshold trigger
     *
     **/

    wire    seek_time_trig,seek_level_trig,seek_trig_on;
    wire    now_eg_th,last_lt_th,set_lock;

    // set_lock wire tells if you must close the feedbak loop

    wire   trigger_took_effect;  // helper to see if the end state condition is already set
    assign trigger_took_effect = (lock_ctrl[4]==lock_ctrl[7])&(lock_ctrl[3]==lock_ctrl[6])&(lock_ctrl[2]==lock_ctrl[5]);

    assign seek_trig_on    = (|lock_ctrl[1:0]) ;   // if lock_now or launch_lock, we want to start a lock
    assign seek_time_trig  = lock_ctrl[8] & seek_trig_on; // time trigger seek
    assign seek_level_trig = lock_ctrl[9] & seek_trig_on; // level trigger seek



    // counter for time trigger
    reg  [31-1:0] cnt ;
    wire [32-1:0] cnt_next ;

    always @(posedge clk, posedge rst)
        if (rst) cnt  <=   31'b0   ;
        else     cnt  <=  cnt_next[31-1:0] ;

    // counter is synchronized with gen_ramp signal
    assign cnt_next = ramp_trigger ? 32'b0 : cnt+1'b1 ;



    // save last val of signal and time (useful to get level trigger slope condition)
    reg  signed   [14-1:0] signal_last,signal_now;
    wire signed   [14-1:0] signal_last_next,signal_now_next;

    always @(posedge clk) begin
        if (rst) begin
            signal_last  <=   32'b0   ;
            signal_now   <=   32'b0   ;
        end
        else begin
            signal_last  <=   signal_last_next   ;
            signal_now   <=   signal_now_next   ;
        end
    end

    assign signal_now_next  = signal;
    assign signal_last_next = signal_now ;



    // did trigger already happened?
    reg   trigger_found,set_lock_last,set_lock_now;
    wire  trigger_found_next;
    wire  trigger,time_trigger,level_trigger,both_trigger;

    always @(posedge clk) begin
        if (rst) begin
            trigger_found       <=   1'b0  ;
            set_lock_now        <=   1'b0  ;
            set_lock_last       <=   1'b0  ;
        end
        else begin
            if (~seek_trig_on) begin
                trigger_found       <=   1'b0  ;
                set_lock_now        <=   1'b0  ;
                set_lock_last       <=   1'b0  ;
            end
            else begin
                trigger_found       <= trigger_found_next ;
                set_lock_now        <=   set_lock  ;
                set_lock_last       <=   set_lock_now  ;
            end
        end
    end

    //assign trigger_found_next  =  trigger_found==1'b1  ?  1'b1 : trigger ;
    assign trigger_found_next  =  trigger_found  ?  ~trigger_took_effect : trigger ;

    assign lock_ctrl_trig      = {set_lock_now,set_lock_last} == 2'b10 ;


    // Trigger is level or time contition is fullfilled
    assign trigger       = time_trigger | (level_trigger&(~seek_time_trig)) | lock_ctrl[0] | both_trigger;

    // Time trigger
    assign time_trigger  = (cnt==time_threshold[31-1:0]) & seek_time_trig & (~seek_level_trig) ;

    /* Level trigger: if signal is equal or greater (less) than threshold
                      and was less (equal or greater) in the last value
                      then fires trigger
    */

    assign now_eg_th        = signal_now>=level_threshold;
    assign last_lt_th       = signal_last<level_threshold;
    assign level_trigger    = ( ~ ( ( now_eg_th^last_lt_th  ) | ( last_lt_th^level_rising_trigger ) ) )
                              & seek_level_trig ;

    // time+level trigger: if time trigger condition was already met, then fire trigger when level condition is met
    assign both_trigger     = level_trigger & (cnt>=time_threshold[31-1:0]) & seek_time_trig;

    // If trigger condition is met and you ar looking for that ...
    assign set_lock         = (seek_trig_on&trigger_found);

    // Outputs
    assign ramp_enable      = set_lock ?  lock_ctrl[7] :  lock_ctrl[4]   ;
    assign pidA_enable      = set_lock ?  lock_ctrl[6] :  lock_ctrl[3]   ;
    assign pidB_enable      = set_lock ?  lock_ctrl[5] :  lock_ctrl[2]   ;


endmodule



/*
lock_ctrl NAME (
    .clk(clk),  .rst(rst),
    // inputs
    .lock_ctrl            ( lock_state         ),
    .signal               ( lock_ctrl_signal   ),
    .ramp_trigger         ( ramp_trig          ),
    .time_threshold       ( lock_trig_time_val ),
    .level_threshold      ( lock_trig_val      ),
    .level_rising_trigger ( lock_trig_rise     ),
    // outputs
    .ramp_enable          ( ramp_enable_ctrl   ),
    .pidA_enable          ( pidA_enable_ctrl   ),
    .pidB_enable          ( pidB_enable_ctrl   )
);
*/
