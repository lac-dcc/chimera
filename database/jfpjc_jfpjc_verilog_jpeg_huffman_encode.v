// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

/**
 * ultimately, I plan to put these values in 2 EBRs. Unfortunately, because we need 4 + 16 = 20 bit
 * wide data and our EBRs are all 1, 2, 4, 8, or 16 bits wide, a lot of one EBR will be wasted.
 *
 * I suppose that, if we wanted to be able to select from 4 different tables, we could use 5EBRs,
 * where 4 of the EBRs hold huffman code values and 1 holds lengths for the 4 different tables. meh.
 *
 * This test huffman table mimics the EBRs in the sense that it takes one clock cycle to read.
 *
 * These are ac and dc luminance tables taken from jmcujc.c. I used gdb to halt the program after
 * huffman reverse lookup tables were constructed and then used a bit of low-grade gdb-fu to
 * generate the verilog found below. Note that the stored huffman_bitlen is one less than the
 * actual bitlen, this is to avoid storing an unnecessary bit; we will never have a huffman code
 * of length 0.
 *
 * The following lines can be used in GDB to harvest the data from the huffman reverse lookup
 * tables. Some lines with invalid huffman codes will need to be picked out, you can tell which
 * ones those are because the bit_length - 1 will cause the uint32_t to roll over to ffffffff.
 *
 * (gdb) set $loop = 0
 * (gdb) while $loop < 256
 * (gdb) printf "8'h%02x: huffman_code <= 16'h%04x; huffman_bitlen <= 4'h%x; huffman_valid <= 1'b1\n",$loop,params->dc_hrlts[0].entries[$loop].value,params->dc_hrlts[0].entries[$loop].bit_length-1
 * (gdb) set $loop = $loop + 1
 * (gdb) end
 */
module test_huffman_table_dc(input clock,
                             input [7:0] addr,

                             output reg [15:0] huffman_code,
                             output reg  [3:0] huffman_bitlen,

                             // this one is just here for debugging purposes... we should remove it
                             // for deployed hardware. Anyways, we could have
                             // huffman code = 0x0000 and bitlen = 15 be our code for "this one's bad".
                             output reg  [0:0] huffman_valid);

    always @(posedge clock) begin
        case(addr)
            8'h00: begin huffman_code <= 16'h0000; huffman_bitlen <= 4'h1; huffman_valid <= 1'b1; end
            8'h01: begin huffman_code <= 16'h0002; huffman_bitlen <= 4'h2; huffman_valid <= 1'b1; end
            8'h02: begin huffman_code <= 16'h0003; huffman_bitlen <= 4'h2; huffman_valid <= 1'b1; end
            8'h03: begin huffman_code <= 16'h0004; huffman_bitlen <= 4'h2; huffman_valid <= 1'b1; end
            8'h04: begin huffman_code <= 16'h0005; huffman_bitlen <= 4'h2; huffman_valid <= 1'b1; end
            8'h05: begin huffman_code <= 16'h0006; huffman_bitlen <= 4'h2; huffman_valid <= 1'b1; end
            8'h06: begin huffman_code <= 16'h000e; huffman_bitlen <= 4'h3; huffman_valid <= 1'b1; end
            8'h07: begin huffman_code <= 16'h001e; huffman_bitlen <= 4'h4; huffman_valid <= 1'b1; end
            8'h08: begin huffman_code <= 16'h003e; huffman_bitlen <= 4'h5; huffman_valid <= 1'b1; end
            8'h09: begin huffman_code <= 16'h007e; huffman_bitlen <= 4'h6; huffman_valid <= 1'b1; end
            8'h0a: begin huffman_code <= 16'h00fe; huffman_bitlen <= 4'h7; huffman_valid <= 1'b1; end
            8'h0b: begin huffman_code <= 16'h01fe; huffman_bitlen <= 4'h8; huffman_valid <= 1'b1; end
            default: begin huffman_code <= 16'h0000; huffman_bitlen <= 4'hf; huffman_valid <= 1'b0; end
        endcase
    end
endmodule // test_huffman_table_dc

