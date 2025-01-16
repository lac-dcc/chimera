// Seed: 1056672358
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output wand id_3,
    input uwire id_4,
    output tri0 id_5,
    input wor id_6,
    input wire id_7,
    input wire id_8,
    output wire id_9,
    output wire id_10,
    output tri0 id_11,
    input wor id_12,
    input tri0 id_13,
    output supply1 id_14,
    output wor id_15,
    input supply1 id_16,
    id_19,
    input wire id_17
);
  id_20(
      .id_0(id_11), .id_1(-1), .id_2(id_5), .id_3({-1, !1, -1'b0, 1, id_14, id_19}), .id_4(id_8)
  );
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1,
    output wand  id_2,
    output wire  id_3,
    output logic id_4
);
  bit id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1,
      id_3,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
  assign id_4 = 1 == id_1;
  id_7(
      .id_0(1)
  );
  assign {1} = 1;
  wire id_8;
  always id_4 <= id_6;
  wire id_9;
endmodule
