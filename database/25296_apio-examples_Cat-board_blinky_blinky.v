// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0


module blinky(clk_i, led_o);

input   clk_i;
output  led_o;

reg     [25:0] cnt;
reg     tgl;

assign led_o = tgl;

always @ (posedge clk_i)
begin
    if (cnt == 50000000-1)
    begin
        tgl = !tgl;
        cnt = 0;
    end
    else
        cnt = cnt + 1;
end 

endmodule
