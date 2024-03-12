module sys_pll(/*autoport*/
//output
         c0,
         c1,
         c2,
         c3,
         c4,
         c5,
         locked,
//input
         areset,
         inclk0);

input wire     areset;
input wire     inclk0;
output wire    c0;
output wire    c1;
output wire    c2;
output wire    c3;
output wire    c4;
output wire    c5;
output wire    locked;


clk_wiz_v3_6 clknetwork(
    // Clock in ports
    .CLK_IN1            (inclk0),
    // Clock out ports
    .CLK_OUT1           (c0),
    .CLK_OUT2           (c1),
    .CLK_OUT3           (c2),
    .CLK_OUT4           (c3),
    // Status and control signals
    .RESET              (areset),
    .LOCKED             (locked));

endmodule