// Seed: 1186349221
module module_0 (
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
    id_11,
    id_12
);
  input wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  assign module_1.id_4 = 0;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_5 = id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout reg id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2
  );
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_4 = id_2;
  end
  assign id_4 = -1'b0 - id_4;
endmodule
