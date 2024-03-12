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
// Speech256 DE0 board top level
//

//`define USE_SDDAC
`define YOUTUBE_MESSAGE

module Speech256_DE0 (
    CLOCK_50,
    //SW,
    //BUTTON,
    //LEDG,
    UART_TXD,
    //HEX1_D,
    //HEX2_D
);

    input  CLOCK_50;
    //input  [0:5] SW;
    //input  [0:2] BUTTON;
    //output [6:0] HEX1_D;
    //output [6:0] HEX2_D;
    //output [9:0] LEDG;
    output UART_TXD;

    reg  [5:0] data_in;
    reg  data_stb;
    reg  clk;
    reg  [3:0] divcnt; // clock divider counter
    reg  [2:0] cur_state, next_state;
    
    reg [9:0] rom_addr;
    reg [5:0] rom_data;
    reg inc_rom_addr;

    // debug signals for 16-bit DAC
    wire sample_stb;
    wire signed [15:0] sample_out;
    
    wire ldq;
    wire rst_an;

    SPEECH256_TOP u_speech256_top (
        .clk        (clk),
        .rst_an     (rst_an),
        .ldq        (ldq),
        .data_in    (rom_data),
        .data_stb   (data_stb),
        .pwm_out    (UART_TXD),
        .sample_out (sample_out),
        .sample_stb (sample_stb)
    );

    assign rst_an = 1'b1;

    parameter S_IDLE       = 4'b000,
              S_ALLOPHONE  = 4'b001,
              S_WAITDONE   = 4'b010;

    always @(posedge CLOCK_50)
    begin

        // clock divider to generate 2.5 MHz for Speech256
        if (divcnt > 9)
        begin
            clk <= !clk;
            divcnt <= 0;            
        end
        else
        begin
            divcnt <= divcnt + 1;
        end        
    end

    always @(posedge clk)
    begin
        cur_state <= next_state;
        if (inc_rom_addr == 1)
            rom_addr <= rom_addr + 1;
    end

    always @(*)
    begin
        // FSM defaults
        data_stb <= 0;
        inc_rom_addr <= 0;
        next_state <= cur_state;
        
        case(cur_state)
        S_IDLE:
            begin
                //if ((ldq == 1) && (BUTTON[0] == 1))
                if (ldq == 1)
                begin
                    inc_rom_addr <= 1;
                    next_state <= S_ALLOPHONE;
                end
                else
                    next_state <= S_IDLE;
            end
        S_ALLOPHONE:
            begin
                data_stb   <= 1;
                next_state <= S_WAITDONE;
            end
        S_WAITDONE:
            begin
                if (ldq == 0)
                begin
                    next_state <= S_IDLE;
                end
            end
        default:
            begin
                next_state <= S_IDLE;
            end
        endcase

        // allophone ROM
        // hello, world        
`ifdef HELLO_WORLD        
        case (rom_addr)
            4'd0:   
                rom_data <= 6'h1B;
            4'd1:   
                rom_data <= 6'h07;
            4'd2:   
                rom_data <= 6'h2D;
            4'd3:   
                rom_data <= 6'h35;
            4'd4:   
                rom_data <= 6'h03;
            4'd5:   
                rom_data <= 6'h2E;
            4'd6:   
                rom_data <= 6'h1E;
            4'd7:   
                rom_data <= 6'h33;
            4'd8:   
                rom_data <= 6'h2D;
            4'd9:   
                rom_data <= 6'h15;
            4'd10:   
                rom_data <= 6'h03;
            default:   
                rom_data <= 6'h03;
        endcase
    end
