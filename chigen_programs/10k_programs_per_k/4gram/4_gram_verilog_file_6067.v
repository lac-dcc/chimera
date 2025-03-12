// Seed: 3203802376
module module_0 (
    output tri id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri id_3,
    output supply1 id_4,
    output supply1 id_5,
    input wor id_6,
    output supply1 id_7,
    input wor id_8,
    input tri0 id_9
);
  wire id_11;
  ;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd19,
    parameter id_7  = 32'd15
) (
    output wire id_0,
    input uwire id_1,
    output supply0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output wand id_5,
    input tri1 id_6,
    input uwire _id_7,
    output tri0 id_8,
    input uwire id_9,
    input tri id_10,
    output supply0 id_11,
    output tri0 id_12,
    output tri id_13,
    input wand _id_14,
    input wor id_15,
    output wand id_16,
    input supply1 id_17
);
  assign #id_19 id_0 = id_1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_3,
      id_4,
      id_16,
      id_13,
      id_10,
      id_12,
      id_17,
      id_6
  );
  wire id_20;
  wire [id_7 : id_14] id_21;
  assign id_0 = id_19 ? (1) : -1;
endmodule
