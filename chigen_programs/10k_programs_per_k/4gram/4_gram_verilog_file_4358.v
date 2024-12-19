// Seed: 1692501892
module module_0;
  logic [7:0] id_2;
  assign id_2 = id_2[1'b0];
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  wire id_7;
  assign id_5 = 1;
  wire id_8 = id_8;
  assign id_1[1 : 1] = id_2;
  module_0 modCall_1 ();
endmodule
module module_2 (
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
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = id_1;
  xnor primCall (
      id_1,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_2,
      id_3,
      id_4,
      id_5,
      id_6,
      id_7,
      id_8,
      id_9
  );
  id_13(
      .id_0(1)
  );
  wire id_14, id_15, id_16;
  module_0 modCall_1 ();
  wire id_17;
  id_18(
      .id_0(id_13),
      .id_1(1),
      .id_2(id_6),
      .id_3(id_10[~1'b0]),
      .id_4(id_4),
      .id_5(id_3),
      .id_6(~id_12[1 : 1'b0]),
      .id_7(1),
      .id_8(1),
      .id_9(id_3 >> 1)
  );
  wire id_19;
endmodule
