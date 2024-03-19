module top (
    input clk_25mhz,
    output [7:0] led,
    output wifi_gpio0
);
    reg [31:0] cnt = 0;

    always @(posedge clk_25mhz) 
    begin
        cnt <= cnt + 1;
    end

    assign led = cnt[31:24];
    assign wifi_gpio0 = 1'b1;
endmodule
