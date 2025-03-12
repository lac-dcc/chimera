// Seed: 1826342353
module module_0 (
    input uwire id_0,
    output logic module_0,
    output wand id_2,
    output tri1 id_3,
    output tri0 id_4,
    output wand id_5,
    input tri id_6,
    output wand id_7,
    output tri1 id_8,
    output wor id_9,
    input tri0 id_10,
    input tri0 id_11,
    output uwire id_12,
    input uwire id_13,
    input tri id_14,
    input supply0 id_15,
    output tri id_16,
    output supply0 id_17
);
  always @(posedge id_15) id_1 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    output uwire id_1,
    input wand id_2,
    input supply0 id_3,
    output logic id_4,
    output tri1 id_5
);
  wire id_7;
  generate
    always @(*) id_4 = -1;
  endgenerate
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_5,
      id_0,
      id_0,
      id_1,
      id_3,
      id_5,
      id_0,
      id_0,
      id_3,
      id_2,
      id_5,
      id_3,
      id_2,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
