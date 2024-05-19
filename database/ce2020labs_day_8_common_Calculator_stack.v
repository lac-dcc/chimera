// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "defines.vh"

module stack (
    input clock,
    input reset,
    input push,
    input pop,

    input  [`word_width - 1:0] write_data,
    output [`word_width - 1:0] read_data
);

  reg [`word_width - 1:0] stack[0:`stack_size - 1];

  reg [`stack_pointer_size - 1:0] stack_pointer;

  assign read_data = stack[stack_pointer];

  integer i;

  always @(posedge clock) begin
    if (reset) begin
      stack_pointer <= 0;
      for (i = 0; i < `stack_size; i = i + 1) stack[i] <= 0;
    end else if (push) begin
      if (stack_pointer == `stack_size - 1) begin
        stack[0]      <= write_data;
        stack_pointer <= 0;
      end else begin
        stack[stack_pointer + 1] <= write_data;
        stack_pointer            <= stack_pointer + 1;
      end
    end else if (pop) begin
      stack[stack_pointer] <= 0;
      if (stack_pointer == 0) stack_pointer <= `stack_size - 1;
      else                    stack_pointer <= stack_pointer - 1;
    end
  end

endmodule
