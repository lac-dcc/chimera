// Seed: 2586892031
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input tri1 id_2,
    output wand id_3,
    input supply1 id_4,
    input tri id_5,
    output wire id_6,
    input wor id_7,
    input tri0 id_8,
    input tri id_9,
    input tri id_10,
    output wire id_11,
    output wire id_12,
    input wand id_13,
    input wand id_14,
    output wand id_15,
    output supply0 id_16,
    input supply1 id_17,
    input wire id_18
);
  assign id_1 = id_14;
endmodule
module module_1 (
    inout tri0 id_0,
    input uwire id_1,
    input wand id_2,
    input wor id_3,
    input supply1 id_4
);
  wire id_6;
  assign id_6 = id_2;
  wor id_7;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_7,
      id_0,
      id_6,
      id_0,
      id_6,
      id_1,
      id_2,
      id_6,
      id_3,
      id_0,
      id_7,
      id_0,
      id_1,
      id_7,
      id_7,
      id_3,
      id_2
  );
  assign modCall_1.id_4 = 0;
  id_8 :
  assert property (@(negedge id_3) id_6)
  else id_8 = id_7;
endmodule
