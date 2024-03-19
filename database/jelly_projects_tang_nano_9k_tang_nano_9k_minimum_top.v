
module tang_nano_9k_blinking_led
        (
            input   clk,
            output  led
        );

    reg     [23:0]  counter;
    always @(posedge clk) begin
        counter <= counter + 1;
    end
    
    assign led = counter[23];

endmodule