module test_huffman_table_ac(input clock,
                             input [7:0] addr,

                             output reg [15:0] huffman_code,
                             output reg  [3:0] huffman_bitlen,

                             // this one is just here for debugging purposes... we should remove it
                             // for deployed hardware. Anyways, we could have
                             // huffman code = 0x0000 and bitlen = 15 be our code for "this one's bad".
                             output reg  [0:0] huffman_valid);

    always @(posedge clock) begin
        case(addr)
            8'h00: begin huffman_code <= 16'h000a; huffman_bitlen <= 4'h3; huffman_valid <= 1'b1; end
            8'h01: begin huffman_code <= 16'h0000; huffman_bitlen <= 4'h1; huffman_valid <= 1'b1; end
            8'h02: begin huffman_code <= 16'h0001; huffman_bitlen <= 4'h1; huffman_valid <= 1'b1; end
            8'h03: begin huffman_code <= 16'h0004; huffman_bitlen <= 4'h2; huffman_valid <= 1'b1; end
            8'h04: begin huffman_code <= 16'h000b; huffman_bitlen <= 4'h3; huffman_valid <= 1'b1; end
            8'h05: begin huffman_code <= 16'h001a; huffman_bitlen <= 4'h4; huffman_valid <= 1'b1; end
            8'h06: begin huffman_code <= 16'h0078; huffman_bitlen <= 4'h6; huffman_valid <= 1'b1; end
            8'h07: begin huffman_code <= 16'h00f8; huffman_bitlen <= 4'h7; huffman_valid <= 1'b1; end
            8'h08: begin huffman_code <= 16'h03f6; huffman_bitlen <= 4'h9; huffman_valid <= 1'b1; end
            8'h09: begin huffman_code <= 16'hff82; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h0a: begin huffman_code <= 16'hff83; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h11: begin huffman_code <= 16'h000c; huffman_bitlen <= 4'h3; huffman_valid <= 1'b1; end
            8'h12: begin huffman_code <= 16'h001b; huffman_bitlen <= 4'h4; huffman_valid <= 1'b1; end
            8'h13: begin huffman_code <= 16'h0079; huffman_bitlen <= 4'h6; huffman_valid <= 1'b1; end
            8'h14: begin huffman_code <= 16'h01f6; huffman_bitlen <= 4'h8; huffman_valid <= 1'b1; end
            8'h15: begin huffman_code <= 16'h07f6; huffman_bitlen <= 4'ha; huffman_valid <= 1'b1; end
            8'h16: begin huffman_code <= 16'hff84; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h17: begin huffman_code <= 16'hff85; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h18: begin huffman_code <= 16'hff86; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h19: begin huffman_code <= 16'hff87; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h1a: begin huffman_code <= 16'hff88; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h21: begin huffman_code <= 16'h001c; huffman_bitlen <= 4'h4; huffman_valid <= 1'b1; end
            8'h22: begin huffman_code <= 16'h00f9; huffman_bitlen <= 4'h7; huffman_valid <= 1'b1; end
            8'h23: begin huffman_code <= 16'h03f7; huffman_bitlen <= 4'h9; huffman_valid <= 1'b1; end
            8'h24: begin huffman_code <= 16'h0ff4; huffman_bitlen <= 4'hb; huffman_valid <= 1'b1; end
            8'h25: begin huffman_code <= 16'hff89; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h26: begin huffman_code <= 16'hff8a; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h27: begin huffman_code <= 16'hff8b; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h28: begin huffman_code <= 16'hff8c; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h29: begin huffman_code <= 16'hff8d; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h2a: begin huffman_code <= 16'hff8e; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h31: begin huffman_code <= 16'h003a; huffman_bitlen <= 4'h5; huffman_valid <= 1'b1; end
            8'h32: begin huffman_code <= 16'h01f7; huffman_bitlen <= 4'h8; huffman_valid <= 1'b1; end
            8'h33: begin huffman_code <= 16'h0ff5; huffman_bitlen <= 4'hb; huffman_valid <= 1'b1; end
            8'h34: begin huffman_code <= 16'hff8f; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h35: begin huffman_code <= 16'hff90; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h36: begin huffman_code <= 16'hff91; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h37: begin huffman_code <= 16'hff92; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h38: begin huffman_code <= 16'hff93; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h39: begin huffman_code <= 16'hff94; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h3a: begin huffman_code <= 16'hff95; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h41: begin huffman_code <= 16'h003b; huffman_bitlen <= 4'h5; huffman_valid <= 1'b1; end
            8'h42: begin huffman_code <= 16'h03f8; huffman_bitlen <= 4'h9; huffman_valid <= 1'b1; end
            8'h43: begin huffman_code <= 16'hff96; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h44: begin huffman_code <= 16'hff97; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h45: begin huffman_code <= 16'hff98; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h46: begin huffman_code <= 16'hff99; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h47: begin huffman_code <= 16'hff9a; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h48: begin huffman_code <= 16'hff9b; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h49: begin huffman_code <= 16'hff9c; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h4a: begin huffman_code <= 16'hff9d; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h51: begin huffman_code <= 16'h007a; huffman_bitlen <= 4'h6; huffman_valid <= 1'b1; end
            8'h52: begin huffman_code <= 16'h07f7; huffman_bitlen <= 4'ha; huffman_valid <= 1'b1; end
            8'h53: begin huffman_code <= 16'hff9e; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h54: begin huffman_code <= 16'hff9f; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h55: begin huffman_code <= 16'hffa0; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h56: begin huffman_code <= 16'hffa1; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h57: begin huffman_code <= 16'hffa2; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h58: begin huffman_code <= 16'hffa3; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h59: begin huffman_code <= 16'hffa4; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h5a: begin huffman_code <= 16'hffa5; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h61: begin huffman_code <= 16'h007b; huffman_bitlen <= 4'h6; huffman_valid <= 1'b1; end
            8'h62: begin huffman_code <= 16'h0ff6; huffman_bitlen <= 4'hb; huffman_valid <= 1'b1; end
            8'h63: begin huffman_code <= 16'hffa6; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h64: begin huffman_code <= 16'hffa7; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h65: begin huffman_code <= 16'hffa8; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h66: begin huffman_code <= 16'hffa9; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h67: begin huffman_code <= 16'hffaa; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h68: begin huffman_code <= 16'hffab; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h69: begin huffman_code <= 16'hffac; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h6a: begin huffman_code <= 16'hffad; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h71: begin huffman_code <= 16'h00fa; huffman_bitlen <= 4'h7; huffman_valid <= 1'b1; end
            8'h72: begin huffman_code <= 16'h0ff7; huffman_bitlen <= 4'hb; huffman_valid <= 1'b1; end
            8'h73: begin huffman_code <= 16'hffae; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h74: begin huffman_code <= 16'hffaf; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h75: begin huffman_code <= 16'hffb0; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h76: begin huffman_code <= 16'hffb1; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h77: begin huffman_code <= 16'hffb2; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h78: begin huffman_code <= 16'hffb3; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h79: begin huffman_code <= 16'hffb4; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h7a: begin huffman_code <= 16'hffb5; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h81: begin huffman_code <= 16'h01f8; huffman_bitlen <= 4'h8; huffman_valid <= 1'b1; end
            8'h82: begin huffman_code <= 16'h7fc0; huffman_bitlen <= 4'he; huffman_valid <= 1'b1; end
            8'h83: begin huffman_code <= 16'hffb6; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h84: begin huffman_code <= 16'hffb7; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h85: begin huffman_code <= 16'hffb8; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h86: begin huffman_code <= 16'hffb9; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h87: begin huffman_code <= 16'hffba; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h88: begin huffman_code <= 16'hffbb; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h89: begin huffman_code <= 16'hffbc; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h8a: begin huffman_code <= 16'hffbd; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h91: begin huffman_code <= 16'h01f9; huffman_bitlen <= 4'h8; huffman_valid <= 1'b1; end
            8'h92: begin huffman_code <= 16'hffbe; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h93: begin huffman_code <= 16'hffbf; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h94: begin huffman_code <= 16'hffc0; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h95: begin huffman_code <= 16'hffc1; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h96: begin huffman_code <= 16'hffc2; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h97: begin huffman_code <= 16'hffc3; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h98: begin huffman_code <= 16'hffc4; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h99: begin huffman_code <= 16'hffc5; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'h9a: begin huffman_code <= 16'hffc6; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'ha1: begin huffman_code <= 16'h01fa; huffman_bitlen <= 4'h8; huffman_valid <= 1'b1; end
            8'ha2: begin huffman_code <= 16'hffc7; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'ha3: begin huffman_code <= 16'hffc8; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'ha4: begin huffman_code <= 16'hffc9; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'ha5: begin huffman_code <= 16'hffca; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'ha6: begin huffman_code <= 16'hffcb; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'ha7: begin huffman_code <= 16'hffcc; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'ha8: begin huffman_code <= 16'hffcd; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'ha9: begin huffman_code <= 16'hffce; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'haa: begin huffman_code <= 16'hffcf; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hb1: begin huffman_code <= 16'h03f9; huffman_bitlen <= 4'h9; huffman_valid <= 1'b1; end
            8'hb2: begin huffman_code <= 16'hffd0; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hb3: begin huffman_code <= 16'hffd1; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hb4: begin huffman_code <= 16'hffd2; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hb5: begin huffman_code <= 16'hffd3; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hb6: begin huffman_code <= 16'hffd4; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hb7: begin huffman_code <= 16'hffd5; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hb8: begin huffman_code <= 16'hffd6; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hb9: begin huffman_code <= 16'hffd7; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hba: begin huffman_code <= 16'hffd8; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hc1: begin huffman_code <= 16'h03fa; huffman_bitlen <= 4'h9; huffman_valid <= 1'b1; end
            8'hc2: begin huffman_code <= 16'hffd9; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hc3: begin huffman_code <= 16'hffda; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hc4: begin huffman_code <= 16'hffdb; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hc5: begin huffman_code <= 16'hffdc; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hc6: begin huffman_code <= 16'hffdd; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hc7: begin huffman_code <= 16'hffde; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hc8: begin huffman_code <= 16'hffdf; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hc9: begin huffman_code <= 16'hffe0; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hca: begin huffman_code <= 16'hffe1; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hd1: begin huffman_code <= 16'h07f8; huffman_bitlen <= 4'ha; huffman_valid <= 1'b1; end
            8'hd2: begin huffman_code <= 16'hffe2; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hd3: begin huffman_code <= 16'hffe3; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hd4: begin huffman_code <= 16'hffe4; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hd5: begin huffman_code <= 16'hffe5; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hd6: begin huffman_code <= 16'hffe6; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hd7: begin huffman_code <= 16'hffe7; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hd8: begin huffman_code <= 16'hffe8; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hd9: begin huffman_code <= 16'hffe9; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hda: begin huffman_code <= 16'hffea; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'he1: begin huffman_code <= 16'hffeb; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'he2: begin huffman_code <= 16'hffec; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'he3: begin huffman_code <= 16'hffed; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'he4: begin huffman_code <= 16'hffee; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'he5: begin huffman_code <= 16'hffef; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'he6: begin huffman_code <= 16'hfff0; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'he7: begin huffman_code <= 16'hfff1; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'he8: begin huffman_code <= 16'hfff2; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'he9: begin huffman_code <= 16'hfff3; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hea: begin huffman_code <= 16'hfff4; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hf0: begin huffman_code <= 16'h07f9; huffman_bitlen <= 4'ha; huffman_valid <= 1'b1; end
            8'hf1: begin huffman_code <= 16'hfff5; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hf2: begin huffman_code <= 16'hfff6; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hf3: begin huffman_code <= 16'hfff7; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hf4: begin huffman_code <= 16'hfff8; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hf5: begin huffman_code <= 16'hfff9; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hf6: begin huffman_code <= 16'hfffa; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hf7: begin huffman_code <= 16'hfffb; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hf8: begin huffman_code <= 16'hfffc; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hf9: begin huffman_code <= 16'hfffd; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            8'hfa: begin huffman_code <= 16'hfffe; huffman_bitlen <= 4'hf; huffman_valid <= 1'b1; end
            default: begin huffman_code <= 16'h0000; huffman_bitlen <= 4'hf; huffman_valid <= 1'b0; end
        endcase

    end
