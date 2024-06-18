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
// 
// Speech256 controller / sequencer
//

module CONTROLLER (
        clk,        // global Speech256 clock
        rst_an,     
        ldq,        // load request, is high when new allophone can be loaded
        data_in,    // allophone input
        data_stb,   // allophone strobe input
        period_out, // pitch period output 
        amp_out,    // amplitude output
        coeff_out,  // 8-bit coefficient data out
        coeff_stb,  // '1' when coeff_out holds new coefficient data
        clear_states, // outputs '1' to reset filter states
        period_done_in // should be '1' when the source finished a period
    );

	//////////// CLOCK //////////
	input clk;

    //////////// RESET, ACTIVE LOW //////////
    input rst_an;

	//////////// OUTPUTS //////////
    output reg clear_states;
    output reg ldq;
    output reg coeff_stb;
    output reg signed [9:0] coeff_out;
    output reg [15:0] amp_out;
    output reg [7:0]  period_out;
    //output reg [7:0]  dur_out;
    
	//////////// INPUTS //////////
    input [5:0] data_in;
    input       data_stb;
    input       period_done_in; // used for duration counting

    // internal counter and data registers
    wire [7:0]  rom_data;
    reg  [11:0] rom_addr;
    reg  [11:0] last_rom_addr;
    reg  [2:0]  rom_addr_sel;
    wire  rom_en;

    reg  [3:0]  jmpmsb;
    reg  jmpmsb_load;

    reg  [5:0]  cur_allo;
    reg  [3:0]  cur_cmd;
    
    reg  [3:0] cur_state;
    reg  [3:0] next_state;

    reg  [5:0] data_in_buf;

    reg amp1_load, amp2_load;
    reg period_load;
    reg dur_load;
    reg allo_load;
    reg load_cur_cmd;
    reg serve_pitch_data;
    reg set_ldq, reset_ldq;
    reg dur_cnt_clear;
    wire serve_next_allo_data;

    reg  [15:0] amp_tmp;
    reg  [7:0]  period_tmp;
    reg  [7:0]  dur_tmp;
    reg  [7:0]  duration;
    reg  [7:0]  dur_cnt;
    
    reg  [2:0]  coeff_cnt;
    reg  [1:0]  coeff_cnt_update;

    wire  [9:0]  coeff10bit;

    wire done;

    // control program ROM
    CTRLROM u_ctrlrom (
        .clk        (clk),
        .data       (rom_data),
        .addr       (rom_addr),
        .en         (rom_en)
    );

    localparam ROM_ADDR_ZERO = 3'b000,    // zero the ROM address 
              ROM_ADDR_INC  = 3'b001,    // increment the ROM address
              ROM_ADDR_JMP  = 3'b010,    // jump to code
              ROM_ADDR_ALLO = 3'b011,    // read allophone jump address
              ROM_ADDR_NOP  = 3'b100;

    localparam COEFF_CNT_ZERO = 2'b00,   // zero coefficient counter
              COEFF_CNT_NOP  = 2'b01,   // do nothing
              COEFF_CNT_INC  = 2'b10;   // increment coefficient counter

    // 8-bit -> 10-bit coefficient expander
    XLAT u_xlat (
        .c8_in(rom_data),
        .c10_out(coeff10bit)
    );

    assign rom_en = 1;
    
    always @(posedge clk or negedge rst_an)
    begin
        if (rst_an == 0)
        begin
            // reset values
            amp_out    <= 0;
            period_out <= 8'd1;
            //rom_addr   <= 0;
            last_rom_addr <= 0;
            cur_state  <= 0;
            cur_allo   <= 0;
            cur_cmd    <= 0;
            //coeff_out  <= 0;
            coeff_cnt  <= 0;
            jmpmsb     <= 0;
            ldq        <= 0;
            dur_cnt    <= 0;
            duration   <= 0;
        end
        else
        begin
            // clocked process
            cur_state <= next_state;

            case (coeff_cnt_update)
                COEFF_CNT_ZERO:
                    coeff_cnt <= 0;
                COEFF_CNT_NOP:
                    coeff_cnt <= coeff_cnt;
                COEFF_CNT_INC:
                    coeff_cnt <= coeff_cnt + 1;
                default:
                    coeff_cnt <= 0;
            endcase

            if (jmpmsb_load) 
                jmpmsb <= rom_data[3:0];

            if (amp1_load)
                amp_tmp[7:0] <= rom_data;

            if (amp2_load)
                amp_tmp[15:8] <= rom_data;                

            if (period_load)
                period_tmp <= rom_data;

            if (dur_load)
                dur_tmp <= rom_data;

            if (allo_load)
                cur_allo <= data_in;

            if (load_cur_cmd)
                cur_cmd <= rom_data[3:0];

            if (serve_pitch_data)
            begin
                duration   <= dur_tmp;
                amp_out    <= amp_tmp;
                period_out <= period_tmp;
            end

            if (set_ldq == 1)
                ldq <= 1;
            else if (data_stb == 1)
                ldq <= 0;

            if ((period_done_in == 1) && (!serve_next_allo_data))
            begin
                dur_cnt <= dur_cnt + 1;
            end

            if (dur_cnt_clear)
            begin
                dur_cnt <= 0;
            end

            last_rom_addr <= rom_addr;
        end
    end

    assign serve_next_allo_data = (dur_cnt == duration) ? 1 : 0;

    localparam S_IDLE     = 4'd0,
              S_JMPADDR1 = 4'd1,
              S_JMPADDR2 = 4'd2,
              S_JMPADDR3 = 4'd3,             
              S_CMDLOAD  = 4'd4,
              S_CMDDECODE= 4'd5,
              S_LOADAMP1 = 4'd6,
              S_LOADAMP2 = 4'd7,
              S_LOADDUR  = 4'd8,
              S_LOADPERIOD= 4'd9,
              S_SERVEGATE = 4'd10,
              S_LOADCOEF1 = 4'd11,
              S_LOADCOEF2 = 4'd12;
            
    always @(*)
    begin
        // rom address multiplexer
        case (rom_addr_sel)
            ROM_ADDR_ZERO:
                rom_addr <= 0;
            ROM_ADDR_INC:
                rom_addr <= last_rom_addr + 1;
            ROM_ADDR_JMP:
                rom_addr <= {jmpmsb, rom_data[7:0]};
            ROM_ADDR_ALLO:
                rom_addr <= {5'b00000, cur_allo, 1'b0};
            ROM_ADDR_NOP:
                rom_addr <= last_rom_addr;
            default:
                rom_addr <= 0;
        endcase    
    end

    always @(*)
    begin
        // ---------------------------------------------
        // -------- MAIN FINITE STATE MACHINE ----------
        // ---------------------------------------------

        // FSM defaults:
        rom_addr_sel     <= ROM_ADDR_INC;
        coeff_cnt_update <= COEFF_CNT_NOP;

        next_state <= cur_state;

        coeff_stb   <= 0;
        jmpmsb_load <= 0;
        amp1_load   <= 0;
        amp2_load   <= 0;
        period_load <= 0;
        dur_load    <= 0;
        allo_load   <= 0;
        load_cur_cmd <= 0;
        set_ldq      <= 0;
        clear_states <= 0;

        serve_pitch_data <= 0;
        dur_cnt_clear <= 0;

        case (cur_state)
            S_IDLE:
                begin
                    if (serve_next_allo_data == 1)
                    begin
                        // we've run out of allophone data ..
                    end
                    if (data_stb == 1)
                    begin
                        allo_load  <= 1;
                        //reset_ldq  <= 1;
                        next_state <= S_JMPADDR1;
                    end
                    else
                        set_ldq <= 1;

                    rom_addr_sel <= ROM_ADDR_ZERO;         
                end
            S_JMPADDR1:
                begin
                    // get MSB of allophone address code
                    rom_addr_sel <= ROM_ADDR_ALLO;
                    next_state <= S_JMPADDR2;
                end
            S_JMPADDR2:
                begin
                    // get LSB of allophone address code
                    jmpmsb_load  <= 1;
                    rom_addr_sel <= ROM_ADDR_INC;                    
                    next_state <= S_CMDLOAD;
                end
            S_JMPADDR3:
                begin                    
                    next_state <= S_CMDLOAD;
                end
            S_CMDLOAD:
                begin
                    // perform jmp                    
                    rom_addr_sel <= ROM_ADDR_JMP;
                    next_state <= S_CMDDECODE;
                end
            S_CMDDECODE:
                begin
                    // current command and
                    // terminate sequencer if
                    // CMD == 0xF
                    if (rom_data == 4'hF)
                        next_state <= S_IDLE;   // end of command
                    else 
                    begin
                        rom_addr_sel <= ROM_ADDR_INC;
                        next_state <= S_LOADAMP1;
                    end
                    load_cur_cmd <= 1;
                    //cur_cmd <= rom_data;
                end
            S_LOADAMP1: // load 16-bit AMP
                begin
                    amp1_load  <= 1;
                    rom_addr_sel <= ROM_ADDR_INC;
                    next_state <= S_LOADAMP2;
                end
            S_LOADAMP2:
                begin
                    amp2_load  <= 1;
                    rom_addr_sel <= ROM_ADDR_INC;
                    next_state <= S_LOADDUR;
                end
            S_LOADDUR:
                begin
                    dur_load <= 1;
                    rom_addr_sel <= ROM_ADDR_INC;
                    next_state <= S_LOADPERIOD;
                end
            S_LOADPERIOD:
                begin
                    period_load <= 1;
                    coeff_cnt_update <= COEFF_CNT_ZERO;
                    rom_addr_sel <= ROM_ADDR_INC;
                    next_state <= S_SERVEGATE;
                end
            S_SERVEGATE:
                begin
                    rom_addr_sel <= ROM_ADDR_NOP;
                    if (serve_next_allo_data == 1)
                    begin
                        serve_pitch_data <= 1;
                        dur_cnt_clear    <= 1;
                        if (cur_cmd == 4'd2)
                        begin
                            clear_states <= 1;
                            next_state <= S_LOADCOEF1;
                        end
                        else
                        begin
                            next_state <= S_CMDDECODE;
                        end
                        
                    end
                end                            
            S_LOADCOEF1:
                // send F coefficient
                begin
                    coeff_stb <= 1;
                    coeff_out <= coeff10bit;
                    coeff_cnt_update <= COEFF_CNT_INC;
                    rom_addr_sel <= ROM_ADDR_INC;
                    next_state <= S_LOADCOEF2;
                end
            S_LOADCOEF2:
                // send B coefficient
                begin
                    coeff_stb <= 1;
                    coeff_out <= coeff10bit;                    
                    if (coeff_cnt == 3'd6)
                        next_state <= S_CMDDECODE; // load next section
                    else
                        next_state <= S_LOADCOEF1; // next command
                    
                    rom_addr_sel <= ROM_ADDR_INC;
                end
            default:
                next_state <= S_IDLE;
        endcase
    end

endmodule
