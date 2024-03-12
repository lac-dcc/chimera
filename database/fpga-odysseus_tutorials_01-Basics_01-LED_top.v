module top (
    output [7:0] led,
    output wifi_gpio0
);
    assign led = 8'b00000111;

    assign wifi_gpio0 = 1'b1;
endmodule
