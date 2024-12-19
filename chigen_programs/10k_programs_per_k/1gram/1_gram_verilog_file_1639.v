// Seed: 1367743378
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input supply0 id_2,
    output tri id_3,
    output supply1 id_4,
    output supply1 id_5,
    output wire id_6,
    input wire id_7,
    input tri1 void id_8,
    input supply1 id_9,
    input uwire id_10,
    input tri1 id_11,
    input wire id_12,
    input tri id_13,
    output supply1 id_14,
    input wand id_15,
    output tri id_16,
    output wor id_17,
    output supply1 id_18,
    output supply0 id_19,
    input supply0 id_20,
    input supply0 id_21,
    output supply0 id_22,
    output wand id_23
);
  assign id_23 = 1;
  wor  id_25;
  wire id_26;
  assign id_25 = (id_10) > id_12;
  wire id_27;
endmodule
module module_1 (
    output tri id_0,
    output tri0 id_1,
    output uwire id_2,
    input tri1 void id_3,
    input supply1 void id_4,
    input tri0 id_5
);
  assign id_0 = 1;
  wire id_7, id_8;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_5,
      id_0,
      id_0,
      id_1,
      id_1,
      id_5,
      id_3,
      id_3,
      id_3,
      id_5,
      id_5,
      id_3,
      id_2,
      id_5,
      id_0,
      id_2,
      id_1,
      id_0,
      id_4,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_20 = 0;
  always begin : LABEL_0
    id_8 = id_8;
  end
endmodule
