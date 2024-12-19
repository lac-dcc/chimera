// Seed: 3185249138
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2,
    input tri0 id_3
    , id_19,
    input supply1 id_4,
    input tri id_5,
    output wand id_6,
    output tri id_7,
    input tri1 id_8,
    input wand id_9,
    output supply1 id_10,
    input tri0 id_11,
    output tri1 id_12,
    input wor id_13,
    input wor id_14,
    input wire id_15,
    input uwire id_16,
    output uwire id_17
);
  id_20(
      1'b0
  );
  assign id_12 = id_0;
  assign module_1.id_5 = 0;
  wire id_21;
  wire id_22, id_23, id_24, id_25, id_26;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output supply1 id_2,
    input supply1 id_3,
    input wire id_4,
    input tri1 id_5,
    output uwire id_6
);
  supply1 id_8;
  assign id_6 = $display(id_4, 1'b0, id_8, id_1);
  xor primCall (id_6, id_8, id_10, id_0, id_4, id_9, id_11, id_3, id_5, id_1);
  wire id_9, id_10, id_11;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_8,
      id_8,
      id_1,
      id_8,
      id_8,
      id_0,
      id_5,
      id_2,
      id_8,
      id_6,
      id_0,
      id_3,
      id_3,
      id_4,
      id_6
  );
endmodule
