`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//
// Controls the gen_ramp module to find the next closest condition, by producing a 
// triangular scan that increase its limits *2 on each scan period.
//
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_ramp_relock #(parameter R=14)
    (
    input clk,rst,
    // inputs
    input                  relock_on,       // Turns on the relocking system
    input                  out_of_lock,     // 1 if the system is out of lock
    input signed  [ R-1:0] ramp_A,          // value of ramp_A before reloking star
    input                  ramp_trigger_in, // trigger of scan signal start
    input                  reset,           // reset state machine
    
    // outputs
    output signed [ R-1:0] new_low_lim,new_hig_lim,  // original scan limits
    output        [ R-1:0] state_14,
    output                 run_ramp, freeze_pids
    );
    
    
    localparam  [3-1:0] // 8 posible states
        idle     = 3'd0,
        wait1    = 3'd1,
        set_size = 3'd2,
        scan     = 3'd3,
        success  = 3'd4,
        fail     = 3'd5;
    
    
    
    reg  [3-1:0] state;
    reg  [3-1:0] state_next;
    reg  [R-1:0] ramp_size,ramp_size_next;
    
    reg  signed [R-1:0] ramp_A_val;
    wire signed [R-1:0] ramp_A_val_next;
    wire signed [R  :0] new_low_lim_tmp,new_hig_lim_tmp;
    
    reg  [3-1:0] cnt,cnt_next;
    
    
    reg          ramp_trigger_now,ramp_trigger_last;
    wire         ramp_trigger;
    
    // trigger detect
    always @(posedge clk) begin
        if (rst) begin
            ramp_trigger_now   <=   1'b0    ;
            ramp_trigger_last  <=   1'b0    ;
        end 
        else begin
            ramp_trigger_last  <=   ramp_trigger       ;
            ramp_trigger_now   <=   ramp_trigger_in    ;
        end
    end
    
    assign  ramp_trigger  = { ramp_trigger_now , ramp_trigger_last } == 2'b10 ;
    
    // lolo
    assign state_14 = {1'b0 , state , 10'b0 };
    
    /*
    // State-Machine
    always @(posedge clk) begin
        if (rst) begin
            state      <=    3'b0    ;
            ramp_size  <=   14'd8    ;
            ramp_A_val <=   14'd0    ;
            cnt        <=    3'b0    ;
        end 
        else begin
            state      <=    state_next        ;
            ramp_size  <=    ramp_size_next    ;
            ramp_A_val <=    ramp_A_val_next   ;
            cnt        <=    cnt_next          ;
        end
    end
    
    assign ramp_A_val_next = (state==idle) ? ramp_A : ramp_A_val ;
    */
    
    always @(posedge clk) begin
        if (rst) begin
            state      <=    idle    ;
            ramp_size  <=   14'd8    ;
            ramp_A_val <=   14'd0    ;
            cnt        <=    3'b0    ;
        end 
        else begin
            case (state)
                idle : begin // next state only if out_of_lock is True
                    if (out_of_lock&relock_on) 
                        state <= set_size ;
                    else
                        state  <=    idle ;
                    ramp_size  <=   14'd8 ;
                    cnt        <=    3'b0 ;
                    ramp_A_val <=  $signed(ramp_A) ;
                end
                set_size : begin // set size , frezze ramp_A value and go to scan state. if out_off_lock == 0 , go to done
                    if (ramp_size[12])
                        ramp_size  <=  ramp_size ;
                    else
                        ramp_size  <= ramp_size <<< 1 ;
                    state      <=  wait1;
                    cnt        <=  3'b0 ;
                    ramp_A_val <=  ramp_A_val ;
                end
                wait1    :begin // wait some clk ticks
                    if(&cnt) begin
                        state     <=  scan ;
                        cnt       <=  3'b0 ;
                    end
                    else begin
                        state     <= wait1 ;
                        cnt       <=  cnt + 1'b1 ;
                    end
                    ramp_size   <=  ramp_size ;
                    ramp_A_val <=  ramp_A_val ;
                end
                scan : begin // scan until you get locked or fail
                    if (out_of_lock==1'b0) 
                        state <= success ;
                    else if (ramp_trigger)
                        if (ramp_size[12])
                            state <=  fail      ;
                        else
                            state <=  set_size  ;
                    else
                        state <=  scan ;
                    ramp_size   <=  ramp_size ;
                    cnt         <=  3'b0 ;
                    ramp_A_val  <=  ramp_A_val ;
                end
                success : begin // on success, go to state idle
                    state      <=  idle ;
                    ramp_size  <=  ramp_size ;
                    cnt        <=  3'b0 ;
                    ramp_A_val <=  ramp_A_val ;
                end
                fail : begin // scan until you get locked or fail
                    if (reset) 
                        state  <= idle ;
                    else
                        state  <=  fail ;
                    ramp_size  <=  ramp_size ;
                    cnt        <=  3'b0 ;
                    ramp_A_val <=  ramp_A_val ;
                end
                default : begin 
                    state      <= idle;
                    cnt        <=  3'b0 ;
                    ramp_size  <=  ramp_size ;
                    ramp_A_val <=  ramp_A_val ;
                end
            endcase
        end
    end
    
    /*
    // Next-state logic
    always @(posedge clk)
    begin
        case (state)
            idle : begin // next state only if out_of_lock is True
                if (out_of_lock&relock_on) 
                    state_next <= set_size ;
                else
                    state_next <=  idle ;
                ramp_size_next <= 14'd8 ;
                cnt_next       <=  3'b0 ;
            end
            set_size : begin // set size , frezze ramp_A value and go to scan state. if out_off_lock == 0 , go to done
                ramp_size_next <= ramp_size << 1 ;
                state_next     <= scan ;
                cnt_next       <=  3'b0 ;
            end
            wait1    :begin // wait some clk ticks
                if(cnt==3'b0) 
                    ramp_size_next <= ramp_size ;//<< 1 ;
                else
                    ramp_size_next <= ramp_size ;
                if(cnt==3'b111) begin
                    state_next     <= scan ;
                    cnt_next       <=  3'b0 ;
                end
                else begin
                    state_next     <= wait1 ;
                    cnt_next       <=  cnt + 1'b1 ;
                end
            end
            scan : begin // scan until you get locked or fail
                if (out_of_lock==1'b0) 
                    state_next <= success ;
                else if (ramp_trigger)
                    state_next <=  set_size ;
                else
                    state_next <=  scan ;
                ramp_size_next <=  ramp_size ;
                cnt_next       <=  3'b0 ;
            end
            success : begin // on success, go to state idle
                state_next     <=  idle ;
                ramp_size_next <=  ramp_size ;
                cnt_next       <=  3'b0 ;
            end
            fail : begin // scan until you get locked or fail
                if (reset) 
                    state_next <= idle ;
                else
                    state_next <=  fail ;
                ramp_size_next <=  ramp_size ;
                cnt_next       <=  3'b0 ;
            end
            default : begin 
                state_next     <= idle;
                cnt_next       <=  3'b0 ;
                ramp_size_next <=  ramp_size ;
            end
        endcase
    end
    */
    
    
    
    // Output logic
    assign   new_low_lim_tmp   =    $signed(ramp_A_val) - $signed(ramp_size) ;
    assign   new_hig_lim_tmp   =    $signed(ramp_A_val) + $signed(ramp_size) ;
    satprotect #(.Ri(R+1),.Ro(R),.SAT(R)) i_satprotect_low  ( .in(new_low_lim_tmp),  .out(new_low_lim) );
    satprotect #(.Ri(R+1),.Ro(R),.SAT(R)) i_satprotect_hig  ( .in(new_hig_lim_tmp),  .out(new_hig_lim) );
    
    assign   run_ramp    = (state==scan|state==set_size|state==wait1) ? 1'b1 : 1'b0 ;
    assign   freeze_pids = (state==idle) ? 1'b0 : 1'b1 ;
    
endmodule

