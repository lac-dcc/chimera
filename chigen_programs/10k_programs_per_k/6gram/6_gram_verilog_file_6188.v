// Seed: 1496202010
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output wand id_2,
    output wor id_3,
    input wand id_4,
    output supply0 id_5,
    output tri0 id_6,
    input supply0 id_7,
    input wand id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wor id_11,
    output wand id_12,
    input tri id_13,
    input supply0 id_14,
    output uwire id_15,
    output tri0 id_16
);
  assign id_2 = id_1;
  assign module_1.id_10 = "";
endmodule
module module_1 #(
    parameter id_7 = 32'd66
) (
    output tri1 id_0,
    output uwire id_1,
    output uwire id_2,
    input tri0 id_3,
    input wand id_4,
    output wor id_5,
    input supply1 id_6,
    input supply1 _id_7,
    output uwire id_8
);
  string [id_7 : 1] id_10;
  assign id_10 = id_10 ? "" : id_3.id_3;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_1,
      id_8,
      id_4,
      id_2,
      id_5,
      id_3,
      id_6,
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_6,
      id_0,
      id_5
  );
endmodule
