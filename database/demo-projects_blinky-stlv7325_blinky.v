`default_nettype none   //do not allow undeclared wires

module blinky (
    input  wire clk_p,
    input  wire clk_n,
    output wire led,
    input  wire button,
    output reg button_led,
    output wire diff_led_p,
    output wire diff_led_n
    );

    wire clk_ibufg;
    wire clk;

    IBUFDS ibuf_inst (.I(clk_p), .IB(clk_n), .O(clk_ibufg));
    BUFG   bufg_inst (.I(clk_ibufg), .O(clk));

    reg [26:0] r_count = 0;

    always @(posedge(clk)) begin
        r_count <= r_count + 1;
        button_led <= button;
    end

    assign led = r_count[26];

    OBUFDS obuf_inst (.I(led), .O(diff_led_p), .OB(diff_led_n));
endmodule
