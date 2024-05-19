// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

//-----------------------------------------------------
// Design Name : A Scalable FSM with 2^STATE_BITS states
// File Name   : scalable_fsm.v
// Function    : A behavorial model of scalable FSM
//             : to detect SEQ_STR sequence
//
// Coder       : Usman Ali
//-----------------------------------------------------

module scalable_seq_detector  #(
  parameter STATE_BITS = 3
)
(
  input wire clock0,
  input wire reset,
  input wire x,
  input wire [2**STATE_BITS-1:0] sequence_str,
  output wire   [STATE_BITS-1:0] curr_state_p,
  output wire start, mid, stop, first_half, second_half,
  output wire [31:0] msg
);
// initializations
  wire [STATE_BITS-1:0]   next_state  [2**STATE_BITS-1:0];
  wire [STATE_BITS-1:0]   final_next_state;
  reg  [STATE_BITS-1:0]   curr_state;
  assign curr_state_p = curr_state;
  genvar i;

// state transitions
  always@(posedge clock0, posedge reset) begin
      if(reset)
          curr_state <= 0; // reset state
      else
          curr_state <= final_next_state;
  end

// next states logic
  generate
    for(i=0; i<2**STATE_BITS; i=i+1)
      assign next_state[i] = (x==sequence_str[i] && i!=2**STATE_BITS-1)? (i+1): 0;
  endgenerate
  assign final_next_state = next_state[curr_state];

// ouput logics
  assign start= (curr_state == 0);
  assign stop = (curr_state == (2**STATE_BITS-1));
  assign mid  = (curr_state == ((2**STATE_BITS)>>1));
  assign first_half  = (curr_state < ((2**STATE_BITS)>>1));
  assign second_half = (curr_state > ((2**STATE_BITS)>>1));
  assign msg  = start?       {8'd115,8'd116,8'd097,8'd116} // ascii for start
              : stop?        {8'd115,8'd116,8'd111,8'd112} // ascii for stop
              : mid?         {8'd109,8'd105,8'd100,8'd046} // ascii for mid.
              : first_half?  {8'd049,8'd115,8'd116,8'd104} // ascii for 1sth
              : second_half? {8'd050,8'd110,8'd100,8'd104} // ascii for 2ndh
              :              {8'd101,8'd114,8'd111,8'd114};// ascii for eror

`ifdef COCOTB_SIM
initial begin
  $dumpfile ("waves.vcd");
  $dumpvars (0, scalable_seq_detector);
  #1;
end
`endif

endmodule
