// Seed: 194796289
module module_0 ();
  wire id_1;
  assign module_1.id_6 = 0;
  wire id_2;
  wire id_3;
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    module_1,
    id_5
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire  id_7;
  uwire id_8;
  wire  id_9;
  tri   id_10 = 1;
  assign id_8 = 1;
  module_0 modCall_1 ();
  assign id_3 = id_2;
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
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1'b0;
  id_16(
      .id_0(1),
      .id_1(1),
      .id_2((1'b0 && id_14 ? 1'b0 : id_1 !=? id_10)),
      .id_3(id_6),
      .id_4(1),
      .id_5(1)
  );
  assign id_13[1] = 1'b0;
  assign id_6 = id_6;
  module_0 modCall_1 ();
  nor primCall (
      id_1, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_2, id_3, id_4, id_6, id_9
  );
endmodule
