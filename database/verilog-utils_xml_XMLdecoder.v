`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:    Chris Shucksmith
// Module:		High speed serial XML classifier, like a physical sax parser
//
//  XML messages are delivered byte at a time. Internally we buffer four bytes from
//  the input so that the comment/data streams can be seperated. The input stream
//  can be paused for an arbitary period by lowering 'valid' which holds the pipeline
//  and state machines in position.
//
//  If eom is asserted, any 'valid' left in the pipeline is flushed iresspective of
//  the valid signal. For the puposes of look ahead, bytes beyond the eop are defined
//  as null so that processing can complete. One cycle after the last valid byte is
//  flushed parser state is reset.
//
//  As data bytes clock out of the 4 byte pipeline, several control signals are present
//  to qualify where the data is a) valid, b) in a comment, tag or data  c) position
//  within the current document (tags visited at each nesting depth). bytes within tags
//  are further classified into name, key and value elemnts.
//
//  Transitions between tag nesting depths occur after presening the '>' tag close
//  character, at whcih tagDepth, depthPush, depthPop and depth stack s0..s7 are updated
//  for the cycle following a tag-close character '>'.
//
//  After configuration an eop event is internally generated which ensures the nesting
//  stack is clear if it is synthesised to block ram.
//
//  XML doctypes are treated as a special case of self-closing tag which does not
//  adjust the tag depth.
//
//  This module can scan XML content at 1gb+ line speed on most mid range FPGAs
//
//////////////////////////////////////////////////////////////////////////////////
module XMLDecoder(
    input CLOCK,

    input inValid,
    input inEop,
    input [7:0] in,

    output reg outValid = 0,
    output reg outEop = 0,
    output reg [7:0] out = 0,

    output isData,
    output isTag,
    output reg isTagName = 0,
    output reg isTagKey = 0,
    output reg isTagValue = 0,
    output reg isComment = 0,

    output reg [3:0] tagDepth = 0,
    output reg depthPush = 0,
    output reg depthPop = 0,

    output [7:0] s0,
    output [7:0] s1,
    output [7:0] s2,
    output [7:0] s3,
    output [7:0] s4,
    output [7:0] s5,
    output [7:0] s6,
    output [7:0] s7
    );

	reg eopn   = 1;
	reg eopnn  = 1;
	reg eopnnn = 1;

	reg vnnn = 0;
 	reg vnn  = 0;
	reg vn   = 0;
	//g v    = 0;

	reg [7:0] snnn = 0;
	reg [7:0] snn  = 0;
	reg [7:0] sn   = 0;
	//g [7:0] out  = 0;
	reg [7:0] sp   = 0;
	reg [7:0] spp  = 0;

	reg isClosingTag     = 0;
	reg isSelfClosingTag = 0;

	reg intag             = 0;  // state of the input stream, after strippping comments: 1=tag 0=data


	reg [7:0] tagno [0:7];  // tag position at depth N.. if large enough will instantiate a block ram

	// XML comment is <!--
	wire onTagStartNext = sn == "<" && !(snn=="!" && snnn=="-");  //  '<' but not <!-
	wire onTagClose = (out == ">");		   //  '>'
	wire onSelfCloseTag = (out =="/" || out == "?") && sn == ">";   // consider XML doctype self-closing
	wire onCloseThenData = onTagClose && sn != "<";

	wire isOpeningTag = intag && !isSelfClosingTag && !isClosingTag;
	wire _isData = outValid && !intag && !isComment;
	wire _isTag  = intag && !isComment;

	// export the stack depth positions
	assign s0 = tagno[0];
	assign s1 = tagno[1];
	assign s2 = tagno[2];
	assign s3 = tagno[3];
	assign s4 = tagno[4];
	assign s5 = tagno[5];
	assign s6 = tagno[6];
	assign s7 = tagno[7];

	// initialise to all zeros after configuration
	initial $readmemh("xml/stack_zeros.txt", tagno);

	always @(posedge CLOCK) begin
		// pipeline the input so that we can see ahead by 4 'valid' characters to separate comment/data streams
		// If eop is set, continue to flush the pipeline irrespective of 'valid' being de-asserted

		// extend (ripple) eop
		eopnnn    <= inEop;
		eopnn     <= eopnnn;
		eopn      <= eopnn;
		outEop    <= eopn;

		if (inValid || eopn || eopnn || eopnnn || inEop) begin

			// ripple for valid signal
			vnnn      <= inValid;
			vnn       <= vnnn;
			vn        <= vnn;
			outValid  <= vn;

			// ripple for data look ahead/behind
			snnn      <= in;
			snn       <= snnn;
			sn        <= snn;
			out       <= sn;
			sp        <= out;
			spp       <= sp;

		end else begin
			outValid  <= 0;
		end

		if (outEop) begin	// pipeline totally flushed, reset state
			tagDepth 		<= 0;
			tagno[0]		<= 0;
			tagno[1]		<= 0;
			tagno[2]		<= 0;
			tagno[3]		<= 0;
			tagno[4]		<= 0;
			tagno[5] 		<= 0;
			tagno[6] 		<= 0;
			intag            <= 0;
			isClosingTag     <= 0;
			isSelfClosingTag <= 0;
			isTagName        <= 0;
			isTagKey         <= 0;
			isTagValue       <= 0;
			isComment        <= 0;
			depthPush        <= 0;
			depthPop         <= 0;
		end else if (vn || eopn || eopnn || eopnnn) begin	// pipeline fully loaded with data or eop
			// handle comments, look ahead to start, look behind to end, one cycle ahead of data/tag state
			isComment <=  (( (sn == "<" && !eopn) && (snn == "!" && !eopnn) && (snnn == "-" && !eopnnn) && (in == "-" && !inEop)) || isComment )
						&& !(out == ">" && sp == "-" && spp == "-");

			// if we are not in a comment, stream is either a tag or data
			if (!isComment) begin
				intag <= (intag || onTagStartNext) && !(onTagClose && !onTagStartNext);
				isTagName <= ((out == "<" && sn != "/") || (out=="/" && sp == "<") || isTagName)
				               && !(sn == " " || sn == ">");

				// for tag key/value logic, enable the alternator when intag & !isTagName
				//   <tagname key=value key=value key=value>
				isTagKey <= (intag && out==" " || isTagKey) && sn!="=";
				isTagValue <= (intag && out=="=" || isTagValue) && !(sn == " " || sn == ">");

				isClosingTag <= (out != ">" && isClosingTag) || (out == "<" && sn == "/");
				isSelfClosingTag <= (isSelfClosingTag || onSelfCloseTag) && !onTagStartNext;

				// a tag is either opening, closing or self-closing. At the end of the tag
				// (onTagClose) we adjust and flag changes to depth based on the three possibilities.
				
				if (onTagClose && isOpeningTag) begin
					tagDepth <= tagDepth + 8'h1;
				end else if (onTagClose && isClosingTag) begin
					tagDepth <= tagDepth - 8'h1;
				end else begin
					tagDepth <= tagDepth;
				end
				
				depthPush <= onTagClose && isOpeningTag;
				depthPop  <= onTagClose && isClosingTag;

				if (onTagClose) begin
					if (isClosingTag || isSelfClosingTag) begin
						tagno[tagDepth] <= tagno[tagDepth] + 8'h1;
						tagno[tagDepth+1] <= 0;
					end
				end
			end
		end
	end

	assign isTag      = _isTag;
	assign isData     = _isData;

endmodule

