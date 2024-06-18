// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none
module user_module_341493393195532884(
        input [7:0] io_in,
        output [7:0] io_out
    );
    wire [3:0] a = io_in[7:4];
    wire [3:0] b = io_in[3:0];
    wire [7:0] c;
    assign io_out = c;

    mul #(4) mul_i(a, b, c);

endmodule

/*
 *  my_multiplier - an unoptimized multiplier
 *
 *  copyright (c) 2021  hirosh dabui <hirosh@dabui.de>
 *
 *  permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  the software is provided "as is" and the author disclaims all warranties
 *  with regard to this software including all implied warranties of
 *  merchantability and fitness. in no event shall the author be liable for
 *  any special, direct, indirect, or consequential damages or any damages
 *  whatsoever resulting from loss of use, data or profits, whether in an
 *  action of contract, negligence or other tortious action, arising out of
 *  or in connection with the use or performance of this software.
 *
 */
module mul
    #(
         parameter WIDTH = 16
     )
     (
         input      [WIDTH-1:0]      a,
         input      [WIDTH-1:0]      b,
         output reg [(WIDTH<<1)-1:0] c = 0
     );

    reg [(WIDTH<<1)-1:0] tmp;

    reg  [(WIDTH<<1)-1:0] add_a[WIDTH-1:0];
    reg  [(WIDTH<<1)-1:0] add_b[WIDTH-1:0];
    wire [(WIDTH<<1)-1:0] add_y[WIDTH-1:0];

    genvar k;
generate for (k = 0; k < WIDTH; k = k +1) begin
            full_addr #(WIDTH<<1) full_addr_i(add_a[k], add_b[k], add_y[k]);
end endgenerate

    integer i;
    integer j;
generate always @(*) begin
            tmp = 0;
            c   = 0;

            /* generate parallel structure */
            for (j = 0; j < WIDTH; j = j + 1) begin
                for (i = 0; i < WIDTH; i = i + 1) begin
                    tmp[i] = b[i] & a[j];
                end
                add_a[j] = c;
                add_b[j] = (tmp << j);
                c = add_y[j];
            end
        end endgenerate

endmodule

// carry ripple style
module full_addr
    #(
         parameter WIDTH = 16
     )
     (
         input      [WIDTH-1:0] a,
         input      [WIDTH-1:0] b,
         output reg [WIDTH-1:0] y = 0
     );

    integer i;
    reg [WIDTH-1:0] c = 1;
generate always @(*) begin
            c[0] = 0;
            y[0] = c[0] ^ (a[0] ^ b[0]);
            c[0] = a[0]&b[0] | b[0]&c[0] | a[0]&c[0];
            for (i = 1; i < WIDTH; i = i +1) begin
                y[i] = c[i -1] ^ (a[i] ^ b[i]);
                c[i] = a[i]&b[i] | b[i]&c[i -1] | a[i]&c[i -1];
            end
        end endgenerate

endmodule
