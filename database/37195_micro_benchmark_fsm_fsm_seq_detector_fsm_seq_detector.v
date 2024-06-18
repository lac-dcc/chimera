// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

//-----------------------------------------------------
// Design Name : A FSM to detect given sequence
// File Name   : scalable_fsm.v
// Function    : A behavorial model of FSM
//             : to detect SEQ_STR sequence
//
// Coder       : Usman Ali
//-----------------------------------------------------

module fsm_seq_detector
(
  input wire clock0,
  input wire reset,
  input wire seq_in,
  input wire [7:0] expected_seq,
  output wire [2:0] curr_state_p,
  output reg seq_detected
);
  localparam S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7;
  reg  [2:0]   next_state, curr_state;
  reg seq_detected_next;
  assign curr_state_p = curr_state;
// state transitions
  always@(posedge clock0, posedge reset) begin
    if(reset) begin
      curr_state <= S0; // reset state
      seq_detected <= 0;
    end
    else begin
      curr_state <= next_state;
      seq_detected <= seq_detected_next;
    end
  end

// next states logic
  always @(curr_state, seq_in)
  begin
    // store current state as next
    next_state = S0; // required: when no case statement is satisfied
    seq_detected_next = 0;
    case(curr_state)
      S0: // if state is zero
        if(seq_in == expected_seq[0]) // sequence item is correct
          next_state = S1; // then go to next state.
      S1: // if state is one
        if(seq_in == expected_seq[1]) // sequence item is correct
          next_state = S2; // then go to next state.
      S2: // if state is two
        if(seq_in == expected_seq[2]) // sequence item is correct
          next_state = S3; // then go to next state.
      S3: // if state is three
        if(seq_in == expected_seq[3]) // sequence item is correct
          next_state = S4; // then go to next state.
      S4: // if state is four
        if(seq_in == expected_seq[4]) // sequence item is correct
          next_state = S5; // then go to next state.
      S5: // if state is five
        if(seq_in == expected_seq[5]) // sequence item is correct
          next_state = S6; // then go to next state.
      S6: // if state is six
        if(seq_in == expected_seq[6]) // sequence item is correct
          next_state = S7; // then go to next state.
      S7: // if state is seven
        if(seq_in == expected_seq[7]) begin // sequence item is correct
          next_state = S0; // then go to next state.
          seq_detected_next = 1;
        end     
    endcase
  end

`ifdef COCOTB_SIM
initial begin
  $dumpfile ("waves.vcd");
  $dumpvars (0, fsm_seq_detector);
  #1;
end
`endif

endmodule
