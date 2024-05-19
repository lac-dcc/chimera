// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module calculator (
    input       clock,
    input       reset,
    input       enter,
    input       add,
    input       multiply,
    input [7:0] data,

    output        newresult,
    output [15:0] result,
    output        overflow,
    output [ 3:0] error
);
  assign error = 0;

  reg  [15:0] alu_a;
  reg  [15:0] alu_b;
  reg         alu_multiply;
  wire [15:0] alu_result;
  wire        alu_overflow;

  alu alu (
      .a       (alu_a),
      .b       (alu_b),
      .multiply(alu_multiply),
      .result  (alu_result),
      .overflow(alu_overflow)
  );

  reg r_overflow;
  assign overflow = r_overflow;

  always @(posedge clock) begin
    if (reset) r_overflow <= 0;
    else       r_overflow <= alu_overflow;
  end

  reg         stack_push;
  reg         stack_pop;
  reg [15:0]  stack_write_data;
  wire [15:0] stack_read_data;

  stack stack (
      .clock     (clock),
      .reset     (reset),
      .push      (stack_push),
      .pop       (stack_pop),
      .write_data(stack_write_data),
      .read_data (stack_read_data)
  );


  reg [15:0] r_alu_a;
  reg [15:0] r_alu_b;
  reg        r_alu_multiply;
  reg [1:0]  state;

  reg [1:0] next_state;

  reg [15:0] oldresult = 0;
  assign result    = stack_read_data;
  assign newresult = (result != oldresult) && state == 0;

  always @(*) begin
    alu_a = r_alu_a;
    alu_b = r_alu_b;
    alu_multiply = r_alu_multiply;
    stack_push = 0;
    stack_pop  = 0;
    stack_write_data = data;
    next_state = state;

    case (state)
      0:
      if (enter) begin
        stack_push = 1;
        stack_write_data = data;
      end else if (add | multiply) begin
        alu_a = stack_read_data;
        alu_multiply = multiply;

        stack_pop  = 1;
        next_state = 1;
      end

      1: begin
        alu_b = stack_read_data;
        stack_pop  = 1;
        next_state = 2;
      end

      2: begin
        stack_push = 1;
        stack_write_data = alu_result;
        next_state = 0;
      end

    endcase
  end

  always @(posedge clock) begin
    if (reset) begin
      r_alu_a <= 0;
      r_alu_b <= 0;
      r_alu_multiply <= 0;
      state   <= 0;
      oldresult <= 0;
    end else begin
      r_alu_a <= alu_a;
      r_alu_b <= alu_b;
      r_alu_multiply <= alu_multiply;
      state <= next_state;
      oldresult <= result;
    end
  end

endmodule
