// Seed: 4121858464
module module_0 (
    output tri id_0,
    output tri1 id_1,
    output uwire id_2,
    output uwire id_3,
    input tri id_4,
    input tri id_5,
    input wor id_6,
    input tri0 id_7,
    input tri1 id_8,
    output wor id_9,
    input supply1 id_10,
    input tri1 id_11,
    input tri1 id_12,
    output uwire id_13,
    output tri0 id_14,
    input tri id_15,
    input tri id_16,
    input supply0 id_17,
    output wor id_18,
    input tri id_19,
    output tri1 id_20,
    output tri1 id_21,
    input wire id_22
);
  wire id_24;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd36
) (
    input wire id_0,
    input tri0 id_1,
    output uwire id_2,
    input tri id_3,
    output supply1 id_4,
    input supply1 _id_5
    , id_9,
    input tri1 id_6,
    input uwire id_7
);
  tri1 ["" : id_5] id_10 = 1;
  xnor primCall (id_2, id_6, id_7, id_3, id_9, id_0, id_1);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_2,
      id_3,
      id_1,
      id_6,
      id_1,
      id_0,
      id_4,
      id_3,
      id_0,
      id_7,
      id_4,
      id_2,
      id_0,
      id_7,
      id_3,
      id_4,
      id_6,
      id_4,
      id_2,
      id_6
  );
endmodule