endmodule

/**
 * Lengths should be the ACTUAL LENGTH, not the length of the code minus 1.
 */
module double_bit_concatenator(input [15:0]  data_0,
                               input [15:0]  data_1,
                               input  [4:0]  length_0,
                               input  [4:0]  length_1,

                               output reg [31:0] data_out,
                               output reg  [5:0] length_out);

    // "the bit width of a shift is always the bit width of the left operand
    // (see table 5-22 in the 2005 LRM)."
    // thanks, stackoverflow!!
    //reg [31:0] data1_extend;
    reg [31:0] data_0_left_justified;

    always @* begin
        //data_0_left_justified = (({16'h0, data_0}) << (32 - length_0));
        //data1_extend = { 16'h0, data_1 };
        if (length_1 != 0) begin
            data_out = ((({16'h0, data_0}) << (32 - length_0)) |
                        (({ 16'h0, data_1 }) << (32 - (length_0 + length_1))));
        end else begin
            data_out = (({16'h0, data_0}) << (32 - length_0));
        end
        length_out = length_0 + length_1;
    end
endmodule

/**
 * This module expects data to be fed into it with the zig-zag pattern.
 *
 * input nreset         should be strobed for at least one clock cycle at the start of every new image
 * input input_valid    On every clock rising edge input_valid is high, jpeg_huffman_encode will
 *                      huffman encode the data in src_data_in and put it in the output stream. Some
 *                      pipelining may be necessary, so you shouldn't assume that the data will be
 *                      written to the output stream on the very same rising edge... In other words,
 *                      the output isn't just a combinational result of the module's internal state
 *                      and the input.
 * input src_data_in    This should be an integer in [-1024, 1023] containing the DCT input values.
 *                      These values should NOT be differentially coded, and need to be the same
 *                      scale as the input pixels; if extra LSB padding was added to allow for
 *                      higher-precision fixed point calculations, it should be trimmed off.
 *
 *  huffman_read_addr and huffman_read_data should be connected to an EBR
 *
 * output output_wren   On every clock cycle that this is high, the output contains a new piece of
 *                      data with length 'output_length' bits that should be appended. This data
 *                      is not padded or bytestuffed; another hardware module needs to do that.
 *
 *
 * Each cycle, we might need to pack a maximum of 2 values. This will require a barrel shifter, which
 * requires O(n * lg2(m)) 1-bit multiplexers where n is the bit width of the input value and m is the
 * highest amount that we might want to shift by. In this case, n is 32 (because we need to shift
 * into a 32-bit number) and m is 16, giving us a requirement of 128 muxes and therefore an upper
 * bound of 128 logic elements. Not too bad, and I bet that Lattice's tools can shrink that down a
 * good bit.
 *
 * I suppose that the other option is to have a read or write fifo, or guarantee that the input is
 * fed in at a slower rate.
 */
module jpeg_huffman_encode(input clock,
                           input nreset,
                           input start,

                           output reg [5:0] fetch_addr,
                           input signed [15:0] src_data_in,

                           // someday, if we want to use external EBRs
                           //output reg [7:0] dc_huffman_read_addr,
                           //input     [15:0] dc_huffman_read_code,
                           //input      [3:0] dc_huffman_read_bitlen,

                           //output reg [7:0] ac_huffman_read_addr,
                           //input     [15:0] ac_huffman_read_code,
                           //input      [3:0] ac_huffman_read_bitlen,

                           output reg [0:0]  output_wren,
                           output reg [5:0]  output_length,
                           output reg [31:0] output_data,

                           output reg [0:0]  busy);

    ////////////////////////////////////////////////////////////
    // Registers shared over pipeline stages
    reg  [5:0] ac_consecutive_zeros_count;
    reg        do_rollback [0:1];

    ////////////////////////////////////////////////////////////
    // Pipeline fetch stage
    reg  [5:0] rollback_distance;
    reg  [5:0] index [0:3];
    reg        valid [0:3];
    reg        fetch_stage_active;
    always @(posedge clock) begin
        if (nreset) begin
            if (do_rollback[0]) begin
                index[0] <= (index[2] - rollback_distance);
            end else if (fetch_stage_active) begin
                index[0] <= index[0] + 6'h01;
            end else begin
                index[0] <= 6'h0;
            end

            if (start) begin
                fetch_stage_active <= 1'b1;
            end else if (do_rollback[0]) begin
                fetch_stage_active <= 1'b1;
            end else if (index[0] == 6'h3f) begin
                fetch_stage_active <= 1'b0;
            end else begin
                fetch_stage_active <= fetch_stage_active;
            end

        end else begin
            index[0] <= 6'h0;
            if (start) begin
                fetch_stage_active <= 1'b1;
            end else begin
                fetch_stage_active <= 1'b0;
            end
        end
    end

    always @* begin
        rollback_distance = ac_consecutive_zeros_count - 6'h10;
        fetch_addr = index[0];
        valid[0] = fetch_stage_active;
    end

    ////////////////////////////////////////////////////////////
    // Pipeline stage 1
    //
    // Keep track of DC differential coding
    // Truncate coeffecient value to coded value
    reg signed [15:0] dc_prev;

    reg signed [15:0] coefficient_to_encode;
    wire       [15:0] coded_coefficient;
    wire        [3:0] coded_coefficient_length;
    coefficient_encoder coefficient_encoder(.coefficient(coefficient_to_encode),
                                            .coded_value(coded_coefficient),
                                            .coded_value_length(coded_coefficient_length));

    always @(posedge clock) begin
        if (nreset) begin
            if ((index[1] == 6'h00) && (valid[1])) begin
                dc_prev <= src_data_in;
            end else begin
                dc_prev <= dc_prev;
            end

            index[1] <= index[0];
            if (do_rollback[0]) begin
                valid[1] <= 1'b0;
            end else begin
                valid[1] <= valid[0];
            end
        end else begin
            dc_prev  <= 16'h0000;
            index[1] <= 6'hx;
            valid[1] <= 1'b0;
        end
    end

    always @* begin
        if (nreset) begin
            if (index[1] == 6'h0) begin
                coefficient_to_encode = src_data_in - dc_prev;
            end else begin
                coefficient_to_encode = src_data_in;
            end
        end else begin
            coefficient_to_encode = 16'hxxxx;
        end
    end

    ////////////////////////////////////////////////////////////
    // Pipeline stage 2
    //
    // AC run-length encoding and Huffman lookup
    wire final_cycle;
    assign final_cycle = ((index[3] == 6'd63) && (!do_rollback[1]));

    reg [15:0] coded_coefficient_reg [0:1];
    reg  [3:0] coded_coefficient_length_reg [0:1];
    reg  [7:0] ac_rrrrssss;

    wire [15:0] dc_coefficient_length_huffman_code;
    wire  [3:0] dc_coefficient_length_huffman_length;
    test_huffman_table_dc dc_huffman_table(.clock(clock),
                                           .addr({4'h0, coded_coefficient_length_reg[0]}),
                                           .huffman_code(dc_coefficient_length_huffman_code),
                                           .huffman_bitlen(dc_coefficient_length_huffman_length),
                                           .huffman_valid());

    wire [15:0] ac_rrrrssss_huffman_code;
    wire  [3:0] ac_rrrrssss_huffman_length;
    test_huffman_table_ac ac_huffman_table(.clock(clock),
                                           .addr(ac_rrrrssss),
                                           .huffman_code(ac_rrrrssss_huffman_code),
                                           .huffman_bitlen(ac_rrrrssss_huffman_length),
                                           .huffman_valid());

    // TODO: still need to cover special EOB case
    always @(posedge clock) begin
        if (nreset) begin
            if (valid[1]) begin
                coded_coefficient_reg[0] <= coded_coefficient;
                coded_coefficient_length_reg[0] <= coded_coefficient_length;
            end else begin
                coded_coefficient_reg[0] <= 16'hx;
                coded_coefficient_length_reg[0] <= 4'h0;
            end

            if (final_cycle) begin
                ac_consecutive_zeros_count <= 6'h0;
            end else if (valid[2] == 1'b0) begin
                ac_consecutive_zeros_count <= ac_consecutive_zeros_count;
            end else if (do_rollback[0]) begin
                ac_consecutive_zeros_count <= 6'h00;
            end else if (index[2] == 6'h00) begin
                ac_consecutive_zeros_count <= 6'h00;
            end else if (coded_coefficient_length_reg[0] != 4'h0) begin
                ac_consecutive_zeros_count <= 6'h00;
            end else begin
                ac_consecutive_zeros_count <= ac_consecutive_zeros_count + 6'h01;
            end

            index[2] <= index[1];

            if (do_rollback[0]) begin
                valid[2] <= 1'b0;
            end else begin
                valid[2] <= valid[1];
            end
        end else begin
            coded_coefficient_reg[0] <= 16'hxxxx;
            coded_coefficient_length_reg[0] <= 4'h0;

            ac_consecutive_zeros_count <= 6'h00;

            index[2] <= 6'hx;
            valid[2] <= 1'b0;
        end
    end

    always @* begin
        // If we have 16 consecutive 0's followed by a nonzero, we don't REALLY need to roll
        // anything back, but we need to stall the huffman lookup pipeline by one stage and
        // emit an rrrrssss = 0xf0. So to keep things simple, we MIGHT as WELL roll back and let
        // the following value, which will be the first nonzero value after a run of 16 zeros,
        // re-flow through the pipeline. This just wastes an extra cycle in a rare edge case
        // (that we need to make sure to exericise in unit tests) and saves a bunch of logic.
        //
        // If we were to add the stall, we would have
        //     (ac_consecutive_zeros_count > 6'h10)
        // instead of
        //     (ac_consecutive_zeros_count > 6'h0f)
        do_rollback[0] = ((coded_coefficient_length_reg[0] != 4'h0) &&
                          (ac_consecutive_zeros_count > 6'h0f));

        if (do_rollback[0]) begin
            ac_rrrrssss = 8'hf0;
        end else if ((index[2] == 6'd63) && (coded_coefficient_length_reg[0] == 'h0)) begin
            // EOB reached.
            ac_rrrrssss = 8'h0;
        end else begin
            ac_rrrrssss = { ac_consecutive_zeros_count, coded_coefficient_length_reg[0] };
        end
    end

    ////////////////////////////////////////////////////////////
    // Pipeline stage 3
    //
    // writeback
    reg [15:0] bit_concatenator_data0;
    reg [15:0] bit_concatenator_data1;
    reg  [4:0] bit_concatenator_length0;
    reg  [4:0] bit_concatenator_length1;
    always @(posedge clock) begin
        if (nreset) begin
            do_rollback[1] <= do_rollback[0];
            index[3] <= index[2];
            valid[3] <= do_rollback[0] ? 1'b0 : valid[2];

            if (index[2] == 6'h00) begin
                output_wren <= valid[2];
            end else begin
                if (valid[2]) begin
                    if (do_rollback[0]) begin
                        // if we are rolling back, there is an rrrrssss = 0xf0 that needs to be output.
                        output_wren <= 1'b1;
                    end else if (coded_coefficient_length_reg[0] != 4'h0) begin
                        // If the previous stage has found a nonzero coefficient, we have something
                        // to output. Note that this condition is implied by do_rollback, but this
                        // condition does not necessarily imply do_rollback[0]
                        output_wren <= 1'b1;
                    end else if (index[2] == 6'd63) begin
                        // if we didn't rollback and we don't have a nonzero coefficient, the index
                        // being 63 means that we reached the EOB.
                        output_wren <= 1'b1;
                    end else begin
                        output_wren <= 1'b0;
                    end
                end else begin
                    output_wren <= 1'b0;
                end
            end

            if ((index[3] == 6'd63) && (!do_rollback[1]) && valid[3]) begin
                busy <= 1'b0;
            end else if (start) begin
                busy <= 1'b1;
            end else begin
                busy <= busy;
            end

            if (do_rollback[0]) begin
                coded_coefficient_reg[1] <= 16'hxxxx;
                coded_coefficient_length_reg[1] <= 5'h0;
            end else begin
                coded_coefficient_reg[1] <= coded_coefficient_reg[0];
                coded_coefficient_length_reg[1] <= coded_coefficient_length_reg[0];
            end
        end else begin // if (nreset)
            index[3] <= 6'hxx;
            valid[3] <= 1'h0;

            coded_coefficient_reg[1] <= 16'hxxxx;
            coded_coefficient_length_reg[1] <= 4'hx;
            busy <= 1'b0;
            do_rollback[1] <= 1'b0;
            output_wren <= 1'b0;
        end
    end

    always @* begin
        if (index[3] == 6'h00) begin
            bit_concatenator_data0 = dc_coefficient_length_huffman_code;
            bit_concatenator_length0 = dc_coefficient_length_huffman_length + 5'h1;
            bit_concatenator_data1 = coded_coefficient_reg[1];
            bit_concatenator_length1 = coded_coefficient_length_reg[1];
        end else begin
            bit_concatenator_data0 = ac_rrrrssss_huffman_code;
            bit_concatenator_length0 = ac_rrrrssss_huffman_length + 5'h1;
            bit_concatenator_data1 = coded_coefficient_reg[1];
            bit_concatenator_length1 = coded_coefficient_length_reg[1];
        end
    end

    wire [5:0] output_length_wire;
    wire [31:0] output_data_wire;
    double_bit_concatenator concat(.data_0(bit_concatenator_data0),
                                   .data_1(bit_concatenator_data1),
                                   .length_0(bit_concatenator_length0),
                                   .length_1(bit_concatenator_length1),

                                   .data_out(output_data_wire),
                                   .length_out(output_length_wire));

    always @* begin
        output_data = output_data_wire;
        output_length = output_length_wire;
    end

endmodule
