// make AOUT = AIN
// assign DACin[0][SIGNAL_SIZE-1:SIGNAL_SIZE-16] = ADCraw[0];
// assign DACin[1][SIGNAL_SIZE-1:SIGNAL_SIZE-16] = ADCraw[1];
// assign DACin[2][SIGNAL_SIZE-1:SIGNAL_SIZE-20] = (ADCraw[1] <<< 4);

reg signed [SIGNAL_SIZE-1:0]	DACin_f[0:2];

always @(posedge clk1) begin
	DACin_f[0][SIGNAL_SIZE-1:SIGNAL_SIZE-16] <= ADCraw[0];
	DACin_f[1][SIGNAL_SIZE-1:SIGNAL_SIZE-16] <= ADCraw[1];
	DACin_f[2][SIGNAL_SIZE-1:SIGNAL_SIZE-20] <= (ADCraw[1] <<< 4);
end

assign DACin[0] = DACin_f[0];
assign DACin[1] = DACin_f[1];
assign DACin[2] = DACin_f[2];

// make DOUT = DIN
always @(posedge clk1) DOUT_f <= DIN_f;

// make the LEDs orange
always @(posedge clk1) begin
	LED_G_f[0] <= 1'b1;
	LED_G_f[1] <= 1'b1;
	LED_G_f[2] <= 1'b1;

	LED_R_f[0] <= 1'b1;
	LED_R_f[1] <= 1'b1;
	LED_R_f[2] <= 1'b1;
end
