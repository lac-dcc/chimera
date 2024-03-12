module blinky_top( //top module
	CLK_i,
    LED0_o,
    LED1_o,
    LED2_o,
    LED3_o,
    LED4_o,
    LED5_o,
    LED6_o,
    LED7_o
    );

input CLK_i;    //input 12Mhz clock
output LED0_o;  //output signal to LEDs
output LED1_o;
output LED2_o;
output LED3_o;
output LED4_o;
output LED5_o;
output LED6_o;
output LED7_o;

reg [24:0] counter;

assign LED0_o = counter[24];
assign LED1_o = counter[23];
assign LED2_o = counter[22];
assign LED3_o = counter[21];
assign LED4_o = counter[20];
assign LED5_o = counter[19];
assign LED6_o = counter[18];
assign LED7_o = counter[17];

always @ (posedge CLK_i) begin
    counter <= counter + 1;
end

endmodule
