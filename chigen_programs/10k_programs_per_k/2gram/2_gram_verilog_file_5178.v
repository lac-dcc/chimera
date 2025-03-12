// Seed: 3654355510
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_17 = 32'd63
) (
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout logic [7:0] id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_2
  );
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  xor primCall (id_2, id_11, id_1, id_3, id_12, id_14, id_13, id_6, id_9, id_4);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  _id_17(
      1 - id_11[id_17] === 1
  );
endmodule
