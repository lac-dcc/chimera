// Seed: 3078846517
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input tri0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input uwire id_5,
    output wor id_6,
    input wor id_7
    , id_27,
    input wand id_8,
    input wor id_9,
    input supply1 id_10,
    input tri0 id_11,
    input supply0 id_12,
    input wand id_13,
    input supply1 id_14,
    input wand id_15,
    input wire id_16,
    input tri id_17,
    output wire id_18,
    input tri id_19,
    input wire id_20,
    output wire id_21,
    output wire id_22,
    input wand id_23,
    input tri id_24,
    output tri1 id_25
);
  wire id_28;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    output wire id_1,
    input wire id_2
    , id_7,
    input tri1 id_3,
    input supply1 id_4,
    input wire id_5
);
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_1,
      id_4,
      id_2,
      id_5,
      id_3,
      id_2,
      id_4,
      id_2,
      id_2,
      id_5,
      id_2,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_1,
      id_4,
      id_2,
      id_1
  );
  always @(*) id_0 = "";
  or primCall (id_0, id_7, id_5, id_4);
  assign id_7 = 1 - id_2 && -1;
endmodule
