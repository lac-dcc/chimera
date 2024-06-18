// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module mux_16x1 (
  input wire [15:0] data_inputs,
  input wire [3:0] select_lines,
  output wire mux_output
);

  wire [7:0] intermediate_outputs [0:15];

  genvar i;
  generate
    for (i = 0; i < 16; i = i + 1) begin
      assign intermediate_outputs[i] = (select_lines == i) ? data_inputs[i] : 0;
    end
  endgenerate

  genvar j;
  generate
    for (j = 0; j < 8; j = j + 1) begin
      assign intermediate_outputs[j] = (select_lines[1:0] == j) ? intermediate_outputs[j*2+1] :
      intermediate_outputs[j*2];
    end
  endgenerate

  genvar k;
  generate
    for (k = 0; k < 4; k = k + 1) begin
      assign intermediate_outputs[k] = (select_lines[2:1] == k) ? intermediate_outputs[k*2+1] : intermediate_outputs[k*2];
    end
  endgenerate

  assign mux_output = (select_lines[3:2] == 0) ? intermediate_outputs[0] : intermediate_outputs[1];

endmodule

