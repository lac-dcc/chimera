// onchip htif excepts a trimmed down version of the htif
//
// ORIGINAL FORMAT
// REQUEST
//  cmd: 16 bits
//  seqno: 16 bits
//  sz: 32 bits
//  addr: 64 bits
//  data: 0 bits / 64 bits (cr writes) / 128 bits (memory writes)
// RESPONSE
//  cmd: 16 bits
//  seqno: 16 bits
//  sz: 32 bits
//  addr: 64 bits
//  data: 0 bits / 64 bits (cr reads) / 128 bits (memory reads)
// REQUEST SIZE BY COMMAND
//  read_mem:  16 + 16 + 32 + 64 + 0   = 128 bits = 32 4-bit words
//  write_mem: 16 + 16 + 32 + 64 + 128 = 256 bits = 64 4-bit words
//  read_cr:   16 + 16 + 32 + 64 + 0   = 128 bits = 32 4-bit words
//  write_cr:  16 + 16 + 32 + 64 + 64  = 192 bits = 48 4-bit words
//  start:     16 + 16 + 32 + 64 + 0   = 128 btis = 32 4-bit words
//  stop:      16 + 16 + 32 + 64 + 0   = 128 bits = 32 4-bit words
// RESPONSE SIZE BY COMMAND
//  read_mem:  16 + 16 + 32 + 64 + 128 = 256 bits = 64 4-bit words
//  write_mem: 16 + 16 + 32 + 0  + 0   = 64  bits = 16 4-bit words
//  read_cr:   16 + 16 + 32 + 64 + 64  = 192 bits = 48 4-bit words
//  write_cr:  16 + 16 + 32 + 0  + 0   = 64  bits = 16 4-bit words
//  start:     16 + 16 + 32 + 0  + 0   = 64  bits = 16 4-bit words
//  stop:      16 + 16 + 32 + 0  + 0   = 64  bits = 16 4-bit words
//
// CHIP FORMAT
// REQUEST
//  cmd: 8 bits
//  addr: 32 bits
//  data: 0 bits / 32 bits (cr writes) / 128 bits (memory writes)
// RESPONSE
//  cmd: 8 bits
//  data: 0 bits / 32 bits (cr reads) / 128 bits (memory reads)
// REQUEST SIZE BY COMMAND
//  read_mem:  8 + 32 + 0   = 40  bits = 10 4-bit words
//  write_mem: 8 + 32 + 128 = 168 bits = 42 4-bit words
//  read_cr:   8 + 32 + 0   = 40  bits = 10 4-bit words
//  write_cr:  8 + 32 + 32  = 72  bits = 18 4-bit words
//  start:     8 + 32 + 0   = 40  bits = 10 4-bit words
//  stop:      8 + 0  + 0   = 8   bits = 2  4-bit words
// RESPONSE SIZE BY COMMAND
//  read_mem:  8 + 128 = 136 bits = 34 4-bit words
//  write_mem: 8 + 0   = 8   bits = 2  4-bit words
//  read_cr:   8 + 32  = 40  bits = 10 4-bit words
//  write_cr:  8 + 0   = 8   bits = 2  4-bit words
//  start:     8 + 0   = 8   bits = 2  4-bit words
//  stop:      8 + 0   = 8   bits = 2  4-bit words
//
// strategy
// (1) need to remember which request the fpga did, so that you know how many
// bytes you are expecting from the chip
// (2) save the seqno, since the chip is not going to give that information
// 

`define IN_BETWEEN(v, l, r) ((l <= v) && (v <= r))
`define IN_BETWEEN2(v, l, r) ((l <= v) && (v < r))

