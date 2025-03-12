// Seed: 3307891471
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input wand id_2,
    input wire id_3
    , id_12,
    output wor id_4,
    input wand id_5,
    input tri id_6,
    input supply1 id_7,
    output supply0 id_8,
    input supply1 id_9,
    output tri id_10
);
  wire id_13;
  wire id_14;
  ;
  assign id_1 = id_12 - (id_9);
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input tri id_2,
    output logic id_3,
    output wand id_4
);
  always @(posedge id_2 or negedge -1) begin : LABEL_0
    id_3 <= (-1);
  end
  module_0 modCall_1 (
      id_0,
      id_4,
      id_2,
      id_0,
      id_4,
      id_1,
      id_0,
      id_0,
      id_4,
      id_2,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
