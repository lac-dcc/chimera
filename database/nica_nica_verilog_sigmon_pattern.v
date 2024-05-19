// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

// Sigmon: Patterm Matching & Sampling: Handling a single event
// Gabi Malka, Technion, TCE
// Jan-2018

module sigmon_pattern (
		       input wire 	  clk,
		       input wire 	  reset,
		       input wire 	  stream_vld,
		       input wire 	  stream_rdy,
		       input wire 	  stream_last,
		       input wire [255:0] stream_data,
		       input wire 	  pattern_enable,
		       input wire 	  pattern_disable,
		       input wire [31:0]  pattern_ctrl,
		       input wire [31:0]  pattern_h,
		       input wire [31:0]  pattern_l,
		       input wire 	  stream0_sample,
		       input wire 	  stream0_match,
		       input wire 	  stream1_sample,
		       input wire 	  stream1_match,
		       input wire 	  stream2_sample,
		       input wire 	  stream2_match,
		       input wire 	  stream3_sample,
		       input wire 	  stream3_match,
		       output wire [47:0] sample_data_out,
		       output wire 	  match_event_out,
		       output wire 	  sample_event_out,
		       output wire 	  match_internal_event_out,
		       output wire 	  sample_internal_event_out,
		       output wire 	  merged_event_out
);

