// Seed: 3944461564
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    input wire id_2,
    input tri id_3,
    input supply1 id_4,
    output supply1 id_5,
    input wand id_6,
    input uwire id_7
    , id_15,
    output tri1 id_8,
    output uwire id_9,
    output tri1 id_10,
    input supply0 id_11,
    input wire id_12,
    output wor id_13
);
  assign id_0 = 1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wor id_4,
    output wand id_5,
    output supply0 id_6
    , id_15,
    output tri0 id_7,
    input wand id_8,
    output wand id_9,
    output logic id_10,
    input supply0 id_11,
    input wor id_12,
    output wor id_13
);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4,
      id_4,
      id_4,
      id_5,
      id_0,
      id_4,
      id_9,
      id_5,
      id_9,
      id_2,
      id_3,
      id_6
  );
  wire id_16;
  ;
  always @(posedge id_15 - 1) id_10 <= -1;
endmodule