`endif

`ifdef TEST1
        case (rom_addr)
            8'h00: rom_data <= 6'h21;
            8'h01: rom_data <= 6'h14;
            8'h02: rom_data <= 6'h00;
            8'h03: rom_data <= 6'h2B;
            8'h04: rom_data <= 6'h13;
            8'h05: rom_data <= 6'h04;
            8'h06: rom_data <= 6'h21;
            8'h07: rom_data <= 6'h14;
            8'h08: rom_data <= 6'h00;
            8'h09: rom_data <= 6'h2B;
            8'h0A: rom_data <= 6'h13;
            8'h0B: rom_data <= 6'h03;
            8'h0C: rom_data <= 6'h0D;
            8'h0D: rom_data <= 6'h3E;
            8'h0E: rom_data <= 6'h2D;
            8'h0F: rom_data <= 6'h02;
            8'h10: rom_data <= 6'h10;
            8'h11: rom_data <= 6'h13;
            8'h12: rom_data <= 6'h02;
            8'h13: rom_data <= 6'h0D;
            8'h14: rom_data <= 6'h27;
            8'h15: rom_data <= 6'h16;
            8'h16: rom_data <= 6'h04;
            8'h17: rom_data <= 6'h06;
            8'h18: rom_data <= 6'h10;
            8'h19: rom_data <= 6'h02;
            8'h1A: rom_data <= 6'h18;
            8'h1B: rom_data <= 6'h28;
            8'h1C: rom_data <= 6'h27;
            8'h1D: rom_data <= 6'h14;
            8'h1E: rom_data <= 6'h15;
            8'h1F: rom_data <= 6'h03;
            8'h20: rom_data <= 6'h06;
            8'h21: rom_data <= 6'h02;
            8'h22: rom_data <= 6'h2A;
            8'h23: rom_data <= 6'h1A;
            8'h24: rom_data <= 6'h0B;
            8'h25: rom_data <= 6'h11;
            8'h26: rom_data <= 6'h03;
            8'h27: rom_data <= 6'h21;
            8'h28: rom_data <= 6'h1F;
            8'h29: rom_data <= 6'h02;
            8'h2A: rom_data <= 6'h1D;
            8'h2B: rom_data <= 6'h1A;
            8'h2C: rom_data <= 6'h0D;
            8'h2D: rom_data <= 6'h04;
            8'h2E: rom_data <= 6'h21;
            8'h2F: rom_data <= 6'h14;
            8'h30: rom_data <= 6'h23;
            8'h31: rom_data <= 6'h04;
            8'h32: rom_data <= 6'h19;
            8'h33: rom_data <= 6'h07;
            8'h34: rom_data <= 6'h07;
            8'h35: rom_data <= 6'h37;
            8'h36: rom_data <= 6'h37;
            8'h37: rom_data <= 6'h02;
            8'h38: rom_data <= 6'h1A;
            8'h39: rom_data <= 6'h0B;
            8'h3A: rom_data <= 6'h15;
            8'h3B: rom_data <= 6'h03;
            8'h3C: rom_data <= 6'h38;
            8'h3D: rom_data <= 6'h0F;
            8'h3E: rom_data <= 6'h35;
            8'h3F: rom_data <= 6'h04;
            8'h40: rom_data <= 6'h2B;
            8'h41: rom_data <= 6'h3C;
            8'h42: rom_data <= 6'h35;
            8'h43: rom_data <= 6'h03;
            8'h44: rom_data <= 6'h2E;
            8'h45: rom_data <= 6'h0F;
            8'h46: rom_data <= 6'h0F;
            8'h47: rom_data <= 6'h0B;
            8'h48: rom_data <= 6'h03;
            8'h49: rom_data <= 6'h0D;
            8'h4A: rom_data <= 6'h1F;
            8'h4B: rom_data <= 6'h03;
            8'h4C: rom_data <= 6'h1D;
            8'h4D: rom_data <= 6'h0E;
            8'h4E: rom_data <= 6'h13;
            8'h4F: rom_data <= 6'h03;
            8'h50: rom_data <= 6'h28;
            8'h51: rom_data <= 6'h28;
            8'h52: rom_data <= 6'h3A;
            8'h53: rom_data <= 6'h03;
            8'h54: rom_data <= 6'h28;
            8'h55: rom_data <= 6'h28;
            8'h56: rom_data <= 6'h06;
            8'h57: rom_data <= 6'h23;
            8'h58: rom_data <= 6'h03;
            8'h59: rom_data <= 6'h37;
            8'h5A: rom_data <= 6'h37;
            8'h5B: rom_data <= 6'h0C;
            8'h5C: rom_data <= 6'h1E;
            8'h5D: rom_data <= 6'h02;
            8'h5E: rom_data <= 6'h29;
            8'h5F: rom_data <= 6'h37;
            8'h60: rom_data <= 6'h03;
            8'h61: rom_data <= 6'h37;
            8'h62: rom_data <= 6'h37;
            8'h63: rom_data <= 6'h07;
            8'h64: rom_data <= 6'h07;
            8'h65: rom_data <= 6'h23;
            8'h66: rom_data <= 6'h0C;
            8'h67: rom_data <= 6'h0B;
            8'h68: rom_data <= 6'h03;
            8'h69: rom_data <= 6'h14;
            8'h6A: rom_data <= 6'h02;
            8'h6B: rom_data <= 6'h0D;
            8'h6C: rom_data <= 6'h03;
            8'h6D: rom_data <= 6'h0B;
            8'h6E: rom_data <= 6'h06;
            8'h6F: rom_data <= 6'h0B;
            8'h70: rom_data <= 6'h03;
            8'h71: rom_data <= 6'h0D;
            8'h72: rom_data <= 6'h07;
            8'h73: rom_data <= 6'h07;
            8'h74: rom_data <= 6'h0B;
            8'h75: rom_data <= 6'h04;
            8'h76: rom_data <= 6'h13;
            8'h77: rom_data <= 6'h02;
            8'h78: rom_data <= 6'h0D;
            8'h79: rom_data <= 6'h13;
            8'h7A: rom_data <= 6'h03;
            8'h7B: rom_data <= 6'h28;
            8'h7C: rom_data <= 6'h28;
            8'h7D: rom_data <= 6'h35;
            8'h7E: rom_data <= 6'h0B;
            8'h7F: rom_data <= 6'h02;
            8'h80: rom_data <= 6'h39;
            8'h81: rom_data <= 6'h35;
            8'h82: rom_data <= 6'h10;
            8'h83: rom_data <= 6'h10;
            8'h84: rom_data <= 6'h04;
            default: rom_data <= 6'h00;
        endcase
    end
