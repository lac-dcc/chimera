// Seed: 3515592459
module module_0 (
    input wand id_0,
    input wor id_1,
    input supply0 id_2,
    input tri1 id_3,
    input uwire id_4,
    output wand id_5,
    output tri1 id_6,
    input wor id_7,
    input supply1 id_8,
    input wand id_9,
    output wor id_10,
    input tri id_11,
    input uwire id_12,
    input supply0 id_13,
    input supply0 id_14,
    output supply1 id_15,
    output supply0 id_16
);
  wire id_18;
endmodule
module module_1 (
    output tri0 id_0,
    input  wor  id_1,
    input  wand id_2
);
  logic [7:0][1 'd0] id_4 = ~id_1;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_9 = 0;
  logic [7:0] id_7;
  id_8(
      .id_0(1), .id_1(1), .id_2(1), .id_3(id_0), .id_4(id_0), .id_5(id_4)
  );
  wire id_9, module_1;
  assign id_5 = id_7[1];
endmodule
