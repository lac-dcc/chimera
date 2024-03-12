module infrared_top(
    input wire CLK_i,
    output wire TXD_o,
    input wire RXD_i,
    output wire SD_o,
    output wire PMOD_1,
    output wire [0:4] LED_o
    );

    parameter N = 17;
    reg [N-1:0] counter = 0;
    reg led_on = 0;

    always @(posedge CLK_i) begin
        if(~led_on) begin
            if(~RXD_i) begin
                led_on <= 1;
                counter <= 1;
            end
        end
        else begin
            counter <= counter + 1;
            if(counter == 0)
                led_on <= 0;
        end
    end

    assign PMOD_1 = RXD_i;
    assign TXD_o = 0;
    assign SD_o = 0;
    assign LED_o[4] = 1;
    assign LED_o[3] = ~RXD_i;
    assign LED_o[2] = led_on;

endmodule
