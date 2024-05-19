// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  BLDC PWM
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module bldc_pwm
        #(
            parameter   SUB_PAHSE_WIDTH = 12,
            parameter   ASYNC_UPDATE    = 0
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire                            pwm,
            input   wire    [3+SUB_PAHSE_WIDTH-1:0] phase,
            output  wire                            update,
            
            
            output  wire                            pwm_u,
            output  wire                            pwm_v,
            output  wire                            pwm_w,
            output  wire                            en_u,
            output  wire                            en_v,
            output  wire                            en_w
        );
    
    
    reg     [SUB_PAHSE_WIDTH-1:0]   st0_counter;
    reg     [2:0]                   st0_phase_main;
    reg     [SUB_PAHSE_WIDTH-1:0]   st0_phase_sub;
    reg     [2:0]                   st1_phase_main;
    reg     [SUB_PAHSE_WIDTH-1:0]   st1_phase_sub;
    reg     [2:0]                   st2_phase_main;
    reg     [2:0]                   st3_pwm;
    reg     [2:0]                   st3_en;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_counter    <= {SUB_PAHSE_WIDTH{1'b0}};
            st0_phase_main <= 3'd0;
            st0_phase_sub  <= {SUB_PAHSE_WIDTH{1'b0}};
            st1_phase_main <= 3'd0;
            st1_phase_sub  <= {SUB_PAHSE_WIDTH{1'b0}};
            st2_phase_main <= 3'd0;
            st3_pwm     <= 3'b001;
        end
        else begin
            // stage 0
            st0_counter <= st0_counter + 1'b1;
            if ( update || ASYNC_UPDATE ) begin
                {st0_phase_main, st0_phase_sub} <= phase;
            end
            
            // stage 1
            if ( pwm ) begin
                {st1_phase_main, st1_phase_sub} <= {st0_phase_main, st0_phase_sub} + st0_counter;
            end
            else begin
                {st1_phase_main, st1_phase_sub} <= {st0_phase_main, st0_phase_sub};
            end
            
            // stage 2
            st2_phase_main <= st1_phase_main > 3'd5 ? 3'd0 : st1_phase_main;
            
            // stage 3
            case (st2_phase_main)
            //                                wvu                wvu
            3'd0:       begin   st3_pwm <= 3'b001;  st3_en <= 3'b011;   end
            3'd1:       begin   st3_pwm <= 3'b100;  st3_en <= 3'b110;   end
            3'd2:       begin   st3_pwm <= 3'b100;  st3_en <= 3'b101;   end
            3'd3:       begin   st3_pwm <= 3'b010;  st3_en <= 3'b011;   end
            3'd4:       begin   st3_pwm <= 3'b010;  st3_en <= 3'b110;   end
            3'd5:       begin   st3_pwm <= 3'b001;  st3_en <= 3'b101;   end
            default:    begin   st3_pwm <= 3'bxxx;  st3_en <= 3'bxxx;   end
            endcase
        end
    end
    
    assign update = (st0_counter == {SUB_PAHSE_WIDTH{1'b1}});
    
    assign {pwm_w, pwm_v, pwm_u} = st3_pwm;
    assign {en_w,  en_v,  en_u}  = st3_en;
    
endmodule


`default_nettype wire


// end of file

