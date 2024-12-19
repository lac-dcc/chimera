// Seed: 1287400263
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_11;
  assign id_2 = id_11;
  wire id_12;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_5,
      id_1
  );
  generate
    id_13(
        .id_0(1), .id_1(1)
    );
  endgenerate
  id_14 :
  assert property (@(1) ~id_9)
    if (1) id_13 = id_6;
    else id_10 <= "";
  wire id_15, id_16, id_17;
  wire id_18 = id_1;
endmodule
