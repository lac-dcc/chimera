// Seed: 677436024
module module_0 #(
    parameter id_10 = 32'd34,
    parameter id_9  = 32'd46
) (
    output wand id_0,
    output supply1 id_1,
    output wand id_2,
    output wire id_3,
    output supply0 id_4,
    input tri0 id_5
);
  logic id_7;
  logic [7:0] id_8[-1 'd0 : ""];
  assign id_4 = -1;
  logic _id_9, _id_10 = 1;
  wire [-1 : id_9] id_11;
  pulldown (
      .id_0(id_3),
      .id_1(id_8[id_10 : 1]),
      .id_2(id_7),
      .id_3(1),
      .id_4(id_9),
      .id_5(1),
      .id_6(id_10),
      .id_7(-1),
      .id_8(-1),
      .id_9(id_4)
  );
endmodule
module module_1 (
    output tri0 id_0,
    input wor id_1,
    output supply0 id_2,
    input wire id_3,
    input wand id_4,
    output wire id_5,
    output wand id_6,
    output tri id_7,
    input supply0 id_8,
    output supply0 id_9,
    input uwire id_10,
    output wand id_11,
    inout tri0 id_12,
    input uwire id_13
);
  assign id_6 = id_13;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_6,
      id_9,
      id_5,
      id_8
  );
  assign modCall_1.id_0 = 0;
endmodule
