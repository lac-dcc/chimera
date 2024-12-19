// Seed: 33616570
module module_0 (
    output wor id_0,
    output wand id_1,
    input tri id_2,
    output tri id_3,
    output wand id_4,
    input wand id_5,
    input uwire id_6
    , id_21,
    input tri id_7,
    input supply1 id_8,
    input wor id_9,
    output tri id_10,
    input tri0 id_11,
    input tri id_12,
    output wire id_13,
    input tri0 id_14,
    input supply1 id_15,
    output wand id_16,
    input uwire id_17,
    output uwire id_18,
    input supply1 id_19
);
endmodule
module module_1 (
    input supply0 id_0,
    output wor id_1,
    input uwire id_2,
    input uwire id_3,
    output supply0 id_4,
    input uwire id_5,
    input uwire id_6,
    input uwire id_7
);
  module_0 modCall_1 (
      id_1,
      id_4,
      id_5,
      id_1,
      id_4,
      id_6,
      id_5,
      id_6,
      id_3,
      id_3,
      id_4,
      id_7,
      id_5,
      id_1,
      id_2,
      id_2,
      id_1,
      id_7,
      id_1,
      id_6
  );
  assign modCall_1.type_12 = 0;
  supply0 id_9, id_10;
  assign id_9 = 1'b0;
  wire id_11;
  wand id_12, id_13;
  assign id_12 = 1;
  generate
    integer id_14 = id_3 / 1 ? id_10 : id_0 == 1;
    always_latch @(posedge 1) $display(id_10, 1, 1 | 1 || -(id_10), 1);
    wire id_15;
  endgenerate
endmodule
