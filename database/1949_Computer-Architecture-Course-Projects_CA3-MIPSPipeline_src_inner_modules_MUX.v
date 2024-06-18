// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

//instantiation guide:
//  MUX (.mux_in({0th mem_element, 1th mem_element, ..., (n-1)th mem_element}),
//    .sel(select_signal),
//    .mux_out(output_signal));

module MUX (
    mux_in,
    sel,
    mux_out
);
  parameter word_len = 8;
  parameter input_size = 4;
  parameter sel_len = 2;

  input [(word_len)*input_size - 1 : 0] mux_in;
  input [sel_len - 1 : 0] sel;
  output reg [word_len - 1 : 0] mux_out;

  integer i, j;
  integer word_begin;
  always @(mux_in or sel) begin
    mux_out <= 'bx;
    for (i = 0; i < 2 ** sel_len; i = i + 1'b1) begin
      if (i == sel) begin
        word_begin = word_len * (input_size - 1) - i * word_len;
        for (j = 0; j < word_len; j = j + 1) mux_out[j] <= mux_in[word_begin+j];
      end
    end
  end

endmodule
