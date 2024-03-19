module top;

	wire clk;
	(* BEL="IOTILE(49,15):alta_io02", keep *) /* PIN_112 */
	GENERIC_IOB #(.INPUT_USED(1), .OUTPUT_USED(0)) clk_ibuf (.O(clk));
//	(* BEL="IOTILE(40,05):alta_rio01", keep *) /* PIN_95 */
//	GENERIC_IOB #(.INPUT_USED(1), .OUTPUT_USED(0)) clk_ibuf (.O(clk));

	wire [7:0] leds;
	(* BEL="IOTILE(45,00):alta_rio03", keep *)	/* PIN_87 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led7_obuf (.I(leds[7]));
	(* BEL="IOTILE(45,00):alta_rio02", keep *)	/* PIN_88 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led6_obuf (.I(leds[6]));
	(* BEL="IOTILE(49,03):alta_rio03", keep *)  /* PIN_89 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led5_obuf (.I(leds[5]));
	(* BEL="IOTILE(49,03):alta_rio02", keep *)  /* PIN_90 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led4_obuf (.I(leds[4]));
	(* BEL="IOTILE(49,03):alta_rio01", keep *)	/* PIN_91 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led3_obuf (.I(leds[3]));
	(* BEL="IOTILE(49,03):alta_rio00", keep *)	/* PIN_92 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led2_obuf (.I(leds[2]));
	(* BEL="IOTILE(49,04):alta_rio05", keep *)	/* PIN_93 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led1_obuf (.I(leds[1]));
	(* BEL="IOTILE(49,04):alta_rio04", keep *)	/* PIN_94 */
	GENERIC_IOB #(.INPUT_USED(0), .OUTPUT_USED(1)) led0_obuf (.I(leds[0]));

reg [25:0] ctr;
always @(posedge clk)
	ctr <= ctr + 1'b1;

assign leds = ctr[25:18];

endmodule
