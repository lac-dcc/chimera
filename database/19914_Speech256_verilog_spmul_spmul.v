// This program was cloned from: https://github.com/trcwm/Speech256
// License: GNU Lesser General Public License v3.0

// SPEECH 256
// Copyright (C) 2017 Niels Moseley / Moseley Instruments
// http://www.moseleyinstruments.com
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// 
// 16bit x 10bit signed serial/parallel multiplier.
//

module SPMUL (
        clk, 
        rst_an, 
        sig_in, 
        coef_in, 
        result_out,
        start,
        done
    );

    //////////// CLOCK //////////
    input clk;

    //////////// RESET, ACTIVE LOW //////////
    input rst_an;

    //////////// MULTIPLIER INPUTS //////////
    input signed [15:0] sig_in;
    input signed [9:0]  coef_in;
    input start;

    //////////// MULTIPLIER OUTPUT //////////
    output reg signed [15:0] result_out;
    output reg done;

    //////////// internal signals //////////
    reg signed [24:0] accumulator;  
    reg signed [9:0]  coefreg;
    reg signed [15:0] sigreg;
    reg push_result;
    reg load_operands;
    reg [3:0]         cur_state;        // cur_state machine cur_state
    reg [3:0]         next_state;
    
    reg domulcycle, accu_clr;

    // clocked process
    always @(posedge clk or negedge rst_an)
    begin
        if (rst_an == 0)
        begin
            accumulator <= 0;
            coefreg     <= 0;
            cur_state   <= 0;
        end
        else
        begin
            if (accu_clr == 1)
            begin
                accumulator <= 0;
            end
            
            if (load_operands == 1)
            begin
                coefreg  <= coef_in;
                sigreg   <= sig_in;
            end
            
            if (domulcycle == 1)
            begin
                // note: leave coefreg[9] untouched
                // as this is the sign bit...
                if (coefreg[8] == 1'b1)
                    accumulator <= $signed({accumulator[23:0], 1'b0}) + sigreg;
                else    
                    accumulator <= {accumulator[23:0], 1'b0};
                
                coefreg[8:0] <= {coefreg[7:0], 1'b0};            
            end

            if (push_result == 1)
            begin
                if (coefreg[9] == 0)
                    result_out <= accumulator[24:9];
                else
                    result_out <= $signed(~accumulator[24:9]) + 1;
            end

            cur_state <= next_state;
        end
    end
           
    parameter S_IDLE    = 4'b0000,
              S_CYCLE1  = 4'b0001,
              S_CYCLE2  = 4'b0010,
              S_CYCLE3  = 4'b0011,
              S_CYCLE4  = 4'b0100,
              S_CYCLE5  = 4'b0101,
              S_CYCLE6  = 4'b0110,
              S_CYCLE7  = 4'b0111,
              S_CYCLE8  = 4'b1000,
              S_CYCLE9  = 4'b1001,
              S_CYCLE10 = 4'b1010;

    // FSM combinational process
    always @(*)
    begin

        // FSM defaults
        done        <= 0;
        next_state  <= cur_state;
        accu_clr    <= 0;
        domulcycle  <= 0;
        push_result <= 0;
        load_operands <= 0;

        case(cur_state)
            S_IDLE: // IDLE cur_state
                begin
                    accu_clr <= 1;
                    if (start == 1)
                    begin
                        load_operands <= 1;
                        next_state <= S_CYCLE1;
                    end
                    else    
                    begin
                        done       <= 1;
                        next_state <= S_IDLE;
                    end
                end
            S_CYCLE1: 
                begin
                    domulcycle <= 1;
                    next_state <= S_CYCLE2;
                end
            S_CYCLE2: 
                begin
                    domulcycle <= 1;
                    next_state <= S_CYCLE3;
                end
            S_CYCLE3: 
                begin
                    domulcycle <= 1;
                    next_state <= S_CYCLE4;
                end
            S_CYCLE4: 
                begin
                    domulcycle <= 1;
                    next_state <= S_CYCLE5;
                end
            S_CYCLE5: 
                begin
                    domulcycle <= 1;
                    next_state <= S_CYCLE6;
                end
            S_CYCLE6:
                begin
                    domulcycle <= 1;
                    next_state <= S_CYCLE7;
                end
            S_CYCLE7:
                begin
                    domulcycle <= 1;
                    next_state <= S_CYCLE8;
                end
            S_CYCLE8:
                begin
                    domulcycle <= 1;
                    next_state <= S_CYCLE9;
                end
            S_CYCLE9:
                begin
                    domulcycle <= 1;
                    next_state <= S_CYCLE10;
                end
            S_CYCLE10:
                begin
                    push_result <= 1;
                    next_state <= S_IDLE;
                end
            default:
                next_state <= S_IDLE;
        endcase
    end
endmodule