module HTIFChipAdapter
(
  input clk,
  input reset,

  input htif_req_4bit_val,
  input [3:0] htif_req_4bit_bits,
  output htif_req_4bit_rdy,

  output htif_req_4bit_clkcpu_val,
  output [3:0] htif_req_4bit_clkcpu_bits,
  input htif_req_4bit_clkcpu_rdy,

  input htif_resp_4bit_clkcpu_val,
  input [3:0] htif_resp_4bit_clkcpu_bits,
  output htif_resp_4bit_clkcpu_rdy,

  output htif_resp_4bit_val,
  output [3:0] htif_resp_4bit_bits,
  input htif_resp_4bit_rdy
);

  localparam cmd_read_mem = 4'd0;
  localparam cmd_write_mem = 4'd1;
  localparam cmd_read_cr = 4'd2;
  localparam cmd_write_cr = 4'd3;
  localparam cmd_start = 4'd4;
  localparam cmd_stop = 4'd5;

  localparam state_idle = 4'd0;
  localparam state_req_read_mem = 4'd1;
  localparam state_req_write_mem = 4'd2;
  localparam state_req_read_cr = 4'd3;
  localparam state_req_write_cr = 4'd4;
  localparam state_req_start = 4'd5;
  localparam state_req_stop = 4'd6;
  localparam state_resp_ack_0 = 4'd7;
  localparam state_resp_ack_32 = 4'd8;
  localparam state_resp_ack_128 = 4'd9;

  reg [3:0] reg_state, next_state;
  reg [6:0] reg_req_cnt_expect, next_req_cnt_expect;
  reg [6:0] reg_resp_cnt_expect, next_resp_cnt_expect;
  reg [6:0] reg_req_cnt, next_req_cnt;
  reg [6:0] reg_resp_cnt, next_resp_cnt;
  reg [15:0] reg_seqno;

  wire htif_req_relay;
  wire htif_resp_relay;
  wire state_req = `IN_BETWEEN(reg_state, state_req_read_mem, state_req_stop);
  wire state_resp = `IN_BETWEEN(reg_state, state_resp_ack_0, state_resp_ack_128);

  always @(posedge clk)
  begin
    if (reset)
    begin
      reg_state <= state_idle;
      reg_req_cnt_expect <= 7'd0;
      reg_resp_cnt_expect <= 7'd0;
      reg_req_cnt <= 7'd0;
      reg_resp_cnt <= 7'd0;
      reg_seqno <= 16'd0;
    end
    else
    begin
      reg_state <= next_state;
      reg_req_cnt_expect <= next_req_cnt_expect;
      reg_resp_cnt_expect <= next_resp_cnt_expect;
      reg_req_cnt <= next_req_cnt;
      reg_resp_cnt <= next_resp_cnt;

      if (reg_req_cnt == 7'd4)
        reg_seqno[3:0] <= htif_req_4bit_bits;
      if (reg_req_cnt == 7'd5)
        reg_seqno[7:4] <= htif_req_4bit_bits;
      if (reg_req_cnt == 7'd6)
        reg_seqno[11:8] <= htif_req_4bit_bits;
      if (reg_req_cnt == 7'd7)
        reg_seqno[15:12] <= htif_req_4bit_bits;
    end
  end

  always @(*)
  begin
    next_state = reg_state;
    next_req_cnt_expect = reg_req_cnt_expect;
    next_resp_cnt_expect = reg_resp_cnt_expect;
    next_req_cnt = reg_req_cnt;
    next_resp_cnt = reg_resp_cnt;

    // if in an idle state and htif_req_4bit_val is high
    // then parse command
    // set req, resp expect counters, and reset counters to zero
    if (reg_state == state_idle && htif_req_4bit_val)
    begin
      case (htif_req_4bit_bits)

      cmd_read_mem:
        begin
          next_state = state_req_read_mem;
          next_req_cnt_expect = 7'd32;
          next_resp_cnt_expect = 7'd64;
          next_req_cnt = 7'd0;
          next_resp_cnt = 7'd0;
        end

      cmd_write_mem:
        begin
          next_state = state_req_write_mem;
          next_req_cnt_expect = 7'd64;
          next_resp_cnt_expect = 7'd16;
          next_req_cnt = 7'd0;
          next_resp_cnt = 7'd0;
        end

      cmd_read_cr:
        begin
          next_state = state_req_read_cr;
          next_req_cnt_expect = 7'd32;
          next_resp_cnt_expect = 7'd48;
          next_req_cnt = 7'd0;
          next_resp_cnt = 7'd0;
        end

      cmd_write_cr:
        begin
          next_state = state_req_write_cr;
          next_req_cnt_expect = 7'd48;
          next_resp_cnt_expect = 7'd16;
          next_req_cnt = 7'd0;
          next_resp_cnt = 7'd0;
        end

      cmd_start:
        begin
          next_state = state_req_start;
          next_req_cnt_expect = 7'd32;
          next_resp_cnt_expect = 7'd16;
          next_req_cnt = 7'd0;
          next_resp_cnt = 7'd0;
        end

      cmd_stop:
        begin
          next_state = state_req_stop;
          next_req_cnt_expect = 7'd32;
          next_resp_cnt_expect = 7'd16;
          next_req_cnt = 7'd0;
          next_resp_cnt = 7'd0;
        end

      endcase
    end

    // if in a request state
    if (state_req)
    begin
      // if there exist stuff to send
      if (reg_req_cnt != reg_req_cnt_expect)
      begin
        // if the output can take the token
        // bump the req_cnt pointer
        if (htif_req_4bit_rdy && htif_req_4bit_val)
        begin
          next_req_cnt = reg_req_cnt + 1'b1;
        end
      end
      else // now ready to change to response state
      begin
        case (reg_state)
        state_req_read_mem: next_state = state_resp_ack_128;
        state_req_write_mem: next_state = state_resp_ack_0;
        state_req_read_cr: next_state = state_resp_ack_32;
        state_req_write_cr: next_state = state_resp_ack_0;
        state_req_start: next_state = state_resp_ack_0;
        state_req_stop: next_state = state_resp_ack_0;
        endcase
      end
    end

    // if in a response state
    if (state_resp)
    begin
      // if there exist stuff to send
      if (reg_resp_cnt != reg_resp_cnt_expect)
      begin
        if (htif_resp_4bit_rdy && htif_resp_4bit_val)
        begin
          next_resp_cnt = reg_resp_cnt + 1'b1;
        end
      end
      else // now ready to go back to idle state
      begin
        next_state = state_idle;
      end
    end
  end

  assign htif_req_relay =
      (reg_req_cnt == 7'd0) | (reg_req_cnt == 7'd1) // cmd
    | (`IN_BETWEEN(reg_state, state_req_read_mem,  state_req_start) & `IN_BETWEEN2(reg_req_cnt, 7'd16, 7'd24)) // addr
    | (reg_state == state_req_write_mem & `IN_BETWEEN2(reg_req_cnt, 7'd32, 7'd64)) // memory write
    | (reg_state == state_req_write_cr & `IN_BETWEEN2(reg_req_cnt, 7'd32, 7'd40)) // cr write
    ;

  assign htif_req_4bit_rdy = state_req & (reg_req_cnt < reg_req_cnt_expect) & (~htif_req_relay | htif_req_4bit_clkcpu_rdy);
  assign htif_req_4bit_clkcpu_val = state_req & (reg_req_cnt < reg_req_cnt_expect) & htif_req_4bit_val & htif_req_relay;
  assign htif_req_4bit_clkcpu_bits = htif_req_4bit_bits;

  assign htif_resp_relay =
      (reg_resp_cnt == 7'd0) | (reg_resp_cnt == 7'd1) // cmd
    | (reg_state == state_resp_ack_128 && `IN_BETWEEN2(reg_resp_cnt, 7'd32, 7'd64)) // memory read
    | (reg_state == state_resp_ack_32 && `IN_BETWEEN2(reg_resp_cnt, 7'd32, 7'd40)) // cr read
    ;

  wire [5:0] resp_sz = reg_resp_cnt_expect[6:1] - 6'd8; // shave off cmd+seqno+sz

  assign htif_resp_4bit_clkcpu_rdy = state_resp & (reg_resp_cnt < reg_resp_cnt_expect) & htif_resp_4bit_rdy & htif_resp_relay;
  assign htif_resp_4bit_val = state_resp & (reg_resp_cnt < reg_resp_cnt_expect) & (~htif_resp_relay | htif_resp_4bit_clkcpu_val);
  assign htif_resp_4bit_bits
    = (reg_resp_cnt == 7'd0 || reg_resp_cnt == 7'd1) ? htif_resp_4bit_clkcpu_bits // cmd
    : (reg_resp_cnt == 7'd2 || reg_resp_cnt == 7'd3) ? 4'd0 // cmd
    : (reg_resp_cnt == 7'd4) ? reg_seqno[3:0] // seqno
    : (reg_resp_cnt == 7'd5) ? reg_seqno[7:4] // seqno
    : (reg_resp_cnt == 7'd6) ? reg_seqno[11:8] // seqno
    : (reg_resp_cnt == 7'd7) ? reg_seqno[15:12] // seqno
    : (reg_resp_cnt == 7'd8) ? resp_sz[3:0] // size
    : (reg_resp_cnt == 7'd9) ? {2'd0, resp_sz[5:4]} // size
    : (`IN_BETWEEN(reg_resp_cnt, 7'd10, 7'd16)) ? 4'd0 // size
    : (reg_state == state_resp_ack_128 && `IN_BETWEEN2(reg_resp_cnt, 7'd17, 7'd32)) ? 4'd0 // addr
    : (reg_state == state_resp_ack_128 && `IN_BETWEEN2(reg_resp_cnt, 7'd32, 7'd64)) ? htif_resp_4bit_clkcpu_bits // payload
    : (reg_state == state_resp_ack_32 && `IN_BETWEEN2(reg_resp_cnt, 7'd17, 7'd32)) ? 4'd0 // addr
    : (reg_state == state_resp_ack_32 && `IN_BETWEEN2(reg_resp_cnt, 7'd32, 7'd40)) ? htif_resp_4bit_clkcpu_bits // payload
    : (reg_state == state_resp_ack_32 && `IN_BETWEEN2(reg_resp_cnt, 7'd40, 7'd48)) ? 4'd0 // payload
    : 4'hF; // default output

endmodule
