// Seed: 630633825
module module_0 (
    input wand id_0,
    output wand id_1,
    output supply1 id_2,
    input uwire id_3,
    input tri id_4,
    output tri0 id_5,
    output uwire id_6
    , id_17,
    input tri1 id_7,
    input supply0 id_8,
    input wor id_9,
    input wor id_10,
    output wand id_11
    , id_18,
    output wire id_12,
    input tri0 id_13,
    input tri id_14
    , id_19,
    input wor id_15
);
  assign id_19 = id_9;
  assign id_5  = id_18;
endmodule
module module_1 #(
    parameter id_7 = 32'd99
) (
    input uwire id_0,
    input supply1 id_1,
    output logic id_2,
    output wand id_3,
    input uwire id_4,
    output wand id_5
);
  wire _id_7, id_8;
  wire [-1 : id_7] id_9;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_0,
      id_0,
      id_3,
      id_5,
      id_0,
      id_0,
      id_0,
      id_0,
      id_5,
      id_5,
      id_1,
      id_1,
      id_4
  );
  assign modCall_1.id_3 = 0;
  logic id_10;
  ;
  always @(posedge -1 or posedge id_7 == id_8) id_2 = -1;
endmodule
