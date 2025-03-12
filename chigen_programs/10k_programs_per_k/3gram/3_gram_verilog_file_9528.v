// Seed: 386061975
module module_0 (
    input tri id_0,
    input uwire id_1,
    input tri1 id_2,
    input supply1 id_3,
    input supply1 id_4,
    output wand id_5,
    input wor id_6,
    input wor id_7,
    input wire id_8,
    input wand id_9
    , id_14,
    input wand id_10,
    output tri0 id_11,
    input tri0 id_12
);
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input wire id_2,
    input wire id_3,
    input uwire id_4
    , id_11,
    output supply0 id_5,
    output logic id_6,
    input tri0 id_7,
    output wor id_8,
    input supply0 id_9
);
  always @(-1 - id_7 or id_4) begin : LABEL_0
    id_6 = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_9,
      id_7,
      id_1,
      id_4,
      id_0,
      id_3,
      id_0,
      id_3,
      id_8,
      id_9
  );
  assign modCall_1.id_12 = 0;
endmodule
