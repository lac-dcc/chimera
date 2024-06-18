// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

////////////////////////////////////////////////////////////////////////////////////////////////  
// sha256 Module
// =============
//
// sha unit latency is 132 clocks !!! due to the need to resolve sha unit critical paths, its frequency is half the FPGA clock frequency.
// Multiple sha units are deployed (pre defined in NUM_SHA_UNITS), to sustain the long latency per single sha unit.
// sha results order follow the inputs blocks order
// The basic sha unit has been borrowed from https://github.com/secworks/sha256
//
//
// Mode of operation:
// 1. ikernel provides the required blocks for sha calculation, via the ik2sha axi_stream interface.
// 2. In case of a multi-block sha peration, its last block should be associated with the tlast indication
// 3. The incoming blocks are then fed to individual sha units, for sha calculation.
//    The blocks are fed to the multiple sha units in a round robin fasion
// 4. Once calculation is done, the digest results are read from sha units to the output fifo.
//    The digest results are read from the multiple sha units in a round robin fasion
// 5. Final digest results are read by the ikernel via the sha2ik axi_stream interface.
//

module sha256_top #(
parameter
 NUM_SHA_UNITS = 8
)(
  input wire 	      clk,
  input wire 	      reset,

 // Blocks input to sha module
  input wire 	      ik2sha_vld,
  input wire 	      ik2sha_last,
  output wire 	      ik2sha_rdy,
  input wire [511:0]  ik2sha_data,

 // Digest output to ik 
  output wire 	      sha2ik_vld,
  input wire 	      sha2ik_rdy,
  output wire [255:0] sha2ik_data

  );

  wire 				     fifo2ik_rdy;
  wire 				     fifo2ik_vld;
  wire 				     ik2fifo_vld;
  wire 				     ik2fifo_rdy;
  wire 				     ik2fifo_last;
  wire 				     fifo2sha_vld;
  reg 				     fifo2sha_rdy;
  wire 				     fifo2sha_last;
  
  wire [511:0] 	                     ik2fifo_data;
  wire [511:0] 			     shafifoout_data[NUM_SHA_UNITS-1:0];
  wire [511:0] 			     fifo2sha_data;
  wire [9:0] 			     fifo2sha_data_count;
  wire [9:0] 			     fifo2ik_data_count;
  wire 				     fifo2ik_last;
  wire [4:0] 			     shafifoout_data_count[NUM_SHA_UNITS-1:0];
  reg [255:0] 			     sha2fifo_data; 
  wire [255:0] 			     sha_digest[NUM_SHA_UNITS-1:0];
  wire [255:0] 			     fifo2ik_data;
  reg [NUM_SHA_UNITS-1:0] 	     sha_init;
  reg [NUM_SHA_UNITS-1:0] 	     sha_next;
  wire [NUM_SHA_UNITS-1:0] 	     sha_ready;
  wire [NUM_SHA_UNITS-1:0] 	     sha_valid;
  reg [NUM_SHA_UNITS-1:0]  	     sha_busy;
  reg [NUM_SHA_UNITS-1:0] 	     sha_last;
  reg [NUM_SHA_UNITS-1:0] 	     shafifoout_rdy;
  wire [NUM_SHA_UNITS-1:0] 	     shafifoout_last;
  wire [NUM_SHA_UNITS-1:0] 	     shafifoin_rdy;
  wire [NUM_SHA_UNITS-1:0] 	     shafifoout_vld;
  reg [NUM_SHA_UNITS-1:0] 	     sha_out_valid;
  reg [31:0] 			     shafifoin_vld;
  reg [31:0] 			     selected_sha_unit;
  reg [4:0] 			     sha_select;
  reg 				     selected_shafifo_free;
  reg 				     selected_sha_output_valid;
  
  reg [31:0]  sha_read_counter;
  reg 	      sha2fifo_input_vld;
  wire 	      sha2fifo_output_rdy;

  assign ik2sha_rdy = ik2fifo_rdy;
  assign ik2fifo_vld = ik2sha_vld;
  assign ik2fifo_data = ik2sha_data;
  assign ik2fifo_last = ik2sha_last;

  assign sha2ik_data = fifo2ik_data;
  assign sha2ik_vld = fifo2ik_vld;
  assign fifo2ik_rdy = sha2ik_rdy;


  // NUM_SHA_UNITS_wide multiplexers:
  always @(*) begin
    case (sha_select)
      5'd0: begin
	selected_shafifo_free = ~shafifoout_vld[0];
	selected_sha_unit = 32'b00000000000000000000000000000001;
      end
      5'd1: begin
	selected_shafifo_free = ~shafifoout_vld[1];
	selected_sha_unit = 32'b00000000000000000000000000000010;
      end
      5'd2: begin
	selected_shafifo_free = ~shafifoout_vld[2];
	selected_sha_unit = 32'b00000000000000000000000000000100;
      end
      5'd3: begin
	selected_shafifo_free = ~shafifoout_vld[3];
	selected_sha_unit = 32'b00000000000000000000000000001000;
      end
      5'd4: begin
	selected_shafifo_free = ~shafifoout_vld[4];
	selected_sha_unit = 32'b00000000000000000000000000010000;
      end
      5'd5: begin
	selected_shafifo_free = ~shafifoout_vld[5];
	selected_sha_unit = 32'b00000000000000000000000000100000;
      end
      5'd6: begin
	selected_shafifo_free = ~shafifoout_vld[6];
	selected_sha_unit = 32'b00000000000000000000000001000000;
      end
      5'd7: begin
	selected_shafifo_free = ~shafifoout_vld[7];
	selected_sha_unit = 32'b00000000000000000000000010000000;
      end
      5'd8: begin
	selected_shafifo_free = ~shafifoout_vld[8];
	selected_sha_unit = 32'b00000000000000000000000100000000;
      end
      5'd9: begin
	selected_shafifo_free = ~shafifoout_vld[9];
	selected_sha_unit = 32'b00000000000000000000001000000000;
      end
      5'd10: begin
	selected_shafifo_free = ~shafifoout_vld[10];
	selected_sha_unit = 32'b00000000000000000000010000000000;
      end
      5'd11: begin
	selected_shafifo_free = ~shafifoout_vld[11];
	selected_sha_unit = 32'b00000000000000000000100000000000;
      end
      5'd12: begin
	selected_shafifo_free = ~shafifoout_vld[12];
	selected_sha_unit = 32'b00000000000000000001000000000000;
      end
      5'd13: begin
	selected_shafifo_free = ~shafifoout_vld[13];
	selected_sha_unit = 32'b00000000000000000010000000000000;
      end
      5'd14: begin
	selected_shafifo_free = ~shafifoout_vld[14];
	selected_sha_unit = 32'b00000000000000000100000000000000;
      end
      5'd15: begin
	selected_shafifo_free = ~shafifoout_vld[15];
	selected_sha_unit = 32'b00000000000000001000000000000000;
      end
      5'd16: begin
	selected_shafifo_free = ~shafifoout_vld[16];
	selected_sha_unit = 32'b00000000000000010000000000000000;
      end
      5'd17: begin
	selected_shafifo_free = ~shafifoout_vld[17];
	selected_sha_unit = 32'b00000000000000100000000000000000;
      end
      5'd18: begin
	selected_shafifo_free = ~shafifoout_vld[18];
	selected_sha_unit = 32'b00000000000001000000000000000000;
      end
      5'd19: begin
	selected_shafifo_free = ~shafifoout_vld[19];
	selected_sha_unit = 32'b00000000000010000000000000000000;
      end
      5'd20: begin
	selected_shafifo_free = ~shafifoout_vld[20];
	selected_sha_unit = 32'b00000000000100000000000000000000;
      end
      5'd21: begin
	selected_shafifo_free = ~shafifoout_vld[21];
	selected_sha_unit = 32'b00000000001000000000000000000000;
      end
      5'd22: begin
	selected_shafifo_free = ~shafifoout_vld[22];
	selected_sha_unit = 32'b00000000010000000000000000000000;
      end
      5'd23: begin
	selected_shafifo_free = ~shafifoout_vld[23];
	selected_sha_unit = 32'b00000000100000000000000000000000;
      end
      5'd24: begin
	selected_shafifo_free = ~shafifoout_vld[24];
	selected_sha_unit = 32'b00000001000000000000000000000000;
      end
      5'd25: begin
	selected_shafifo_free = ~shafifoout_vld[25];
	selected_sha_unit = 32'b00000010000000000000000000000000;
      end
      5'd26: begin
	selected_shafifo_free = ~shafifoout_vld[26];
	selected_sha_unit = 32'b00000100000000000000000000000000;
      end
      5'd27: begin
	selected_shafifo_free = ~shafifoout_vld[27];
	selected_sha_unit = 32'b00001000000000000000000000000000;
      end
      5'd28: begin
	selected_shafifo_free = ~shafifoout_vld[28];
	selected_sha_unit = 32'b00010000000000000000000000000000;
      end
      5'd29: begin
	selected_shafifo_free = ~shafifoout_vld[29];
	selected_sha_unit = 32'b00100000000000000000000000000000;
      end
      5'd30: begin
	selected_shafifo_free = ~shafifoout_vld[30];
	selected_sha_unit = 32'b01000000000000000000000000000000;
      end
      5'd31: begin
	selected_shafifo_free = ~shafifoout_vld[31];
	selected_sha_unit = 32'b10000000000000000000000000000000;
      end
      
      default: begin
	selected_shafifo_free = ~shafifoout_vld[0];
	selected_sha_unit = 32'b00000000000000000000000000000001;
      end
    endcase
  end

  // sha output control
  // Selecting the next ready sha output, to be written to sha2fifo.  
  always @(*) begin
    case (sha_read_counter)
      32'b00000000000000000000000000000001: begin
	selected_sha_output_valid = sha_out_valid[0];
	sha2fifo_data = sha_digest[0];
      end
      32'b00000000000000000000000000000010: begin
	selected_sha_output_valid = sha_out_valid[1];
	sha2fifo_data = sha_digest[1];
      end
      32'b00000000000000000000000000000100: begin
	selected_sha_output_valid = sha_out_valid[2];
	sha2fifo_data = sha_digest[2];
      end
      32'b00000000000000000000000000001000: begin
	selected_sha_output_valid = sha_out_valid[3];
	sha2fifo_data = sha_digest[3];
      end
      32'b00000000000000000000000000010000: begin
	selected_sha_output_valid = sha_out_valid[4];
	sha2fifo_data = sha_digest[4];
      end
      32'b00000000000000000000000000100000: begin
	selected_sha_output_valid = sha_out_valid[5];
	sha2fifo_data = sha_digest[5];
      end
      32'b00000000000000000000000001000000: begin
	selected_sha_output_valid = sha_out_valid[6];
	sha2fifo_data = sha_digest[6];
      end
      32'b00000000000000000000000010000000: begin
	selected_sha_output_valid = sha_out_valid[7];
	sha2fifo_data = sha_digest[7];
      end
      32'b00000000000000000000000100000000: begin
	selected_sha_output_valid = sha_out_valid[8];
	sha2fifo_data = sha_digest[8];
      end
      32'b00000000000000000000001000000000: begin
	selected_sha_output_valid = sha_out_valid[9];
	sha2fifo_data = sha_digest[9];
      end
      32'b00000000000000000000010000000000: begin
	selected_sha_output_valid = sha_out_valid[10];
	sha2fifo_data = sha_digest[10];
      end
      32'b00000000000000000000100000000000: begin
	selected_sha_output_valid = sha_out_valid[11];
	sha2fifo_data = sha_digest[11];
      end
      32'b00000000000000000001000000000000: begin
	selected_sha_output_valid = sha_out_valid[12];
	sha2fifo_data = sha_digest[12];
      end
      32'b00000000000000000010000000000000: begin
	selected_sha_output_valid = sha_out_valid[13];
	sha2fifo_data = sha_digest[13];
      end
      32'b00000000000000000100000000000000: begin
	selected_sha_output_valid = sha_out_valid[14];
	sha2fifo_data = sha_digest[14];
      end
      32'b00000000000000001000000000000000: begin
	selected_sha_output_valid = sha_out_valid[15];
	sha2fifo_data = sha_digest[15];
      end
      32'b00000000000000010000000000000000: begin
	selected_sha_output_valid = sha_out_valid[16];
	sha2fifo_data = sha_digest[16];
      end
      32'b00000000000000100000000000000000: begin
	selected_sha_output_valid = sha_out_valid[17];
	sha2fifo_data = sha_digest[17];
      end
      32'b00000000000001000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[18];
	sha2fifo_data = sha_digest[18];
      end
      32'b00000000000010000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[19];
	sha2fifo_data = sha_digest[19];
      end
      32'b00000000000100000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[20];
	sha2fifo_data = sha_digest[20];
      end
      32'b00000000001000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[21];
	sha2fifo_data = sha_digest[21];
      end
      32'b00000000010000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[22];
	sha2fifo_data = sha_digest[22];
      end
      32'b00000000100000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[23];
	sha2fifo_data = sha_digest[23];
      end
      32'b00000001000000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[24];
	sha2fifo_data = sha_digest[24];
      end
      32'b00000010000000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[25];
	sha2fifo_data = sha_digest[25];
      end
      32'b00000100000000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[26];
	sha2fifo_data = sha_digest[26];
      end
      32'b00001000000000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[27];
	sha2fifo_data = sha_digest[27];
      end
      32'b00010000000000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[28];
	sha2fifo_data = sha_digest[28];
      end
      32'b00100000000000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[29];
	sha2fifo_data = sha_digest[29];
      end
      32'b01000000000000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[30];
	sha2fifo_data = sha_digest[30];
      end
      32'b10000000000000000000000000000000: begin
	selected_sha_output_valid = sha_out_valid[31];
	sha2fifo_data = sha_digest[31];
      end
      
      default: 
	begin
	selected_sha_output_valid = sha_out_valid[0];
	sha2fifo_data = sha_digest[0];
	end
    endcase
  end


  // sha output control
  // Selecting the next ready sha output, to be written to sha2fifo.  
  always @(posedge clk) begin
    if (reset) begin
      sha_read_counter <= 32'b00000000000000000000000000000001;
      sha2fifo_input_vld <= 0;
    end

    else begin
      if (selected_sha_output_valid & sha2fifo_output_rdy & ~sha2fifo_input_vld) begin
	  // next selected sha unit has a valid digest, and the output fifo has a room to accept it:
	  sha2fifo_input_vld <= 1'b1;
      end
      
      if (sha2fifo_input_vld) begin
	// Following the write to sha2fifo, update sha_read_counter to check next sha unit
	// Rotate left modulo NUM_SHA_UNITS
	if (sha_read_counter[NUM_SHA_UNITS-1])
	  sha_read_counter <= 32'b00000000000000000000000000000001;
	else
	  sha_read_counter <= sha_read_counter << 1;
	
	sha2fifo_input_vld <= 1'b0;
      end
    end
  end
  

  // sha input fifo (512 x 512 bit, constructed of two 256bit fifos connected in parallel):
  axis_512x512b_fifo ik2sha_fifo (
  .s_aclk(clk),                                                         // input wire s_aclk
  .s_aresetn(~reset),                                                   // input wire s_aresetn
  .s_axis_tvalid(ik2fifo_vld),                                          // input wire s_axis_tvalid
  .s_axis_tready(ik2fifo_rdy),                                          // output wire s_axis_tready
  .s_axis_tdata(ik2fifo_data),                                          // input wire [511 : 0] s_axis_tdata
  .s_axis_tlast(ik2fifo_last),                                          // input wire s_axis_tlast
  .m_axis_tvalid(fifo2sha_vld),                                         // output wire m_axis_tvalid
  .m_axis_tready(fifo2sha_rdy),                                         // input wire m_axis_tready
  .m_axis_tdata(fifo2sha_data),                                         // output wire [511 : 0] m_axis_tdata
  .m_axis_tlast(fifo2sha_last),                                         // output wire m_axis_tlast
  .axis_data_count(fifo2sha_data_count)                                 // output wire [9 : 0] axis_data_count
);

  // sha results (digests) 512 x 256bit fifo:
  axis_512x256b_fifo sha2ik_fifo (
    .s_aclk(clk),                                                 // input wire s_aclk
    .s_aresetn(~reset),                                           // input wire s_aresetn
    .s_axis_tvalid(sha2fifo_input_vld),                          // input wire s_axis_tvalid
    .s_axis_tready(sha2fifo_output_rdy),                          // output wire s_axis_tready
    .s_axis_tdata(sha2fifo_data),                                 // input wire [255 : 0] s_axis_tdata
    .s_axis_tlast(1'b1),                                          // input wire s_axis_tlast
    .m_axis_tvalid(fifo2ik_vld),                                  // output wire m_axis_tvalid
    .m_axis_tready(fifo2ik_rdy),                                  // input wire m_axis_tready
    .m_axis_tdata(fifo2ik_data),                                  // output wire [255 : 0] m_axis_tdata
    .m_axis_tlast(fifo2ik_last),                                  // output wire m_axis_tlast
    .axis_data_count(fifo2ik_data_count)                          // output wire [9 : 0] axis_data_count
  );

// sha units control state machine: Controlling the digest calculation per each sha unit.
localparam
  SHA_IDLE = 3'd0,
  SHA_READ_FIRST = 3'd1,
  SHA_WAIT_NEXT = 3'd2,
  SHA_READ_NEXT = 3'd3,
  SHA_READ_REST = 3'd4,
  SHA_WAIT_OUTPUT_VALID = 3'd5,
  SHA_WAIT_OUTPUT_READ = 3'd6;
 
  reg [2:0]   sha_state[NUM_SHA_UNITS-1:0];


// sha2fifo state machine: Reading sha units result to output fifo
localparam
  FIFO2SHA_IDLE = 3'd0,
  FIFO2SHA_WAIT_NEXT_BLOCK = 3'd1,
  FIFO2SHA_READ_NEXT_BLOCK = 3'd2,
  FIFO2SHA_READ_REST = 3'd3,
  FIFO2SHA_LAST_BLOCK = 3'd4;
  
  reg [2:0]   fifo2sha_state;


// Input fifo to sha_fifo state machine 
// ====================================
// Transferring a complete packet from input fifo to the selected sha fifo.
// The packet transfer begins only if the target sha fifo is empty, to avoid any confusion with possibly previous sha calculation 
//
  always @(posedge clk) begin
    if (reset) begin
      fifo2sha_state <= FIFO2SHA_IDLE;
      sha_select <= 4'h0000;
      shafifoin_vld <= 32'h0000;
    end
    else begin
      case (fifo2sha_state)
        FIFO2SHA_IDLE: begin
	  fifo2sha_rdy <= 1'b0;
	  shafifoin_vld <= 32'h0000;
	  
          if (fifo2sha_vld & selected_shafifo_free) begin
            fifo2sha_state <= FIFO2SHA_READ_NEXT_BLOCK;
	  end
	  
	  else 
            fifo2sha_state <= FIFO2SHA_IDLE;
	end
	
        FIFO2SHA_LAST_BLOCK: begin
	  fifo2sha_rdy <= 1'b0;
	  shafifoin_vld <= 32'h0000;

	  // Packet transfer is ended: Select next sha unit
          fifo2sha_state <= FIFO2SHA_IDLE;
	  if (sha_select < NUM_SHA_UNITS-1)
	    sha_select <= sha_select + 5'b00001;
	  else 
	    sha_select <= 5'b00000;
	end
	
        FIFO2SHA_READ_NEXT_BLOCK: begin
	  fifo2sha_rdy <= 1'b1;
	  shafifoin_vld <= selected_sha_unit;
          fifo2sha_state <= FIFO2SHA_READ_REST;
//          fifo2sha_lastQ <= fifo2sha_last;
	end
	
        FIFO2SHA_READ_REST: begin
	  fifo2sha_rdy <= 1'b0;
	  shafifoin_vld <= 32'h0000;

          if (fifo2sha_last)
            fifo2sha_state <= FIFO2SHA_LAST_BLOCK;
	  else
            fifo2sha_state <= FIFO2SHA_WAIT_NEXT_BLOCK;
	end
	
        FIFO2SHA_WAIT_NEXT_BLOCK: begin 

          if (fifo2sha_vld)
            fifo2sha_state <= FIFO2SHA_READ_NEXT_BLOCK;
          else
            fifo2sha_state <= FIFO2SHA_WAIT_NEXT_BLOCK;
	end
	
	default: begin
          fifo2sha_state <= FIFO2SHA_IDLE;
	  fifo2sha_rdy <= 1'b0;
	  shafifoin_vld <= 32'h0000;
	end
	
      endcase
    end
  end


generate
genvar j;

for (j = 0; j < NUM_SHA_UNITS ; j = j + 1) begin: sha_id

  // Per sha input fifo
  // For sha unit j, in a multi-block case, all blocks are loaded to fifo, before proceeding to next sha unit
  // Notice that despite its short depth (16 entries only) this fifo still consumes 8 (!!!) 36kb BRAMs
  axis_16x512b_fifo sha_fifo (
    .s_aclk(clk),                               // input wire s_aclk
    .s_aresetn(~reset),                         // input wire s_aresetn
    .s_axis_tvalid(shafifoin_vld[j]),           // input wire s_axis_tvalid
    .s_axis_tready(shafifoin_rdy[j]),           // output wire s_axis_tready
    .s_axis_tdata(fifo2sha_data),               // input wire [511 : 0] s_axis_tdata
    .s_axis_tlast(fifo2sha_last),               // input wire s_axis_tlast
    .m_axis_tvalid(shafifoout_vld[j]),          // output wire m_axis_tvalid
    .m_axis_tready(shafifoout_rdy[j]),         // input wire m_axis_tready
    .m_axis_tdata(shafifoout_data[j]),          // output wire [511 : 0] m_axis_tdata
    .m_axis_tlast(shafifoout_last[j]),          // output wire m_axis_tlast
    .axis_data_count(shafifoout_data_count[j])  // output wire [4 : 0] axis_data_count
  );

  
  // fifo to sha units state machines
  // ================================
  //
  // Separate state machine per each defployed sha unit
  // Each SM will load next block to the sha unit, once that unit is free, until tlast reached
  //
  always @(posedge clk) begin
    if (reset) begin
      sha_state[j] <= SHA_IDLE;
      sha_init[j] <= 1'b0;
      sha_next[j] <= 1'b0;
      sha_last[j] <= 1'b0;
      sha_busy[j] <= 1'b0;
      shafifoout_rdy[j]  <= 1'b0;
      sha_out_valid[j] <= 1'b0;
    end

    else begin
      case (sha_state[j])
        SHA_IDLE: begin
	  sha_init[j] <= 1'b0;
	  sha_next[j] <= 1'b0;
	  sha_busy[j] <= 1'b0;
	  shafifoout_rdy[j]  <= 1'b0;

          if (shafifoout_vld[j] & ~sha_busy[j]) begin
            sha_state[j] <= SHA_READ_FIRST;
	  end
	  else 
            sha_state[j] <= SHA_IDLE;
	end
	
        SHA_READ_FIRST: begin
	  sha_busy[j] <= 1'b1;
	  sha_init[j] <= 1'b1;
	  shafifoout_rdy[j]  <= 1'b1;
	  sha_last[j] <= shafifoout_last[j];
          sha_state[j] <= SHA_READ_REST;
	end
	
        SHA_READ_REST: begin 
	  sha_init[j] <= 1'b0;
	  sha_next[j] <= 1'b0;
	  shafifoout_rdy[j] <= 1'b0;
          sha_state[j] <= SHA_WAIT_OUTPUT_VALID;
	end

        SHA_WAIT_NEXT: begin 
          if (shafifoout_vld[j])
            sha_state[j] <= SHA_READ_NEXT;
          else
            sha_state[j] <= SHA_WAIT_NEXT;
	end
	
        SHA_READ_NEXT: begin
	  sha_next[j] <= 1'b1;
	  shafifoout_rdy[j]  <= 1'b1;
	  sha_last[j] <= shafifoout_last[j];
          sha_state[j] <= SHA_READ_REST;
	end
	
	SHA_WAIT_OUTPUT_VALID: begin
          if (sha_ready[j]) begin
            if (sha_last[j]) begin
	      // This is the last block (of single or multiple blocks digest operation). 
	      // Prepare for reading the result to output fifo
              sha_state[j] <= SHA_WAIT_OUTPUT_READ;
	      sha_out_valid[j] <= 1'b1;
	    end
            else
	      // Not the last block... Goto digesting next block
              sha_state[j] <= SHA_WAIT_NEXT;
	  end
            else
              sha_state[j] <= SHA_WAIT_OUTPUT_VALID;
	end
	
	SHA_WAIT_OUTPUT_READ: begin
          if (sha2fifo_input_vld & sha_read_counter[j]) begin
	    // Jth sha unit output is being read to output fifo
	    // Turn off the Jth output valid indicator
	    sha_out_valid[j] <= 1'b0;
            sha_busy[j] <= 1'b0;
            sha_state[j] <= SHA_IDLE;
	  end
          else
            sha_state[j] <= SHA_WAIT_OUTPUT_READ;
	end

	default: begin
          sha_state[j] <= SHA_IDLE;
	end
      endcase
    end
  end

  
  sha256_core sha256_core (
			   .clk(clk),
			   .reset_n(~reset),
			   .init(sha_init[j]),
			   .next(sha_next[j]),
			   .mode(1'b1), // set mode to sha256
			   .block(shafifoout_data[j]),    
			   .ready(sha_ready[j]),
			   .digest(sha_digest[j]),
			   .digest_valid(sha_valid[j])
			   );

end
endgenerate	

endmodule
