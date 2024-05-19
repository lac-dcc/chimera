// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


// https://github.com/mattvenn/ws2812-core

module ws2812 (
        input wire [23:0] rgb_data,
        input wire [7:0] led_num,
        input wire write,
        input wire clk,
        output reg data = 0
    );
    parameter CLK_MHZ = 27;
    parameter NUM_LEDS = 1;
    parameter t_on = (CLK_MHZ*850/1000);
    parameter t_off = (CLK_MHZ*450/1000);
    parameter t_reset = (CLK_MHZ*280);

    localparam t_period = (CLK_MHZ*1250/1000);
    localparam LED_BITS = $clog2(NUM_LEDS);
    localparam COUNT_BITS = $clog2(t_reset);
    localparam STATE_DATA  = 0;
    localparam STATE_RESET = 1;

    reg [23:0] led_reg [NUM_LEDS-1:0];
    reg [LED_BITS-1:0] led_counter = NUM_LEDS - 1;
    reg [COUNT_BITS-1:0] bit_counter = 0;
    reg [4:0] rgb_counter = 23;
    reg [1:0] state;
    reg [23:0] led_color;

    always @(posedge clk) begin
        if(write)
            led_reg[led_num] <= rgb_data;
        led_color <= led_reg[led_counter];
    end

    always @(posedge clk)
    case(state)

        STATE_RESET: begin
            rgb_counter <= 5'd23;
            led_counter <= NUM_LEDS - 1;
            data <= 0;

            bit_counter <= bit_counter - 1;

            if(bit_counter == 0) begin
                state <= STATE_DATA;
                bit_counter <= t_period;
            end
        end

        STATE_DATA: begin
            if(led_color[rgb_counter])
                data <= bit_counter > (t_period - t_on);
            else
                data <= bit_counter > (t_period - t_off);
            bit_counter <= bit_counter - 1;
            if(bit_counter == 0) begin
                bit_counter <= t_period;
                rgb_counter <= rgb_counter - 1;

                if(rgb_counter == 0) begin
                    led_counter <= led_counter - 1;
                    bit_counter <= t_period;
                    rgb_counter <= 23;

                    if(led_counter == 0) begin
                        state <= STATE_RESET;
                        led_counter <= NUM_LEDS - 1;
                        bit_counter <= t_reset;
                    end
                end
            end
        end
    endcase
endmodule
