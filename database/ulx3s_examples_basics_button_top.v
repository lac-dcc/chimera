module top (
    output [7:0] led,
    input [6:0] btn,
    output wifi_gpio0
);
    assign led = { 1'b0, btn };

    assign wifi_gpio0 = 1'b1;
endmodule
