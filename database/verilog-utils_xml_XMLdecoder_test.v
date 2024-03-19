`timescale 1ns / 1ps
`define NULL 0

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:		Chris Shucksmith
// Additional Comments: test bench for XML decoder
//
////////////////////////////////////////////////////////////////////////////////

module XMLdecoder_test;

	// Inputs
	reg CLOCK;
	reg svalid = 0;
	reg [7:0] stream;
	reg reset  = 0;
	reg eop = 0;

	// Outputs
	wire [7:0] out;
    wire outValid;
    wire outEop;
    wire isData;
    wire isTag;
    wire isTagName;
    wire isTagKey;
    wire isTagValue;
    wire isComment;
    wire depthPush;
    wire depthPop;
    wire [3:0] tagDepth;
    wire [7:0] s0;
    wire [7:0] s1;
    wire [7:0] s2;
    wire [7:0] s3;
    wire [7:0] s4;
    wire [7:0] s5;
    wire [7:0] s6;
    wire [7:0] s7;


	// Instantiate the Unit Under Test (UUT)
	XMLDecoder uut (
		.CLOCK(CLOCK),
		.in(stream),
		.inValid(svalid),
		.inEop(eop),

		.out(out),
		.outValid(outValid),
		.outEop(outEop),
		.isData(isData),
		.isTag(isTag),
		.isComment(isComment),
		.isTagValue(isTagValue),
		.isTagKey(isTagKey),
		.isTagName(isTagName),
		.tagDepth(tagDepth),
		.depthPush(depthPush),
		.depthPop(depthPop),
		.s0(s0),
		.s1(s1),
		.s2(s2),
		.s3(s3),
		.s4(s4),
		.s5(s5),
		.s6(s6),
		.s7(s7)
	);

	always #5 CLOCK = ~CLOCK;
	integer file;
	integer r;
	integer i, x;
	integer overrun;
   	reg [7:0] outNoNL, inNoNL;

	initial begin

		$dumpfile("bin/oxml.lxt");
		$dumpvars(0,uut);

		// Initialize Inputs
		CLOCK = 0;
		stream = 0;
		i = 0;
		overrun = 10;

		// open stimulus document
		file = $fopen("xml/xmltest.txt", "r");
		if (file == `NULL) begin
			$display("can't read test cases");
			$finish_and_return(1);
		end

		$display("Reading XML");
		$display("   ! comment, d data, t tag, n tagname, k tagkey, v tagvalue");
		$display("    i e v in   | v e out    dp + -    ! d t n k v    stack 0 1 2 3 4 5 6 7");

		// Wait 100 ns for global reset to finish
		#100;
		eop <= $feof(file) != 0;

		// stimulus
		while (overrun > 0) begin
			@(posedge CLOCK)
			x = $fgetc(file);
			stream <= x;
			svalid <= $feof(file) == 0 && x != "#";
			eop <= $feof(file) != 0 && overrun == 10;
			i <= i+1;
			if ( $feof(file) != 0 ) begin
				overrun <= overrun - 1;
			end
			outNoNL = (out == 10) ? "." : out;
			inNoNL = (stream == 10) ? "." : stream;
			$display(" %4d %b %b %x %s | %b %b %x %s   %02d %b %b    %b %b %b %b %b %b          %1d %1d %1d %1d %1d %1d %1d %1d ",
				i, eop, svalid, stream, inNoNL,
				outValid, outEop, out, outNoNL, tagDepth, depthPush, depthPop, isComment, isData, isTag, isTagName, isTagKey, isTagValue,
				s0, s1, s2, s3, s4, s5, s6, s7);

			if (overrun == 5) begin
				// just after EOP
				if (s0 != 1) begin
					$display("should be exactly one root element");
					$finish_and_return(1);
				end
				if (tagDepth != 0) begin
					$display("depth did not finish flat");
					$finish_and_return(1);
				end
			end

		end

		// post-test checks
		if (tagDepth != 0) begin
			$display("depth did not reset");
			$finish_and_return(1);
		end
		if (s0 != 0) begin
			$display("stack did not reset");
			$finish_and_return(1);
		end


		#100;

		$finish;

	end

endmodule

