// Seed: 86028025
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input tri id_2,
    output tri0 id_3,
    input wand id_4,
    input tri id_5,
    input tri0 id_6,
    input wire id_7,
    output wire id_8,
    input wor id_9,
    input wor id_10,
    input uwire id_11,
    input tri1 id_12,
    input supply0 id_13,
    input uwire id_14,
    output tri0 id_15,
    input supply1 id_16,
    output wor id_17
);
  assign id_15 = 1'b0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    output supply1 id_2,
    input wire id_3,
    output wire id_4,
    output wand id_5,
    input supply0 id_6,
    input wor id_7,
    input uwire id_8,
    output logic id_9,
    output wire id_10,
    input wand id_11,
    output tri0 id_12
);
  assign id_1 = id_6;
  logic id_14 = -1;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_6,
      id_12,
      id_8,
      id_8,
      id_6,
      id_8,
      id_4,
      id_3,
      id_0,
      id_3,
      id_11,
      id_3,
      id_11,
      id_4,
      id_6,
      id_1
  );
  always @(-1 or posedge 1'd0) id_9 = id_6;
endmodule
