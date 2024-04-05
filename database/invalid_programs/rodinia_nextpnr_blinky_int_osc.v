module top;

	wire [7:0] leds;
	(* BEL="IOTILE(02,01):alta_rio02", keep *)	/* PIN_11 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led7_obuf (.I(leds[7]));
	(* BEL="IOTILE(07,01):alta_rio00", keep *)	/* PIN_09 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led6_obuf (.I(leds[6]));
	(* BEL="IOTILE(06,09):alta_rio02", keep *)  /* PIN_06 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led5_obuf (.I(leds[5]));
	(* BEL="IOTILE(01,09):alta_rio01", keep *)  /* PIN_05 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led4_obuf (.I(leds[4]));
	(* BEL="IOTILE(00,09):alta_rio00", keep *)	/* PIN_04 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led3_obuf (.I(leds[3]));
	(* BEL="IOTILE(00,09):alta_rio02", keep *)	/* PIN_03 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led2_obuf (.I(leds[2]));
	(* BEL="IOTILE(01,09):alta_rio03", keep *)	/* PIN_02 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led1_obuf (.I(leds[1]));
	(* BEL="IOTILE(02,09):alta_rio00", keep *)	/* PIN_01 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led0_obuf (.I(leds[0]));

reg [25:0] ctr;
wire clk;

alta_boot boot(
	.i_osc_enb(1'b0),
	.o_osc(clk),
);

always @(posedge clk)
	ctr <= ctr + 1'b1;

assign leds = ctr[25:18];

endmodule
