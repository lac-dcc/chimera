// Seed: 3561527950
module module_0 (
    input wor id_0,
    output wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri id_4,
    input wire id_5,
    output wand id_6
    , id_12,
    output tri0 id_7,
    output uwire id_8,
    input wand id_9,
    output supply0 id_10
);
  assign id_7 = id_3 == 1;
  assign id_6 = id_5;
  wire  id_13;
  logic id_14;
  ;
  wire id_15;
  ;
  assign id_6 = id_12;
  wire id_16;
  wire id_17;
  wire id_18;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output supply0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output logic id_5
);
  wire id_7;
  always @(posedge id_1 or posedge 1) id_5 = 1'b0 < id_0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_0,
      id_3,
      id_0,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
