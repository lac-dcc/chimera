
module chip (
	output	LED_R,
	output	LED_G,
	output	LED_B
	);

	wire clk;

	SB_HFOSC u_hfosc (
        	.CLKHFPU(1'b1),
        	.CLKHFEN(1'b1),
        	.CLKHF(clk)
    	);

	reg led0, led1, led2;

	test_deflate_bench mytest (
    		clk,
    		o_led,
    		led0,
    		led1,
    		led2
       );

       SB_RGBA_DRV rgb (
		.RGBLEDEN (1'b1),
		.RGB0PWM  (led0),
		.RGB1PWM  (led1),
		.RGB2PWM  (led2),
		.CURREN   (1'b1),
		.RGB0     (LED_R),
		.RGB1     (LED_G),
		.RGB2     (LED_B)
	);
	defparam RGB_DRIVER.CURRENT_MODE = "0b1";
	defparam RGB_DRIVER.RGB0_CURRENT = "0b000001";
	defparam RGB_DRIVER.RGB1_CURRENT = "0b000001";
	defparam RGB_DRIVER.RGB2_CURRENT = "0b000001";

endmodule
