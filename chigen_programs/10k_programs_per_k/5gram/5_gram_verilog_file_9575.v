// Seed: 513992564
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    output wor id_3,
    output tri id_4,
    input supply0 id_5,
    input wand id_6,
    input supply0 id_7,
    input supply0 id_8,
    input wor id_9,
    input uwire id_10,
    input uwire id_11,
    input wire id_12,
    input uwire id_13,
    output tri0 id_14
);
  assign id_3 = id_2 ? 1 : id_6;
  initial begin : LABEL_0
    id_3 = 1;
  end
  wire id_16, id_17;
endmodule
module module_1 (
    input  wand  id_0,
    input  uwire id_1,
    input  wire  id_2,
    input  wand  id_3,
    output tri0  id_4,
    output wand  id_5,
    input  wand  id_6
);
  id_8(
      .id_0(1), .id_1(id_1 == 1), .id_2((1'b0) == id_3), .min(id_3 == id_2)
  );
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_4,
      id_5,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_5
  );
  assign modCall_1.id_9 = 0;
endmodule
