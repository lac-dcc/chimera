// Seed: 1010385030
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_5;
  import id_6::*;
  initial begin : LABEL_0
    id_6 = 1'b0;
  end
  always_comb @(negedge id_2) id_5['b0] = 1;
  wire id_7, id_8;
  always @(posedge id_3);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_1 == 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
  supply1 id_6;
  reg id_7;
  assign id_7 = !id_6;
  always_comb @(posedge id_2#(.id_1(1'b0)
  ))
  begin : LABEL_0
    id_7 <= id_3;
  end
endmodule
