// Seed: 742299573
module module_0 (
    input tri0 id_0,
    output wire id_1,
    output supply0 id_2,
    output tri0 id_3,
    input wor id_4,
    output supply0 id_5,
    input wire id_6,
    input wor id_7,
    input tri1 id_8,
    input tri1 id_9,
    input wand id_10,
    output supply1 id_11,
    output tri1 id_12,
    input wor id_13,
    output supply1 id_14,
    output supply0 id_15,
    input tri0 id_16
    , id_30,
    input supply1 id_17,
    output supply0 id_18,
    input supply1 id_19,
    output tri id_20,
    output supply1 id_21,
    input wor id_22,
    input tri id_23,
    output uwire id_24,
    input tri0 id_25,
    input wand id_26,
    output tri0 id_27,
    input wand id_28
);
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    input wand id_2,
    output supply0 id_3,
    output tri1 id_4,
    output tri0 id_5,
    input wor id_6,
    input tri0 id_7,
    input tri1 id_8
);
  id_10 :
  assert property (@(posedge id_2) id_8)
  else;
  assign #1 id_1 = id_2;
  wire id_11;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_1,
      id_6,
      id_1,
      id_10,
      id_7,
      id_2,
      id_10,
      id_10,
      id_4,
      id_5,
      id_2,
      id_3,
      id_3,
      id_10,
      id_6,
      id_3,
      id_2,
      id_10,
      id_1,
      id_8,
      id_2,
      id_5,
      id_6,
      id_0,
      id_4,
      id_2
  );
  assign modCall_1.type_14 = 0;
endmodule
