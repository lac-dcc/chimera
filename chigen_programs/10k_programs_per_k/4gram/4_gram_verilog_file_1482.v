// Seed: 3013038119
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  tri0  id_10 = 1;
  uwire id_11 = 1, id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  module_0(
      id_3, id_6, id_6, id_6, id_7, id_5, id_6, id_6, id_8
  );
  assign id_1 = 1'd0;
  id_9(
      .id_0(id_6),
      .id_1(1),
      .id_2(1),
      .id_3(1'b0),
      .id_4(id_7),
      .id_5(id_8),
      .id_6({id_3, id_4[1], id_6, 1}),
      .id_7(1),
      .id_8(id_4),
      .id_9(id_1),
      .id_10('b0),
      .id_11(1'b0),
      .id_12(1),
      .id_13(id_3)
  );
  assign id_1 = 1;
endmodule
