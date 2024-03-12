module top (
    input clk_25mhz,
    output [7:0] led,
    input [6:0] btn,
    output wifi_gpio0
);
    reg [7:0] cnt = 0;

    always @(posedge btn[1]) 
    begin
        cnt <= cnt + 1;
    end

    assign led = cnt;
    assign wifi_gpio0 = 1'b1;
endmodule