`endif

`ifdef YOUTUBE_MESSAGE
        case (rom_addr)
            10'h00: rom_data <= 6'h3D;
            10'h01: rom_data <= 6'h27;
            10'h02: rom_data <= 6'h13;
            10'h03: rom_data <= 6'h0D;
            10'h04: rom_data <= 6'h0C;
            10'h05: rom_data <= 6'h2C;
            10'h06: rom_data <= 6'h37;
            10'h07: rom_data <= 6'h04;
            10'h08: rom_data <= 6'h09;
            10'h09: rom_data <= 6'h13;
            10'h0A: rom_data <= 6'h09;
            10'h0B: rom_data <= 6'h3E;
            10'h0C: rom_data <= 6'h02;
            10'h0D: rom_data <= 6'h17;
            10'h0E: rom_data <= 6'h23;
            10'h0F: rom_data <= 6'h02;
            10'h10: rom_data <= 6'h33;
            10'h11: rom_data <= 6'h1D;
            10'h12: rom_data <= 6'h1D;
            10'h13: rom_data <= 6'h02;
            10'h14: rom_data <= 6'h04;
            10'h15: rom_data <= 6'h04;
            10'h16: rom_data <= 6'h04;
            10'h17: rom_data <= 6'h04;
            10'h18: rom_data <= 6'h06;
            10'h19: rom_data <= 6'h02;
            10'h1A: rom_data <= 6'h1A;
            10'h1B: rom_data <= 6'h10;
            10'h1C: rom_data <= 6'h02;
            10'h1D: rom_data <= 6'h37;
            10'h1E: rom_data <= 6'h37;
            10'h1F: rom_data <= 6'h09;
            10'h20: rom_data <= 6'h13;
            10'h21: rom_data <= 6'h32;
            10'h22: rom_data <= 6'h0D;
            10'h23: rom_data <= 6'h1F;
            10'h24: rom_data <= 6'h01;
            10'h25: rom_data <= 6'h28;
            10'h26: rom_data <= 6'h28;
            10'h27: rom_data <= 6'h0C;
            10'h28: rom_data <= 6'h28;
            10'h29: rom_data <= 6'h28;
            10'h2A: rom_data <= 6'h01;
            10'h2B: rom_data <= 6'h0D;
            10'h2C: rom_data <= 6'h13;
            10'h2D: rom_data <= 6'h37;
            10'h2E: rom_data <= 6'h37;
            10'h2F: rom_data <= 6'h0C;
            10'h30: rom_data <= 6'h0C;
            10'h31: rom_data <= 6'h02;
            10'h32: rom_data <= 6'h29;
            10'h33: rom_data <= 6'h37;
            10'h34: rom_data <= 6'h04;
            10'h35: rom_data <= 6'h04;
            10'h36: rom_data <= 6'h0F;
            10'h37: rom_data <= 6'h0B;
            10'h38: rom_data <= 6'h02;
            10'h39: rom_data <= 6'h07;
            10'h3A: rom_data <= 6'h07;
            10'h3B: rom_data <= 6'h28;
            10'h3C: rom_data <= 6'h28;
            10'h3D: rom_data <= 6'h02;
            10'h3E: rom_data <= 6'h09;
            10'h3F: rom_data <= 6'h13;
            10'h40: rom_data <= 6'h02;
            10'h41: rom_data <= 6'h0A;
            10'h42: rom_data <= 6'h13;
            10'h43: rom_data <= 6'h02;
            10'h44: rom_data <= 6'h14;
            10'h45: rom_data <= 6'h02;
            10'h46: rom_data <= 6'h0C;
            10'h47: rom_data <= 6'h10;
            10'h48: rom_data <= 6'h01;
            10'h49: rom_data <= 6'h09;
            10'h4A: rom_data <= 6'h2D;
            10'h4B: rom_data <= 6'h07;
            10'h4C: rom_data <= 6'h10;
            10'h4D: rom_data <= 6'h07;
            10'h4E: rom_data <= 6'h0B;
            10'h4F: rom_data <= 6'h0D;
            10'h50: rom_data <= 6'h14;
            10'h51: rom_data <= 6'h32;
            10'h52: rom_data <= 6'h1E;
            10'h53: rom_data <= 6'h0B;
            10'h54: rom_data <= 6'h03;
            10'h55: rom_data <= 6'h17;
            10'h56: rom_data <= 6'h23;
            10'h57: rom_data <= 6'h02;
            10'h58: rom_data <= 6'h0F;
            10'h59: rom_data <= 6'h0B;
            10'h5A: rom_data <= 6'h02;
            10'h5B: rom_data <= 6'h14;
            10'h5C: rom_data <= 6'h02;
            10'h5D: rom_data <= 6'h0D;
            10'h5E: rom_data <= 6'h13;
            10'h5F: rom_data <= 6'h2B;
            10'h60: rom_data <= 6'h02;
            10'h61: rom_data <= 6'h37;
            10'h62: rom_data <= 6'h37;
            10'h63: rom_data <= 6'h09;
            10'h64: rom_data <= 6'h13;
            10'h65: rom_data <= 6'h32;
            10'h66: rom_data <= 6'h02;
            10'h67: rom_data <= 6'h37;
            10'h68: rom_data <= 6'h0C;
            10'h69: rom_data <= 6'h0B;
            10'h6A: rom_data <= 6'h1D;
            10'h6B: rom_data <= 6'h07;
            10'h6C: rom_data <= 6'h37;
            10'h6D: rom_data <= 6'h18;
            10'h6E: rom_data <= 6'h06;
            10'h6F: rom_data <= 6'h2B;
            10'h70: rom_data <= 6'h33;
            10'h71: rom_data <= 6'h02;
            10'h72: rom_data <= 6'h32;
            10'h73: rom_data <= 6'h0C;
            10'h74: rom_data <= 6'h0C;
            10'h75: rom_data <= 6'h09;
            10'h76: rom_data <= 6'h04;
            10'h77: rom_data <= 6'h04;
            10'h78: rom_data <= 6'h04;
            10'h79: rom_data <= 6'h04;
            10'h7A: rom_data <= 6'h04;
            10'h7B: rom_data <= 6'h06;
            10'h7C: rom_data <= 6'h02;
            10'h7D: rom_data <= 6'h2A;
            10'h7E: rom_data <= 6'h33;
            10'h7F: rom_data <= 6'h07;
            10'h80: rom_data <= 6'h0D;
            10'h81: rom_data <= 6'h2D;
            10'h82: rom_data <= 6'h13;
            10'h83: rom_data <= 6'h02;
            10'h84: rom_data <= 6'h2D;
            10'h85: rom_data <= 6'h0C;
            10'h86: rom_data <= 6'h23;
            10'h87: rom_data <= 6'h02;
            10'h88: rom_data <= 6'h18;
            10'h89: rom_data <= 6'h0B;
            10'h8A: rom_data <= 6'h02;
            10'h8B: rom_data <= 6'h0F;
            10'h8C: rom_data <= 6'h02;
            10'h8D: rom_data <= 6'h15;
            10'h8E: rom_data <= 6'h0C;
            10'h8F: rom_data <= 6'h0C;
            10'h90: rom_data <= 6'h0A;
            10'h91: rom_data <= 6'h02;
            10'h92: rom_data <= 6'h0C;
            10'h93: rom_data <= 6'h2D;
            10'h94: rom_data <= 6'h07;
            10'h95: rom_data <= 6'h07;
            10'h96: rom_data <= 6'h0B;
            10'h97: rom_data <= 6'h0D;
            10'h98: rom_data <= 6'h03;
            10'h99: rom_data <= 6'h21;
            10'h9A: rom_data <= 6'h13;
            10'h9B: rom_data <= 6'h02;
            10'h9C: rom_data <= 6'h13;
            10'h9D: rom_data <= 6'h02;
            10'h9E: rom_data <= 6'h2B;
            10'h9F: rom_data <= 6'h3C;
            10'hA0: rom_data <= 6'h35;
            10'hA1: rom_data <= 6'h02;
            10'hA2: rom_data <= 6'h1C;
            10'hA3: rom_data <= 6'h3A;
            10'hA4: rom_data <= 6'h15;
            10'hA5: rom_data <= 6'h04;
            10'hA6: rom_data <= 6'h04;
            10'hA7: rom_data <= 6'h1A;
            10'hA8: rom_data <= 6'h0B;
            10'hA9: rom_data <= 6'h15;
            10'hAA: rom_data <= 6'h02;
            10'hAB: rom_data <= 6'h06;
            10'hAC: rom_data <= 6'h03;
            10'hAD: rom_data <= 6'h31;
            10'hAE: rom_data <= 6'h16;
            10'hAF: rom_data <= 6'h2B;
            10'hB0: rom_data <= 6'h03;
            10'hB1: rom_data <= 6'h0F;
            10'hB2: rom_data <= 6'h3F;
            10'hB3: rom_data <= 6'h20;
            10'hB4: rom_data <= 6'h0D;
            10'hB5: rom_data <= 6'h02;
            10'hB6: rom_data <= 6'h37;
            10'hB7: rom_data <= 6'h37;
            10'hB8: rom_data <= 6'h07;
            10'hB9: rom_data <= 6'h07;
            10'hBA: rom_data <= 6'h23;
            10'hBB: rom_data <= 6'h0C;
            10'hBC: rom_data <= 6'h0B;
            10'hBD: rom_data <= 6'h02;
            10'hBE: rom_data <= 6'h39;
            10'hBF: rom_data <= 6'h0F;
            10'hC0: rom_data <= 6'h0F;
            10'hC1: rom_data <= 6'h0B;
            10'hC2: rom_data <= 6'h01;
            10'hC3: rom_data <= 6'h21;
            10'hC4: rom_data <= 6'h27;
            10'hC5: rom_data <= 6'h0C;
            10'hC6: rom_data <= 6'h0C;
            10'hC7: rom_data <= 6'h00;
            10'hC8: rom_data <= 6'h15;
            10'hC9: rom_data <= 6'h03;
            10'hCA: rom_data <= 6'h2D;
            10'hCB: rom_data <= 6'h17;
            10'hCC: rom_data <= 6'h0A;
            10'hCD: rom_data <= 6'h0C;
            10'hCE: rom_data <= 6'h0C;
            10'hCF: rom_data <= 6'h29;
            10'hD0: rom_data <= 6'h02;
            10'hD1: rom_data <= 6'h07;
            10'hD2: rom_data <= 6'h2D;
            10'hD3: rom_data <= 6'h07;
            10'hD4: rom_data <= 6'h10;
            10'hD5: rom_data <= 6'h07;
            10'hD6: rom_data <= 6'h0B;
            10'hD7: rom_data <= 6'h0D;
            10'hD8: rom_data <= 6'h37;
            10'hD9: rom_data <= 6'h03;
            10'hDA: rom_data <= 6'h1A;
            10'hDB: rom_data <= 6'h0B;
            10'hDC: rom_data <= 6'h15;
            10'hDD: rom_data <= 6'h02;
            10'hDE: rom_data <= 6'h28;
            10'hDF: rom_data <= 6'h28;
            10'hE0: rom_data <= 6'h3A;
            10'hE1: rom_data <= 6'h02;
            10'hE2: rom_data <= 6'h2A;
            10'hE3: rom_data <= 6'h13;
            10'hE4: rom_data <= 6'h2D;
            10'hE5: rom_data <= 6'h35;
            10'hE6: rom_data <= 6'h3F;
            10'hE7: rom_data <= 6'h06;
            10'hE8: rom_data <= 6'h0D;
            10'hE9: rom_data <= 6'h37;
            10'hEA: rom_data <= 6'h02;
            10'hEB: rom_data <= 6'h17;
            10'hEC: rom_data <= 6'h23;
            10'hED: rom_data <= 6'h02;
            10'hEE: rom_data <= 6'h0E;
            10'hEF: rom_data <= 6'h17;
            10'hF0: rom_data <= 6'h10;
            10'hF1: rom_data <= 6'h02;
            10'hF2: rom_data <= 6'h04;
            10'hF3: rom_data <= 6'h04;
            10'hF4: rom_data <= 6'h04;
            10'hF5: rom_data <= 6'h04;
            10'hF6: rom_data <= 6'h10;
            10'hF7: rom_data <= 6'h06;
            10'hF8: rom_data <= 6'h02;
            10'hF9: rom_data <= 6'h37;
            10'hFA: rom_data <= 6'h37;
            10'hFB: rom_data <= 6'h09;
            10'hFC: rom_data <= 6'h13;
            10'hFD: rom_data <= 6'h32;
            10'hFE: rom_data <= 6'h02;
            10'hFF: rom_data <= 6'h0C;
            10'h100: rom_data <= 6'h2B;
            10'h101: rom_data <= 6'h02;
            10'h102: rom_data <= 6'h1C;
            10'h103: rom_data <= 6'h14;
            10'h104: rom_data <= 6'h37;
            10'h105: rom_data <= 6'h0D;
            10'h106: rom_data <= 6'h02;
            10'h107: rom_data <= 6'h18;
            10'h108: rom_data <= 6'h0B;
            10'h109: rom_data <= 6'h02;
            10'h10A: rom_data <= 6'h12;
            10'h10B: rom_data <= 6'h07;
            10'h10C: rom_data <= 6'h02;
            10'h10D: rom_data <= 6'h08;
            10'h10E: rom_data <= 6'h17;
            10'h10F: rom_data <= 6'h2C;
            10'h110: rom_data <= 6'h08;
            10'h111: rom_data <= 6'h1A;
            10'h112: rom_data <= 6'h0D;
            10'h113: rom_data <= 6'h07;
            10'h114: rom_data <= 6'h0B;
            10'h115: rom_data <= 6'h14;
            10'h116: rom_data <= 6'h32;
            10'h117: rom_data <= 6'h1E;
            10'h118: rom_data <= 6'h38;
            10'h119: rom_data <= 6'h02;
            10'h11A: rom_data <= 6'h17;
            10'h11B: rom_data <= 6'h23;
            10'h11C: rom_data <= 6'h02;
            10'h11D: rom_data <= 6'h1A;
            10'h11E: rom_data <= 6'h2D;
            10'h11F: rom_data <= 6'h35;
            10'h120: rom_data <= 6'h28;
            10'h121: rom_data <= 6'h35;
            10'h122: rom_data <= 6'h0B;
            10'h123: rom_data <= 6'h37;
            10'h124: rom_data <= 6'h03;
            10'h125: rom_data <= 6'h04;
            10'h126: rom_data <= 6'h04;
            10'h127: rom_data <= 6'h12;
            10'h128: rom_data <= 6'h07;
            10'h129: rom_data <= 6'h02;
            10'h12A: rom_data <= 6'h1B;
            10'h12B: rom_data <= 6'h07;
            10'h12C: rom_data <= 6'h07;
            10'h12D: rom_data <= 6'h08;
            10'h12E: rom_data <= 6'h37;
            10'h12F: rom_data <= 6'h02;
            10'h130: rom_data <= 6'h15;
            10'h131: rom_data <= 6'h0C;
            10'h132: rom_data <= 6'h0C;
            10'h133: rom_data <= 6'h37;
            10'h134: rom_data <= 6'h09;
            10'h135: rom_data <= 6'h2D;
            10'h136: rom_data <= 6'h14;
            10'h137: rom_data <= 6'h02;
            10'h138: rom_data <= 6'h25;
            10'h139: rom_data <= 6'h35;
            10'h13A: rom_data <= 6'h37;
            10'h13B: rom_data <= 6'h02;
            10'h13C: rom_data <= 6'h30;
            10'h13D: rom_data <= 6'h0C;
            10'h13E: rom_data <= 6'h32;
            10'h13F: rom_data <= 6'h02;
            10'h140: rom_data <= 6'h1A;
            10'h141: rom_data <= 6'h2D;
            10'h142: rom_data <= 6'h35;
            10'h143: rom_data <= 6'h28;
            10'h144: rom_data <= 6'h35;
            10'h145: rom_data <= 6'h0B;
            10'h146: rom_data <= 6'h03;
            10'h147: rom_data <= 6'h0C;
            10'h148: rom_data <= 6'h2B;
            10'h149: rom_data <= 6'h02;
            10'h14A: rom_data <= 6'h3F;
            10'h14B: rom_data <= 6'h13;
            10'h14C: rom_data <= 6'h0C;
            10'h14D: rom_data <= 6'h2C;
            10'h14E: rom_data <= 6'h02;
            10'h14F: rom_data <= 6'h0A;
            10'h150: rom_data <= 6'h07;
            10'h151: rom_data <= 6'h0B;
            10'h152: rom_data <= 6'h07;
            10'h153: rom_data <= 6'h0E;
            10'h154: rom_data <= 6'h14;
            10'h155: rom_data <= 6'h02;
            10'h156: rom_data <= 6'h0D;
            10'h157: rom_data <= 6'h0C;
            10'h158: rom_data <= 6'h15;
            10'h159: rom_data <= 6'h02;
            10'h15A: rom_data <= 6'h04;
            10'h15B: rom_data <= 6'h04;
            10'h15C: rom_data <= 6'h04;
            10'h15D: rom_data <= 6'h04;
            10'h15E: rom_data <= 6'h10;
            10'h15F: rom_data <= 6'h06;
            10'h160: rom_data <= 6'h02;
            10'h161: rom_data <= 6'h20;
            10'h162: rom_data <= 6'h15;
            10'h163: rom_data <= 6'h13;
            10'h164: rom_data <= 6'h35;
            10'h165: rom_data <= 6'h02;
            10'h166: rom_data <= 6'h20;
            10'h167: rom_data <= 6'h0D;
            10'h168: rom_data <= 6'h09;
            10'h169: rom_data <= 6'h1E;
            10'h16A: rom_data <= 6'h0D;
            10'h16B: rom_data <= 6'h02;
            10'h16C: rom_data <= 6'h31;
            10'h16D: rom_data <= 6'h16;
            10'h16E: rom_data <= 6'h2B;
            10'h16F: rom_data <= 6'h07;
            10'h170: rom_data <= 6'h2B;
            10'h171: rom_data <= 6'h02;
            10'h172: rom_data <= 6'h35;
            10'h173: rom_data <= 6'h0B;
            10'h174: rom_data <= 6'h2D;
            10'h175: rom_data <= 6'h13;
            10'h176: rom_data <= 6'h02;
            10'h177: rom_data <= 6'h2E;
            10'h178: rom_data <= 6'h0F;
            10'h179: rom_data <= 6'h0B;
            10'h17A: rom_data <= 6'h02;
            10'h17B: rom_data <= 6'h15;
            10'h17C: rom_data <= 6'h0C;
            10'h17D: rom_data <= 6'h0A;
            10'h17E: rom_data <= 6'h0C;
            10'h17F: rom_data <= 6'h0D;
            10'h180: rom_data <= 6'h0F;
            10'h181: rom_data <= 6'h2D;
            10'h182: rom_data <= 6'h02;
            10'h183: rom_data <= 6'h09;
            10'h184: rom_data <= 6'h0C;
            10'h185: rom_data <= 6'h0C;
            10'h186: rom_data <= 6'h0B;
            10'h187: rom_data <= 6'h04;
            10'h188: rom_data <= 6'h04;
            10'h189: rom_data <= 6'h0F;
            10'h18A: rom_data <= 6'h09;
            10'h18B: rom_data <= 6'h3B;
            10'h18C: rom_data <= 6'h0D;
            10'h18D: rom_data <= 6'h02;
            10'h18E: rom_data <= 6'h28;
            10'h18F: rom_data <= 6'h27;
            10'h190: rom_data <= 6'h17;
            10'h191: rom_data <= 6'h10;
            10'h192: rom_data <= 6'h02;
            10'h193: rom_data <= 6'h0F;
            10'h194: rom_data <= 6'h0B;
            10'h195: rom_data <= 6'h02;
            10'h196: rom_data <= 6'h3B;
            10'h197: rom_data <= 6'h03;
            10'h198: rom_data <= 6'h37;
            10'h199: rom_data <= 6'h37;
            10'h19A: rom_data <= 6'h13;
            10'h19B: rom_data <= 6'h03;
            10'h19C: rom_data <= 6'h28;
            10'h19D: rom_data <= 6'h0C;
            10'h19E: rom_data <= 6'h2D;
            10'h19F: rom_data <= 6'h0D;
            10'h1A0: rom_data <= 6'h33;
            10'h1A1: rom_data <= 6'h04;
            10'h1A2: rom_data <= 6'h0B;
            10'h1A3: rom_data <= 6'h35;
            10'h1A4: rom_data <= 6'h02;
            10'h1A5: rom_data <= 6'h0F;
            10'h1A6: rom_data <= 6'h0F;
            10'h1A7: rom_data <= 6'h21;
            10'h1A8: rom_data <= 6'h0C;
            10'h1A9: rom_data <= 6'h32;
            10'h1AA: rom_data <= 6'h0C;
            10'h1AB: rom_data <= 6'h0B;
            10'h1AC: rom_data <= 6'h1E;
            10'h1AD: rom_data <= 6'h2D;
            10'h1AE: rom_data <= 6'h02;
            10'h1AF: rom_data <= 6'h13;
            10'h1B0: rom_data <= 6'h2D;
            10'h1B1: rom_data <= 6'h07;
            10'h1B2: rom_data <= 6'h2A;
            10'h1B3: rom_data <= 6'h0D;
            10'h1B4: rom_data <= 6'h27;
            10'h1B5: rom_data <= 6'h17;
            10'h1B6: rom_data <= 6'h0B;
            10'h1B7: rom_data <= 6'h0C;
            10'h1B8: rom_data <= 6'h08;
            10'h1B9: rom_data <= 6'h37;
            10'h1BA: rom_data <= 6'h02;
            10'h1BB: rom_data <= 6'h3B;
            10'h1BC: rom_data <= 6'h02;
            10'h1BD: rom_data <= 6'h0B;
            10'h1BE: rom_data <= 6'h13;
            10'h1BF: rom_data <= 6'h21;
            10'h1C0: rom_data <= 6'h0C;
            10'h1C1: rom_data <= 6'h15;
            10'h1C2: rom_data <= 6'h02;
            10'h1C3: rom_data <= 6'h04;
            10'h1C4: rom_data <= 6'h04;
            10'h1C5: rom_data <= 6'h04;
            10'h1C6: rom_data <= 6'h04;
            10'h1C7: rom_data <= 6'h0B;
            10'h1C8: rom_data <= 6'h35;
            10'h1C9: rom_data <= 6'h02;
            10'h1CA: rom_data <= 6'h37;
            10'h1CB: rom_data <= 6'h1A;
            10'h1CC: rom_data <= 6'h10;
            10'h1CD: rom_data <= 6'h09;
            10'h1CE: rom_data <= 6'h3E;
            10'h1CF: rom_data <= 6'h37;
            10'h1D0: rom_data <= 6'h02;
            10'h1D1: rom_data <= 6'h30;
            10'h1D2: rom_data <= 6'h34;
            10'h1D3: rom_data <= 6'h02;
            10'h1D4: rom_data <= 6'h39;
            10'h1D5: rom_data <= 6'h33;
            10'h1D6: rom_data <= 6'h0D;
            10'h1D7: rom_data <= 6'h02;
            10'h1D8: rom_data <= 6'h0A;
            10'h1D9: rom_data <= 6'h33;
            10'h1DA: rom_data <= 6'h27;
            10'h1DB: rom_data <= 6'h0C;
            10'h1DC: rom_data <= 6'h2C;
            10'h1DD: rom_data <= 6'h02;
            10'h1DE: rom_data <= 6'h12;
            10'h1DF: rom_data <= 6'h07;
            10'h1E0: rom_data <= 6'h02;
            10'h1E1: rom_data <= 6'h10;
            10'h1E2: rom_data <= 6'h14;
            10'h1E3: rom_data <= 6'h29;
            10'h1E4: rom_data <= 6'h0C;
            10'h1E5: rom_data <= 6'h2C;
            10'h1E6: rom_data <= 6'h02;
            10'h1E7: rom_data <= 6'h17;
            10'h1E8: rom_data <= 6'h23;
            10'h1E9: rom_data <= 6'h02;
            10'h1EA: rom_data <= 6'h12;
            10'h1EB: rom_data <= 6'h0C;
            10'h1EC: rom_data <= 6'h37;
            10'h1ED: rom_data <= 6'h02;
            10'h1EE: rom_data <= 6'h23;
            10'h1EF: rom_data <= 6'h0C;
            10'h1F0: rom_data <= 6'h21;
            10'h1F1: rom_data <= 6'h13;
            10'h1F2: rom_data <= 6'h35;
            10'h1F3: rom_data <= 6'h02;
            10'h1F4: rom_data <= 6'h04;
            10'h1F5: rom_data <= 6'h04;
            10'h1F6: rom_data <= 6'h04;
            10'h1F7: rom_data <= 6'h04;
            10'h1F8: rom_data <= 6'h04;
            10'h1F9: rom_data <= 6'h04;
            10'h1FA: rom_data <= 6'h04;
            10'h1FB: rom_data <= 6'h04;
            10'h1FC: rom_data <= 6'h1D;
            10'h1FD: rom_data <= 6'h1A;
            10'h1FE: rom_data <= 6'h0B;
            10'h1FF: rom_data <= 6'h2A;
            10'h200: rom_data <= 6'h02;
            10'h201: rom_data <= 6'h19;
            10'h202: rom_data <= 6'h1F;
            10'h203: rom_data <= 6'h02;
            10'h204: rom_data <= 6'h28;
            10'h205: rom_data <= 6'h28;
            10'h206: rom_data <= 6'h3A;
            10'h207: rom_data <= 6'h02;
            10'h208: rom_data <= 6'h19;
            10'h209: rom_data <= 6'h3A;
            10'h20A: rom_data <= 6'h02;
            10'h20B: rom_data <= 6'h0C;
            10'h20C: rom_data <= 6'h0B;
            10'h20D: rom_data <= 6'h0D;
            10'h20E: rom_data <= 6'h33;
            10'h20F: rom_data <= 6'h07;
            10'h210: rom_data <= 6'h37;
            10'h211: rom_data <= 6'h0D;
            10'h212: rom_data <= 6'h02;
            10'h213: rom_data <= 6'h1A;
            10'h214: rom_data <= 6'h0B;
            10'h215: rom_data <= 6'h15;
            10'h216: rom_data <= 6'h02;
            10'h217: rom_data <= 6'h2A;
            10'h218: rom_data <= 6'h13;
            10'h219: rom_data <= 6'h09;
            10'h21A: rom_data <= 6'h02;
            10'h21B: rom_data <= 6'h0C;
            10'h21C: rom_data <= 6'h0D;
            10'h21D: rom_data <= 6'h03;
            10'h21E: rom_data <= 6'h0E;
            10'h21F: rom_data <= 6'h07;
            10'h220: rom_data <= 6'h0D;
            10'h221: rom_data <= 6'h0E;
            10'h222: rom_data <= 6'h35;
            10'h223: rom_data <= 6'h04;
            10'h224: rom_data <= 6'h04;
            10'h225: rom_data <= 6'h04;
            10'h226: rom_data <= 6'h04;
            10'h227: rom_data <= 6'h04;
            10'h228: rom_data <= 6'h04;
            10'h229: rom_data <= 6'h04;
            10'h22A: rom_data <= 6'h04;
            10'h22B: rom_data <= 6'h04;
            10'h22C: rom_data <= 6'h04;
            10'h22D: rom_data <= 6'h04;
            10'h22E: rom_data <= 6'h04;
            default: rom_data <= 6'h00;
        endcase
    end
`endif    

endmodule
