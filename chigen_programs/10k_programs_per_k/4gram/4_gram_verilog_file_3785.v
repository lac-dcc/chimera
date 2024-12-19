// Seed: 3068482309
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_12;
  assign id_11 = id_7;
  module_0 modCall_1 (
      id_5,
      id_12,
      id_6,
      id_5
  );
  always_comb @(posedge id_8) begin : LABEL_0
    id_7 <= id_11;
    if (1) id_11 = id_1;
  end
endmodule
