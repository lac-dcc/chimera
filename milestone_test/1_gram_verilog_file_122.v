// Seed: 2796234162
`timescale 1 ps / 1ps
module module_0 (
    output id_1,
    output id_2,
    input  id_3
);
  initial
    if (id_2) @(negedge 1) id_1 <= 1;
    else @(posedge id_2 or 1) @(negedge 1 && 1);
  reg   id_4;
  reg   id_5;
  logic id_6;
  always id_3 = id_5;
  assign id_4 = 1'h0;
  assign id_5 = id_4;
  rtran (.id_0(), .id_1(id_5));
  always
    if (id_1) id_2 <= id_6 - 1 == id_6;
    else begin
      begin
        #1 for (id_2 = 1; 1; id_2 = id_1[0]) id_4 <= id_3;
      end
      id_3 <= 1'b0;
    end
  assign id_4 = {1};
  assign id_4 = 1;
  logic id_7;
endmodule
