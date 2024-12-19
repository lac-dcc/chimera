// Seed: 3913168110
module module_0 (
    input wire id_0,
    input wand id_1,
    output supply0 id_2,
    output wire id_3,
    input wor id_4,
    output uwire id_5,
    output supply1 id_6,
    output wand id_7,
    input uwire id_8,
    output tri0 id_9,
    output uwire id_10,
    input tri id_11,
    input supply1 id_12,
    input tri0 id_13,
    output tri1 id_14,
    output wand id_15,
    input uwire id_16,
    input wand id_17,
    output supply0 id_18,
    input wor id_19
    , id_23,
    output supply0 id_20,
    input uwire id_21
);
  wire id_24;
endmodule
module module_1 (
    output wand id_0,
    output supply0 id_1,
    input supply1 id_2,
    input wor id_3,
    input wire id_4,
    output logic id_5,
    input supply1 id_6,
    output supply0 id_7,
    output logic id_8,
    input supply1 id_9,
    output tri id_10
);
  assign id_1 = 1;
  assign id_7 = 1;
  always id_8 = #1 1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_7,
      id_9,
      id_1,
      id_10,
      id_0,
      id_3,
      id_10,
      id_10,
      id_9,
      id_6,
      id_3,
      id_1,
      id_7,
      id_3,
      id_3,
      id_0,
      id_3,
      id_10,
      id_9
  );
  assign modCall_1.id_19 = 0;
  assign id_1 = 1;
  id_12 :
  assert property (@(1) id_9)
  else begin : LABEL_0
    id_5 <= 1;
    id_5 = id_12 == id_4;
  end
endmodule
