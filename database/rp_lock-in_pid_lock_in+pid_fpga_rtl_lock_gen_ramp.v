`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// 
// Scanning module with ramp shape. Outputs triangular ramp. Echa  value last for ramp_step clock ticks 
// before changing to the next value.
// Outputs two signals, with a amplitud relation set by ramp_B_factor
// 
// Includes a relock system wich produce an exponential amplitud increasing signal
// to find next closest lock condition.
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_ramp #(parameter R=14)
    (
    input clk,rst,
    // inputs
    input         [32-1:0] ramp_step,
    input  signed [ R-1:0] ramp_low_lim,ramp_hig_lim,ramp_B_factor,
    input                  ramp_reset,ramp_enable,ramp_direction,
    input                  relock_enable,out_of_lock,relock_reset,
    // outputs
    output                 trigger_low,
    output                 trigger_hig,
    output signed [ R-1:0] outA, outB
    );
    
    // R resolution of input and output signals
    reg  signed [ R-1:0] ramp_signal;
    wire signed [ R-1:0] ramp_signal_next;
    // Second output
    wire signed [28-1:0] outB_28;
    
    // Counter
    reg         [32-1:0] cnt;
    wire        [32-1:0] cnt_next;
    
    // Auxiliary signals
    reg  slope;
    wire slope_next;
    reg  trig_low_last,trig_low_now;
    reg  trig_hig_last,trig_hig_now;
    
    reg  [32-1:0] ramp_step_last, ramp_step_now;
    wire          ramp_step_changed ;
    wire          go ;
    
    reg  [32-1:0] ramp_direction_last, ramp_direction_now;
    wire          floor,ceil,slope_changed;
    
    // relock system signals
    wire signed [ R-1:0] relock_low_lim ,relock_hig_lim;
    wire                 relock_run_ramp,relock_freeze_pids;
    
    // Wires for ramp control
    wire signed [ R-1:0] low_lim,hig_lim;
    wire                 enable,direction;
    
    assign  low_lim   = relock_enable & out_of_lock  ?  relock_low_lim  :  ramp_low_lim   ;
    assign  hig_lim   = relock_enable & out_of_lock  ?  relock_hig_lim  :  ramp_hig_lim   ;
    assign  direction = relock_enable & out_of_lock  ?  1'b0            :  ramp_direction ;
    assign  enable    = relock_enable & out_of_lock  ?  relock_run_ramp :  ramp_enable    ;
    
    gen_ramp_relock #(.R(14)) i_gen_ramp_relock (
        .clk(clk),  .rst(rst),
        // inputs
        .relock_on       ( relock_enable        ),
        .out_of_lock     ( out_of_lock          ),
        .ramp_A          ( outA                 ),
        .ramp_trigger_in ( trigger_low          ),
        .reset           ( relock_reset         ),
        // outputs
        .new_low_lim     ( relock_low_lim       ),
        .new_hig_lim     ( relock_hig_lim       ),
        .state_14        ( /* lolo */ ),
        .run_ramp        ( relock_run_ramp      ),
        .freeze_pids     ( relock_freeze_pids   ) 
    );
    
    

        
    
    // Counter evolution    
    always @(posedge clk) 
        if (rst) begin
            cnt            <=    32'b0        ;
            ramp_step_last <=    32'b0        ;
            ramp_step_now  <=    32'b0        ;
        end
        else begin
            cnt            <=    cnt_next        ;
            ramp_step_last <=    ramp_step_now   ;
            ramp_step_now  <=    ramp_step       ;
        end
    

    
    assign ramp_step_changed = ~ ( ramp_step_now == ramp_step_last)  ;
    assign cnt_next          =  |{ramp_reset,ramp_step_changed,ramp_step_now==cnt} ? 32'b0 :  cnt + enable ;
    assign go                =  &{ cnt==ramp_step_now | (~(|ramp_step_now)) , enable , ~ramp_reset } ;
    
    
    
    // ramp_signal evolution
    always @(posedge clk) 
    if (rst) begin
        ramp_signal          <=    {R{1'b0}}    ;
        slope                <=         1'b1    ;
        ramp_direction_last  <=         1'b0    ;
        ramp_direction_now   <=         1'b0    ;
    end
    else if(ramp_reset) begin
        ramp_signal          <=    {R{1'b0}}      ;
        slope                <=   ~direction ;
        ramp_direction_last  <=    direction ;
        ramp_direction_now   <=    direction ;
        trig_low_last        <=    1'b0           ;
        trig_low_now         <=    1'b0           ;
        trig_hig_last        <=    1'b0           ;
        trig_hig_now         <=    1'b0           ;
    end
    else begin
        if(go) begin
            ramp_signal          <= ramp_signal_next   ;
            slope                <= slope_next         ;
            ramp_direction_last  <= ramp_direction_now ;
            ramp_direction_now   <= direction     ;
        end
        else begin
            ramp_signal          <= ramp_signal      ;
            slope                <= slope            ;
            ramp_direction_last  <= ramp_direction_last ;
            ramp_direction_now   <= ramp_direction_now  ;
        end
        trig_low_last        <=    trig_low_now        ;
        trig_low_now         <=    trigger_low         ;
        trig_hig_last        <=    trig_hig_now        ;
        trig_hig_now         <=    trigger_hig         ;
    end
    
    
    assign floor         = ( ramp_signal<=low_lim  )  ;
    assign ceil          = ( ramp_signal>=hig_lim  )  ;
    assign slope_changed =  ramp_direction_now ^ ramp_direction_last ;
    
    assign ramp_signal_next = floor ? ramp_signal + 1'b1  :
                              ceil  ? ramp_signal - 1'b1  :
                              slope ? ramp_signal + 1'b1  :
                                      ramp_signal - 1'b1  ;
    
    assign slope_next       = floor         ? 1'b1   :
                              ceil          ? 1'b0   :
                              slope_changed ? ~slope : 
                                               slope ;
    
    assign trigger_low = &{ ramp_signal==low_lim , go, ~trig_low_last } ;
    assign trigger_hig = &{ ramp_signal==hig_lim , go, ~trig_hig_last } ;
    
    
    // outputs
    assign outA    = ramp_signal ;
    
    // assign outB_28  = $signed(ramp_signal) * $signed(ramp_B_factor) ;
    
    mult_dsp_14  i_mult_dps_error_pow (.CLK(clk), .A($signed(ramp_signal)) , .B($signed(ramp_B_factor)), .P(outB_28));
    
    assign outB     = $signed(outB_28[26:0]) >>> 12 ;
    //assign outB     = relock_hig_lim ;
    //assign outB     = { 8'b0 , ramp_step_changed, trigger, slope , go , direction , enable};
    
endmodule

/*
gen_ramp #(.R(14)) NAME (
    .clk(clk),  .rst(rst),
    // inputs
    .ramp_step (   32'd1000 ),
    .ramp_low_lim(  14'd0     ),
    .ramp_hig_lim(  14'd1000  ),
    .ramp_reset  (    1'b0    ),
    .ramp_enable (   1'b1     ),
    .ramp_direction(1'b1      ),
    .ramp_B_factor (ramp_B_factor ),
    // outputs
    .trigger     ( TRIG       ),
    .outA        (  OUT       ),
    .outB        (  OUT       ) 
);
*/
