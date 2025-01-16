// Seed: 1758579395
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_12, id_13 = id_13;
  logic [7:0] id_14;
  specify
    (id_15 => id_16) = id_17;
    (id_18 => id_19) = (1 && id_16, id_14[1]);
    (id_20 => id_21) = (1 - 1, -1 || id_20, !id_17  : id_8  : 1'h0);
    specparam id_22 = id_18;
  endspecify
  wire id_23;
  wire id_24;
  assign id_8 = id_8;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_20 = 0;
endmodule
