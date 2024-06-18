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
// 12th order all-pole filter with
// internal coefficient RAM
//

module FILTER (
        clk, 
        rst_an, 
        
        // coefficient loading interface
        coef_in,        // 10 bit sign-magnitude coefficient
        coef_load,      // pulse '1' to load the coefficient into the internal register
        clear_states,   // set to '1' to reset internal filter states
        // signal I/O and handshaking
        sig_in,         // 16-bit (scaled) source input signal
        sig_out,        // 16-bit filter output signal
        start,          // trigger processing of the input signal
        done            // goes to '1' when sig_out has valid data
    );
    
    parameter DEBUG = 0; //defult value

	//////////// CLOCK //////////
	input clk;

    //////////// RESET, ACTIVE LOW //////////
    input rst_an;

    //////////// FILTER INPUTS //////////
    input signed [15:0] sig_in;
    input signed [9:0]  coef_in;
    input start, coef_load;
    input clear_states; // zero all states

	//////////// FILTER OUTPUTS //////////
	output wire signed [15:0] sig_out;
    output reg done;

    //////////// internal signals //////////
    reg signed [9:0]  coefmem [0:11];   // coefficient memory / shift register
    reg signed [15:0] state1  [0:5];    // state 1 memory / shift register
    reg signed [15:0] state2  [0:5];    // state 2 memory / shift register
    reg signed [15:0] accu;             // accumulator

    reg mul_start;                      // if 1, trigger start of multiplier
    reg state_sel;                      // if 1, input to multiplier is state2, else state1
    reg accu_sel;                       // if 1, input to accumulator is accu, else sig_in
    reg do_accu;                        // if 1, the accumulator is updated
    reg double_mode;                    // if 1, the input to the accumulator is x2
    reg update_states;                  // shift the state registers
    
    reg update_coeffs;                  // shift the coefficient registers
    reg [3:0] cur_state;                // current FSM state
    reg [3:0] next_state;               // next FSM state
    
    reg clear_section, inc_section;
    reg [2:0] section;                  // current filter section being processed (0..5)

    wire mul_done;
    wire signed [15:0] mul_result, accu_in, mul_in;
    wire [9:0] mul_coeff;

    integer i;

    // serial/parallel mulitplier
    SPMUL u_spmul (
        .clk        (clk),
        .rst_an     (rst_an),
        .sig_in     (mul_in),
        .coef_in    (mul_coeff),
        .result_out (mul_result),
        .start      (mul_start),
        .done       (mul_done)
    );

    // signal input mux for multipliers
    assign mul_in = (state_sel) ? state2[5] : state1[5];
    assign accu_in = (accu_sel) ? accu : sig_in;
    assign mul_coeff = coefmem[11];
    assign sig_out = accu;

    // clocked stuff..
    always @(posedge clk, negedge rst_an)
    begin
        if (rst_an == 0)
        begin
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            // reset cycle here ..
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            for(i=0; i<6; i=i+1)
            begin
                state1[i]  <= 0;
                state2[i]  <= 0;
            end
            for(i=0; i<12; i=i+1)
            begin
                coefmem[i] <= 0;
            end

            // accumulator
            accu      <= 0;
            cur_state <= 4'b0000;
            section   <= 0;
        end
        else
        begin
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            // regular clock cycle here ..
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

            // update the filter states if necessary
            if (clear_states == 1)
            begin
                // clear all states
                for(i=0; i<6; i=i+1)
                begin
                    state1[i] <= 0;
                    state2[i] <= 0;
                end            
            end
            else
            if (update_states == 1)
            begin
                state1[0] <= accu;
                state2[0] <= state1[5];   

                for(i=1; i<6; i=i+1)
                begin
                    state1[i] <= state1[i-1];
                    state2[i] <= state2[i-1];
                end

                //if (DEBUG == 1)
                //    $display("BOOM accu: %d  states: %d %d %d %d %d %d", accu, state1[0], state1[1], state1[2],state1[3],state1[4],state1[5]);
            end                

            // update the coefficients if necessary
            if ((update_coeffs) || (coef_load))
            begin
                for(i=1; i<12; i=i+1)
                begin
                    coefmem[i] <= coefmem[i-1];
                end
                // load from external interface if coef_load = 1
                // else just rotate
                if (coef_load == 1)
                begin
                    coefmem[0] <= coef_in;
                    //$display("Loaded coefficient: coefmem[0] = %xh", coef_in);
                end
                else
                    coefmem[0] <= coefmem[11];
            end

            // update the accumulator if necessary
            if (do_accu)
            begin
                if (double_mode)
                    accu <= accu_in + {mul_result[14:0], 1'b0};                    
                else
                    accu <= accu_in + mul_result;
            end

            // handle section counter
            if (clear_section == 1)
            begin
                section <= 0;
            end
            else if (inc_section == 1)
            begin
                section <= section + 1;
            end

            // update FSM state
            cur_state <= next_state;
        end
    end

    // FSM states
    localparam S_IDLE     = 4'b0000,
              S_DUMMY1   = 4'b0001,
              S_WAITMUL1 = 4'b0010,
              S_UPDATEC1 = 4'b0011,
              S_DOSTATE2 = 4'b0100,
              S_DUMMY2   = 4'b0101,
              S_WAITMUL2 = 4'b0110,
              S_UPDATEC2 = 4'b0111,
              S_NEXTSEC  = 4'b1000,
              S_DOSTATE1B= 4'b1001,
              S_WAITMUL3 = 4'b1010,
              S_UPDATEC3 = 4'b1011;

    always@(*)
    begin
        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        // FSM combinational stuff
        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        // defaults
        done      <= 0;
        do_accu   <= 0;
        mul_start <= 0;
        state_sel <= 0;
        accu_sel  <= 0;
        double_mode <= 0;
        update_states <= 0;
        update_coeffs <= 0;
        inc_section   <= 0;
        clear_section <= 0;
        next_state <= cur_state;

        case(cur_state)
            S_IDLE: // IDLE state
                begin
                    done <= 1;
                    clear_section <= 1;
                    if (start == 1)
                    begin
                        // state1 * coeff[0]
                        state_sel <= 0; // state 1 as mul input
                        mul_start <= 1; // trigger multiplier
                        next_state <= S_DUMMY1;

                        if (DEBUG == 1)
                        begin
                            for(i=0; i<6; i=i+1)
                            begin
                                //$display("Section %d:   %d   %d", i, state1[i], state2[i]);
                            end
                        end
                        
                    end
                end
            S_DUMMY1:   // Dummy cycle to wait for mul_done
                        // to reach a valid state
                begin
                    next_state <= S_WAITMUL1;
                end
            S_WAITMUL1: // wait for multiplier to complete
                begin
                    if (mul_done == 1)
                    begin                        
                        accu_sel <= 0;      // accu = sig_in + mul_result
                        do_accu  <= 1;      // update accu
                        double_mode <= 1;   // a1 coefficient has double the weight
                        next_state <= S_UPDATEC1;
                    end
                end
            S_UPDATEC1: // update accu, 1st section only!
                begin                                            
                    update_coeffs <= 1;     // advance to coeff[1]
                    next_state <= S_DOSTATE2;
                end
            S_DOSTATE2: // state2 * coeff[1]
                begin
                    state_sel <= 1; // state 2 as mul input
                    mul_start <= 1; // trigger multiplier
                    next_state <= S_DUMMY2;
                end
            S_DUMMY2: // dummy state to wait for mul_done
                        // to become valid
                begin
                    next_state <= S_WAITMUL2;
                end                         
            S_WAITMUL2: // wait for multiplier to complete
                begin
                    if (mul_done == 1)
                    begin
                        inc_section <= 1;
                        next_state <= S_UPDATEC2;
                        accu_sel <= 1; // accu = accu + mul_result
                        do_accu  <= 1;                            
                    end
                end                    
            S_UPDATEC2: // update accumulator and filter states
                begin
                    update_coeffs <= 1; // advance to next section..
                    update_states <= 1;

                    // check if this is the last section..
                    if (section==4'b0110)
                    begin
                        next_state <= S_IDLE;   // one complete filter set done..
                    end
                    else
                        next_state <= S_NEXTSEC;   // next..
                end
            S_NEXTSEC: 
                begin
                    // next section: state1 * coeff[0]                    
                    state_sel <= 0; // state 1 as mul input
                    mul_start <= 1; // trigger multiplier                            
                    next_state <= S_DOSTATE1B;
                end
            S_DOSTATE1B: // Dummy cycle to wait for mul_done
                        // to reach a valid state
                begin
                    next_state <= S_WAITMUL3;
                end
            S_WAITMUL3: // wait for multiplier to complete
                begin
                    if (mul_done == 1)
                    begin                        
                        accu_sel <= 1; // accu = accu + mul_result
                        do_accu  <= 1;
                        double_mode <= 1; // a1 coefficient has double the weight
                        next_state <= S_UPDATEC3;
                    end
                end
            S_UPDATEC3: // update accu, 2nd..5th section only!
                begin
                    update_coeffs <= 1; // advance to coeff[1]
                    next_state <= S_DOSTATE2;
                end
            default:
                next_state <= S_IDLE;
        endcase
    end

endmodule    