`include "sigmon_events.v"

localparam	
  MATCH = 0,
  SAMPLE = 1;

  reg pattern_is_enabled;
  reg pattern_enableQ;
  reg pattern_disableQ;
  wire stream_eop;
  wire stream_sop;
  reg stream_eopQ;
  reg [255:0] stream_data0, stream_data1;
  reg [2:0] stream_data0_status, stream_data0_statusQ, stream_data1_status;
  reg [2:0] stream_data0_count, stream_data1_count;
  wire pattern_mode;
  wire [3:0] pattern_source;
  wire [5:0] pattern_mask;
  wire [4:0] pattern_byte_count; // byte count within the data chunk
  wire [2:0] pattern_line_count; // stream line count, in which to look for the pattern
  wire [47:0] pattern_in;        // 6 bytes of the searched pattern
  reg [47:0] sampled_data;       // 6 bytes of the tested string (for match/sample)
  reg [47:0] sample_data;        // 6 bytes of the sampled string
  reg [47:0] sample_dataQ;        // delayed, 6 bytes of the sampled string
  reg [47:0] sample_data_eop;     // delayed to eop, 6 bytes of the sampled string
  reg sample_event;
  reg match_event;
  reg sample_event_eop;
  reg match_event_eop;
  reg sample_eventQ;
  reg match_eventQ;
  reg stream0_eventQ;
  reg stream1_eventQ;
  reg stream2_eventQ;
  reg stream3_eventQ;
  wire streamx_event;
  wire streamx_eventQ;
  wire [3:0] merge_source;
  wire [3:0] merged_events;
  reg [1:0] packet_index;
  reg [1:0] packet_indexQ;
  reg [3:0] events_array[0:3];
  reg merged_event;
  wire byte0_match, byte1_match, byte2_match, byte3_match, byte4_match, byte5_match;
  reg [3:0] events_delta;
  
  assign pattern_mode = pattern_ctrl[31];
  assign merge_source = pattern_ctrl[19:16];
  assign pattern_mask = pattern_ctrl[13:8];
  assign pattern_line_count = pattern_ctrl[7:5];
  assign pattern_source = pattern_ctrl[27:24];
  assign stream_sop = stream_eopQ & stream_vld & stream_rdy;
  assign stream_eop = stream_last & stream_vld & stream_rdy;

// !!!====> recheck this comment: In axistreams: byte_count within a 256bit data line is inverted, modulo 32 (1st bit of stream is axi4stream_data[255])
// In aximm address sampling, byte_count is NOT inverted, thus must be re-adjusted
  assign pattern_byte_count = (pattern_source > 4 & pattern_source < 9) ?
			      // pattern source is either of the axi4mm addresses.
			      // Set byte count to    max(d'26, (d'26 - pattern_ctrl[4:0])):
			      ((pattern_ctrl[4:0] > 5'b11010) ? 5'b00000 : (6'b011010 - {1'b0, pattern_ctrl[4:0]})) : 
			      pattern_ctrl[4:0];

  assign pattern_in = {pattern_h[15:0], pattern_l[31:0]};
  assign sample_data_out = sample_data_eop;
  assign sample_event_out = sample_event_eop;
  assign match_event_out = match_event_eop;
  assign match_internal_event_out = match_event;
  assign sample_internal_event_out = sample_event;
  assign byte0_match = pattern_mask[0] | (pattern_in[7:0] == sampled_data[7:0]);
  assign byte1_match = pattern_mask[1] | (pattern_in[15:8] == sampled_data[15:8]);
  assign byte2_match = pattern_mask[2] | (pattern_in[23:16] == sampled_data[23:16]);
  assign byte3_match = pattern_mask[3] | (pattern_in[31:24] == sampled_data[31:24]);
  assign byte4_match = pattern_mask[4] | (pattern_in[39:32] == sampled_data[39:32]);
  assign byte5_match = pattern_mask[5] | (pattern_in[47:40] == sampled_data[47:40]);
  assign merged_event_out = merged_event;
  

// Look for pattern_enable assertion
always @(posedge clk) begin
  if (reset) begin
    pattern_is_enabled <= 0;
    pattern_enableQ <= 0;
    pattern_disableQ <= 0;
  end
  else begin
    pattern_enableQ <= pattern_enable;
    pattern_disableQ <= pattern_disable;

    if (pattern_enable & ~pattern_enableQ)
      pattern_is_enabled <= 1;    
    if (pattern_disable & ~pattern_disableQ)
      pattern_is_enabled <= 0;    
  end
end
  
always @(posedge clk) begin
  if (reset) begin
    sample_event <= 1'b0;
    match_event <= 1'b0;
    sample_data <= 48'ha5a5a5a5a5a5;
  end
  else begin

    if (pattern_is_enabled & (pattern_mode == MATCH) & stream_data0_status[0]) begin
      if ((pattern_line_count == stream_data0_count) & (byte0_match & byte1_match & byte2_match & byte3_match & byte4_match & byte5_match))
	match_event <= 1'b1;
      else
	match_event <= 1'b0;
    end
    else
      match_event <= 1'b0;

    if (pattern_is_enabled & (pattern_mode == SAMPLE) & stream_data0_status[0]) begin
      if (pattern_line_count == stream_data0_count) begin
	sample_event <= 1'b1;
	sample_data <= sampled_data;
      end
      else begin
	sample_event <= 1'b0;
//	sample_data <= 48'ha5a5a5a5a5a5;
      end
    end
    else 
	sample_event <= 1'b0;
  end
end

// Mark packets end at each axi-stream interface
// This indication is used to generate next packet start (*_sop) indication
always @(posedge clk) begin
  if (reset) begin
// asserted at reset, assuming correct sequence of packets at all streams
// thus to assert *_sop indication, upon begin of packets stream  
    stream_eopQ <= 1'b1;
    stream_data0 <= 256'ha5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5;
    stream_data1 <= 256'ha5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5;
    stream_data0_status <= 3'b000;
    stream_data1_status <= 3'b000;
    stream_data0_count <= 3'b000;
    stream_data1_count <= 3'b000;
  end
  else begin

    stream_data0 <= stream_data1;
    stream_data0_status <= stream_data1_status;
    stream_data0_count <= stream_data1_count;
    stream_data0_statusQ <= stream_data0_status;
    
    // stream_data is continuously sampled, independent of its vld,rdy indications
    if (stream_vld & stream_rdy) begin
      stream_data1 <= stream_data;
      stream_data1_count <= (stream_sop) ? 3'b000 : stream_data1_count + 1;
      stream_data1_status <= {stream_eop, stream_sop, 1'b1};
    end
    else begin
      stream_data1 <= 256'ha5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5;
      stream_data1_count <= 3'b000;
      stream_data1_status <= 3'b000;
    end
    
    if (stream_vld & stream_rdy) begin
      if (stream_last)
	stream_eopQ <= 1;
      else
	stream_eopQ <= 0;
    end      
  end
end
  

// Merged event
  assign streamx_event = (merge_source[3:0] != 4'b0000) & 
			 (merge_source[3:0] == {merge_source[3] & (stream3_sample | stream3_match), 
						merge_source[2] & (stream2_sample | stream2_match), 
						merge_source[1] & (stream1_sample | stream1_match), 
						merge_source[0] & (stream0_sample | stream0_match)}) ? 1'b1 : 1'b0;
  assign streamx_eventQ = (merge_source[3:0] != 4'b0000) & 
			  (merge_source[3:0] == {merge_source[3] & (stream3_sample | stream3_match | stream3_eventQ), 
						merge_source[2] & (stream2_sample | stream2_match | stream2_eventQ), 
						merge_source[1] & (stream1_sample | stream1_match | stream1_eventQ), 
						merge_source[0] & (stream0_sample | stream0_match | stream0_eventQ)}) ? 1'b1 : 1'b0;
  
// Delayed match/sample events till eop:
  always @(posedge clk) begin
    if (reset) begin
      match_event_eop <= 1'b0;
      sample_event_eop <= 1'b0;
      match_eventQ <= 1'b0;
      sample_eventQ <= 1'b0;
    end
    else begin
      if (stream_data0_statusQ[2]) begin // eop
	if (stream_data0_statusQ[1]) begin // sop & eop: a single data-line packet 
	  //end of a single line packet:
	  if (match_event)
	    match_event_eop <= 1'b1;
	  else
	    match_event_eop <= 1'b0;

	  if (sample_event) begin
	    sample_event_eop <= 1'b1;
	    sample_data_eop <= sample_data;
	  end
	  else
	    sample_event_eop <= 1'b0;
	end
	else begin
	  // end of a multi-line packet:
	  // the selected the match/sample events have been asserted for either current (last) line or either of previous lines in same epacket 
	  if (match_event | match_eventQ)
	    match_event_eop <= 1'b1;
	  else
	    match_event_eop <= 1'b0;

	  if (sample_event | sample_eventQ) begin
	    sample_event_eop <= 1'b1;
	    if (sample_event)
	      sample_data_eop <= sample_data;
	    else //sample_eventQ
	      sample_data_eop <= sample_dataQ;
	  end

	  else
	    sample_event_eop <= 1'b0;
	end
	// Clear previuosly recorded events
	match_eventQ <= 1'b0;
	sample_eventQ <= 1'b0;
      end
      else begin
	// we are at a middle of a packet. Record match/sample events, if any:
	sample_event_eop <= 1'b0;
	match_event_eop <= 1'b0;
	if (match_event)	
	  match_eventQ <= 1'b1;
	if (sample_event) begin
	  sample_eventQ <= 1'b1;
	  sample_dataQ <= sample_data;
	end
      end
    end
  end



// Merge events:
  always @(posedge clk) begin
    if (reset) begin
      merged_event <= 1'b0;
      stream0_eventQ <= 1'b0;
      stream1_eventQ <= 1'b0;
      stream2_eventQ <= 1'b0;
      stream3_eventQ <= 1'b0;
    end
    else begin
      if (stream_data0_statusQ[2]) begin // eop
	if (stream_data0_statusQ[1]) begin // sop & eop: a single data-line packet 
	  //end of a single line packet:
	  if (streamx_event)
	  // the selected the match/sample events have been just asserted 
	    merged_event <= 1'b1;
	  else
	    merged_event <= 1'b0;
	end
	else begin
	  // end of a multi-line packet:
	  // the selected the match/sample events have been asserted for either current (last) line or either of previous lines in same epacket 
	  if (streamx_event | streamx_eventQ)
	    merged_event <= 1'b1;
	  else
	    merged_event <= 1'b0;
	end
	// Clear previuosly recorded events
	stream0_eventQ <= 1'b0;
	stream1_eventQ <= 1'b0;
	stream2_eventQ <= 1'b0;
	stream3_eventQ <= 1'b0;
      end
      else begin
	// we are at a middle of a packet. Record match/sample events, if any:
	merged_event <= 1'b0;
	if (stream0_sample | stream0_match)	
	  stream0_eventQ <= 1'b1;
	if (stream1_sample | stream1_match)	
	  stream1_eventQ <= 1'b1;
	if (stream2_sample | stream2_match)	
	  stream2_eventQ <= 1'b1;
	if (stream3_sample | stream3_match)	
	  stream3_eventQ <= 1'b1;
      end
    end
  end
  
  
  // Locate the desired pattern withing the incoming data stream:
  always @(*) begin
    case (pattern_byte_count)
      26: begin
	sampled_data[47:0] <= stream_data0[47:0];
      end
      25: begin
	sampled_data[47:0] <= stream_data0[55:8];
      end
      24: begin
	sampled_data[47:0] <= stream_data0[63:16];
      end
      23: begin
	sampled_data[47:0] <= stream_data0[71:24];
      end
      22: begin
	sampled_data[47:0] <= stream_data0[79:32];
      end
      21: begin
	sampled_data[47:0] <= stream_data0[87:40];
      end
      20: begin
	sampled_data[47:0] <= stream_data0[95:48];
      end
      19: begin
	sampled_data[47:0] <= stream_data0[103:56];
      end
      18: begin
	sampled_data[47:0] <= stream_data0[111:64];
      end
      17: begin
	sampled_data[47:0] <= stream_data0[119:72];
      end
      16: begin
	sampled_data[47:0] <= stream_data0[127:80];
      end
      15: begin
	sampled_data[47:0] <= stream_data0[135:88];
      end
      14: begin
	sampled_data[47:0] <= stream_data0[143:96];
      end
      13: begin
	sampled_data[47:0] <= stream_data0[151:104];
      end
      12: begin
	sampled_data[47:0] <= stream_data0[159:112];
      end
      11: begin
         sampled_data[47:0] <= stream_data0[167:120];
     end
      10: begin
	sampled_data[47:0] <= stream_data0[175:128];
      end
      9: begin
	sampled_data[47:0] <= stream_data0[183:136];
      end
      8: begin
	sampled_data[47:0] <= stream_data0[191:144];
      end
      7: begin
	sampled_data[47:0] <= stream_data0[199:152];
      end
      6: begin
	sampled_data[47:0] <= stream_data0[207:160];
      end
      5: begin
	sampled_data[47:0] <= stream_data0[215:168];
      end
      4: begin
	sampled_data[47:0] <= stream_data0[223:176];
      end
      3: begin
	sampled_data[47:0] <= stream_data0[231:184];
      end
      2: begin
	sampled_data[47:0] <= stream_data0[239:192];
      end
      1: begin
	sampled_data[47:0] <= stream_data0[247:200];
      end
      0: begin
	sampled_data[47:0] <= stream_data0[255:208];
      end
      27: begin
	sampled_data[47:8] <= stream_data0[39:0];

// In case of of back_to_back packets, stream_data1 holds the first line of next packet, thus should not be assigned to sampled_data 
	sampled_data[7:0] <= (stream_data0_status[2] & stream_data0_status[0]) ? 8'ha5 : stream_data1[255:248];
      end
      28: begin
	sampled_data[47:16] <= stream_data0[31:0];
	sampled_data[15:0] <= (stream_data0_status[2] & stream_data0_status[0]) ? 16'ha5a5 : stream_data1[255:240];
      end
      29: begin
	sampled_data[47:24] <= stream_data0[23:0];
	sampled_data[23:0] <= (stream_data0_status[2] & stream_data0_status[0]) ? 24'ha5a5a5 : stream_data1[255:232];
      end
      30: begin
	sampled_data[47:32] <= stream_data0[15:0];
	sampled_data[31:0] <= (stream_data0_status[2] & stream_data0_status[0]) ? 32'ha5a5a5a5 : stream_data1[255:224];
      end
      31: begin
	sampled_data[47:40] <= stream_data0[7:0];
	sampled_data[39:0] <= (stream_data0_status[2] & stream_data0_status[0]) ? 40'ha5a5a5a5a5 : stream_data1[255:216];
      end
      default: 
	begin
	  sampled_data[47:0] <= 48'h000bad00f00d;
	end
    endcase
  end      

endmodule
