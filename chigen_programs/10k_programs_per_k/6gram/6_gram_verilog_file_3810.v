// Seed: 2982169185
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_11, id_12;
  assign module_1.id_3 = 0;
  initial begin : LABEL_0
    id_11 <= 1 % 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4[1] = id_3 + 1;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_3,
      id_2,
      id_1,
      id_2,
      id_3,
      id_1,
      id_2,
      id_5
  );
  wire id_6;
  wire id_7;
endmodule
