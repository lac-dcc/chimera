// Seed: 3505004095
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input wand id_2,
    output tri0 id_3,
    input tri id_4,
    input wand id_5,
    input tri0 id_6,
    input uwire id_7,
    input wire id_8,
    output supply0 id_9,
    input tri1 id_10,
    input tri id_11,
    input wor id_12,
    input tri1 id_13
    , id_17,
    input supply1 id_14,
    input tri1 id_15
);
  logic id_18;
endmodule
module module_1 (
    input wand id_0,
    output tri0 id_1,
    input wand id_2,
    output logic id_3,
    input tri0 id_4,
    input tri0 id_5,
    input wire id_6,
    input supply0 id_7,
    input uwire id_8,
    input uwire id_9,
    input wire id_10,
    output wand id_11
);
  always @(posedge id_4 or posedge id_7) for (id_11 = id_10 | id_5; -1'b0; id_3 = !id_0) $clog2(19);
  ;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_1,
      id_6,
      id_5,
      id_5,
      id_7,
      id_6,
      id_11,
      id_0,
      id_10,
      id_5,
      id_7,
      id_10,
      id_0
  );
  assign modCall_1.id_13 = 0;
endmodule
