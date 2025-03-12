// Seed: 4168105283
module module_0 (
    id_1,
    id_2,
    id_3
);
  output tri1 id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = -1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wand id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1
  );
  localparam id_3 = 1;
  assign id_1 = -1;
endmodule
module module_2 #(
    parameter id_10 = 32'd72,
    parameter id_2  = 32'd74
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  module_0 modCall_1 (
      id_14,
      id_13,
      id_8
  );
  input wire _id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire _id_2;
  output wire id_1;
  localparam id_15#(
      .id_16(id_15),
      .id_17(id_16[id_10 : 1].id_16[id_2 :-1'b0]),
      .id_18(id_15),
      .id_19(id_18),
      .id_20(-1),
      .id_21(id_18 ^ id_15),
      .id_22(id_16 & -1),
      .id_23(-1),
      .id_24(id_23 & 1)
  ) = id_22;
endmodule
