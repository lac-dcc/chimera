// Seed: 2439339399
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    input wand id_3,
    input uwire id_4,
    input supply1 id_5,
    input uwire id_6,
    input tri id_7,
    input uwire id_8,
    input wand id_9,
    output tri1 id_10,
    input tri1 id_11,
    output wor id_12,
    input wor id_13,
    input uwire id_14,
    input tri0 id_15
    , id_18,
    output supply0 id_16
);
  assign id_12 = id_6;
  wire id_19;
  assign id_12 = id_6;
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input wire id_2,
    output wand id_3,
    input wand id_4,
    input tri id_5,
    input wand id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri0 id_9,
    output uwire id_10
);
  wire id_12;
  id_13();
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6,
      id_5,
      id_4,
      id_2,
      id_10,
      id_2,
      id_3,
      id_6,
      id_0,
      id_4,
      id_3
  );
  assign modCall_1.type_25 = 0;
  always @(posedge 1 or posedge {id_6{1}}) #1 id_1 = #1 1;
endmodule
