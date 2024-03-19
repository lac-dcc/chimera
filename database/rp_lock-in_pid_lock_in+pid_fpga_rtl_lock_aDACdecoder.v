//////////////////////////////////////////////////////////////////////////////////
//
// This moduel generates the pattern to configure PWM slow DAC outputs
//
//////////////////////////////////////////////////////////////////////////////////


/* Description for help:

The PWM module runs a counter from 1 - 156 on a 250MHz clock. This counter is the compare value for the PWM, so the PWM frequency is actually 250MHz / 156 ~= 1.6MHz.
The counter is compared against the upper 8 bits of the 24 bit DAC data channels A-D, and the output goes high if the counter is smaller than the data value (DAC data 0x000000⇒ 0%, 0x9C0000⇒ 100% duty cycle).

But wait, this gives us only log2(157) = 7.3 bits of resolution, right ? And what happens with the lower 16 bit of the DAC data ?

The lower 16 bit are each tested in turn over 16 PWM periods, and if a 1 is found, the compare value is incremented by 1 for one period. Averaging over 16 PWM cycles yields another log2(16) = 4 bit of resolution from the ratio between 0 and 1 bits in the lower 16 bit of the DAC data.

After 16 PWM cycles a new DAC data value is read, which leads us to 1.6MHz / 16 = 100ksps at a (theoretical) resolution of 11.3 bit.

In that light, a 1st order cut-off frequency of 200kHz seems sufficient to remove the PWM frequency of 1.6MHz and perform the averaging over 16 cycles.

*/

module aDACdecoder
(
	input clk,rst,
    input  wire [12-1:0] in,
	output wire [24-1:0] out
);

    //reg dac_a_r[24-1:0];
    reg [16-1:0] dac_a_r;

    always @(posedge clk) begin
        //dac_a_r[24-1:16] <= in[11:4];
        casez(in[4-1:0])
            4'd0 : dac_a_r <= 16'b0000000000000000;
            4'd1 : dac_a_r <= 16'b0000000000000001;
            4'd2 : dac_a_r <= 16'b0000000100000001;
            4'd3 : dac_a_r <= 16'b0000100000100001;
            4'd4 : dac_a_r <= 16'b0001000100010001;
            4'd5 : dac_a_r <= 16'b0010010010010001;
            4'd6 : dac_a_r <= 16'b0010100100101001;
            4'd7 : dac_a_r <= 16'b0101010010101001;
            4'd8 : dac_a_r <= 16'b0101010101010101;
            4'd9 : dac_a_r <= 16'b1010101101010110;
            4'd10: dac_a_r <= 16'b1101011011010110;
            4'd11: dac_a_r <= 16'b1101101101101110;
            4'd12: dac_a_r <= 16'b1110111011101110;
            4'd13: dac_a_r <= 16'b1111011111011110;
            4'd14: dac_a_r <= 16'b1111111011111110;
            4'd15: dac_a_r <= 16'b1111111111111110;
        endcase
    end
    
    assign out= { in[11:4] , dac_a_r };

endmodule

/*
aDACdecoder i_aDACdecoder (
  .clk(adc_clk), .rst(adc_rstn),
  .in(dat14),
  .out(pwm_cfg_a)
);
*/

