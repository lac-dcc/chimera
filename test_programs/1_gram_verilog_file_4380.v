// Seed: 3521488416
module module_0 (
    input wand id_0,
    output tri0 id_1,
    output tri0 id_2,
    output uwire id_3,
    input supply1 id_4,
    inout tri id_5
);
  logic [7:0] id_7, id_8;
  assign id_7 = id_7.id_7;
  wire id_9 = id_8[-1'd0][1];
endmodule
module module_1 (
    input wor id_0,
    output wor id_1,
    input uwire id_2,
    output uwire void id_3,
    output uwire id_4,
    input uwire id_5,
    inout supply0 id_6,
    input tri id_7,
    input uwire id_8,
    input tri id_9,
    input wand id_10,
    input wire id_11,
    output wor id_12,
    input supply0 id_13,
    input supply1 id_14,
    output wand id_15
);
  assign id_4 = 1'b0;
  nor primCall (id_3, id_2, id_7, id_0, id_13, id_6, id_8, id_5, id_11, id_10, id_14, id_9);
  module_0 modCall_1 (
      id_6,
      id_12,
      id_3,
      id_3,
      id_5,
      id_6
  );
  assign modCall_1.type_10 = 0;
endmodule
