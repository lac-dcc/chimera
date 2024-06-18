// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module wled_bar
    #(
        parameter CLK_MHZ = 27,
        parameter NUM_LEDS = 12,
        parameter LEVEL = 255
    )
     (
         input clk,
         input [7:0] value,
         output data
     );

    // Green, Red, Blue
    reg [23:0] rgb_data;
    reg [7:0] led_num = 0;
    reg write = 0;

    always @(posedge clk) begin
        if (write == 0) begin
            if (value > led_num && led_num > 6) begin
                rgb_data <= {8'd255, 8'd100, 8'd100};
            end else if (value > led_num) begin
                rgb_data <= {8'd100, 8'd255, 8'd100};
            end else begin
                rgb_data <= {8'd0, 8'd0, 8'd0};
            end
            write <= 1;
        end else begin
            if (led_num < NUM_LEDS) begin
                led_num <= led_num + 1;
            end else begin
                led_num <= 0;
            end
            write <= 0;
        end
    end

    ws2812 #(.CLK_MHZ(CLK_MHZ), .NUM_LEDS(NUM_LEDS)) ws2812a (
               .rgb_data (rgb_data),
               .led_num ((NUM_LEDS-1) - led_num),
               .write(write),
               .clk(clk),
               .data(data)
           );

endmodule

