// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_pixel_to_char ();
    reg pix_req;
    reg [9:0] pix_x;
    reg [9:0] pix_y;
    reg [31:0] cnt;

    pixel_to_char component(
        .pix_x(pix_x),
        .pix_y(pix_y)
    );

    initial begin
        pix_req = 1'b1;
        pix_x = 10'b0;
        pix_y = 10'b0;
        cnt = 32'b0;
        #10
        while (cnt < 640 * 480 + 100) begin
            cnt = cnt + 1'b1;
            #2
            if (pix_x == 639) begin
                pix_x = 10'b0;
                if (pix_y == 479)
                    pix_y = 10'b0;
                else
                    pix_y = pix_y + 1'b1;
            end
            else begin
                pix_x = pix_x + 1'b1;
                pix_y = pix_y;
            end
        end
        $finish;
    end

    initial begin
        $dumpfile("tb_pixel_to_char.vcd");
        $dumpvars(0, component);
    end
endmodule
