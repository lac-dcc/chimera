// Seed: 93346839
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output wire id_2,
    output wire id_3,
    input uwire id_4,
    output tri0 id_5,
    output tri0 id_6,
    output tri1 id_7,
    input tri id_8,
    output tri0 id_9,
    input wand id_10,
    output tri0 id_11,
    output tri1 id_12,
    input wand id_13,
    input tri0 id_14,
    input uwire void id_15,
    input wire id_16,
    input wand id_17,
    output tri0 id_18
    , id_22 = 1,
    input uwire id_19,
    input wire id_20
);
  wire id_23, id_24;
  wire id_25, id_26, id_27, id_28, id_29, id_30;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input supply0 id_4
);
  supply1 id_6, id_7, id_8;
  genvar id_9;
  notif1 primCall (id_1, id_4, id_3);
  id_10(
      id_1, id_2, id_0, 1'b0 | 1'b0, id_7
  );
  generate
    wire id_11;
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1,
      id_7,
      id_7,
      id_1,
      id_8,
      id_8,
      id_2,
      id_6,
      id_2,
      id_8,
      id_6,
      id_2,
      id_3,
      id_3,
      id_2,
      id_7,
      id_8,
      id_2,
      id_0
  );
  assign modCall_1.id_15 = 0;
endmodule
