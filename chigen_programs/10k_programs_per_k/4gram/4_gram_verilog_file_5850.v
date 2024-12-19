// Seed: 821330420
module module_0 (
    input wire id_0,
    output uwire id_1,
    input wand id_2,
    input wand id_3,
    output tri0 id_4,
    input wor id_5,
    input uwire id_6,
    input wire id_7,
    output wand id_8,
    input tri1 id_9,
    output supply1 id_10,
    output uwire id_11,
    input wire id_12,
    input wire id_13,
    input wor id_14,
    output tri1 id_15,
    output supply0 id_16,
    input uwire id_17,
    output wire id_18,
    output tri0 id_19
);
  wire id_21;
  initial id_8 = id_3;
endmodule
module module_1 (
    input  wand  id_0,
    output uwire id_1,
    inout  wire  id_2,
    input  wor   id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_0,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_3,
      id_0,
      id_3,
      id_1,
      id_1,
      id_3,
      id_2,
      id_1
  );
  assign modCall_1.id_3 = 0;
  id_6(
      .id_0(1'b0),
      .id_1(id_0),
      .id_2(1'd0),
      .id_3(1'b0 | 1),
      .id_4(!id_2 - 1),
      .id_5(1),
      .id_6(),
      .id_7(1'h0),
      .id_8(1),
      .id_9(id_3),
      .find(1),
      .id_10(id_2)
  );
endmodule
