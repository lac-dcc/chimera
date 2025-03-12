// Seed: 3645497640
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    input wire id_4,
    output logic id_5
);
  initial if (1) id_5 = 1'h0;
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    output logic id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wire id_5,
    output tri0 id_6,
    input uwire id_7,
    input tri id_8,
    output wor id_9,
    output supply1 id_10,
    input supply1 id_11,
    input wor id_12,
    output wor id_13,
    input wor id_14,
    input wand id_15,
    input supply0 id_16
);
  assign id_6  = -1;
  assign id_10 = id_5 != id_15;
  wor  id_18 = 1;
  wire id_19 = id_15;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_12,
      id_5,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
  always @(-1) id_2 = #1 id_19;
endmodule
