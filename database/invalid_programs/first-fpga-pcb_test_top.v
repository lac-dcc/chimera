`default_nettype none
module top #(
    parameter PWM_WIDTH = 6)
(
    input clk,
    input sw1,
    input sw2,
    output led1,
    output led2,

    output  pmod1_10,
    output  pmod1_4,
    output  pmod1_9,
    output  pmod1_3,
    output  pmod1_8,
    output  pmod1_2,
    output  pmod1_7,
    output  pmod1_1

    );

    wire clk60;
    localparam MAX_PWM = 2 ** PWM_WIDTH - 1;
    reg [25:0] rate = MAX_COUNT;
    reg [25:0] counter = 0;
    reg [6:0] button_counter = 0; // slow down the effect of the buttons
    reg [PWM_WIDTH:0] pwm_counter = 0;
    wire [PWM_WIDTH-1:0] corrected_pwm_level;
    assign led1 = pwm_counter[PWM_WIDTH-1];

`ifndef DEBUG
    pll pll_0(.clock_in(clk), .clock_out(clk60));
    localparam MAX_COUNT = 800000;
`else
    assign clk60 = clk;
    localparam MAX_COUNT = 10;
`endif

    // use 60MHz PLL to pulse LED
    always @(posedge clk60) begin
        counter <= counter + 1;
        button_counter <= button_counter + 1;
        if(counter == rate) begin
            counter <= 0;
            pwm_counter <= pwm_counter + 1;
        end
    
    end

    always @(posedge clk60) begin
        if(&button_counter) begin
            if(!sw1 && rate < MAX_COUNT*4)
                rate <= rate + 1;
            if(!sw2 && rate > MAX_COUNT/4)
                rate <= rate - 1;
        end
    end

    // turn saw into triangle
    wire [PWM_WIDTH-1:0] pwm_level = pwm_counter > MAX_PWM ? MAX_PWM - pwm_counter : pwm_counter;

    // gamma correction LUT
    bram #(.ADDR_W(PWM_WIDTH), .DATA_W(PWM_WIDTH), .FILE("gamma.hex")) gamma_LUT (.r_clk(clk60), .r_addr(pwm_level), .r_data(corrected_pwm_level), .r_en(1'b1));

    // led is low to light, so invert PWM
    pwm #(.WIDTH(PWM_WIDTH), .INVERT(1'b1)) pwm_0(.clk(clk60), .level(corrected_pwm_level), .pwm(led2));


    // put the counter out on one of the pmods
    assign  pmod1_10 = counter[0];
    assign  pmod1_4  = counter[0];
    assign  pmod1_9  = counter[0];
    assign  pmod1_3  = counter[0];
    assign  pmod1_8  = counter[0];
    assign  pmod1_2  = counter[0];
    assign  pmod1_7  = counter[0];
    assign  pmod1_1  = counter[0];

endmodule
