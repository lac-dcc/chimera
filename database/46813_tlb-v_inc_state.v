// This program was cloned from: https://github.com/Naminar/tlb-v
// License: MIT License

`ifndef STATE_V
`define STATE_V

//state ranege
`define STATE_R 5:0
`define STATE                       \
parameter state_waiting = 6'b000000;\
parameter state_req     = 6'b000001;\
parameter state_miss    = 6'b000010;\
parameter state_insert  = 6'b000100;\
parameter state_shutdown= 6'b001000;\
parameter state_push    = 6'b010000;\
parameter state_validate= 6'b100000;
// parameter state_write   = 3'b011;\

`endif // STATE_V