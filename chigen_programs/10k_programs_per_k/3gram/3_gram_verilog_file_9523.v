// Seed: 3551108858
program module_0 (
    input tri1 id_0,
    output uwire id_1,
    output wire id_2,
    input supply1 id_3,
    input uwire id_4,
    input supply1 id_5,
    input wire id_6,
    output supply0 id_7,
    input wand id_8,
    output uwire id_9,
    input wand id_10,
    input wor id_11,
    input uwire id_12,
    input tri id_13
);
  wire id_15;
endprogram
module module_1 (
    input supply1 id_0,
    output logic id_1,
    output logic id_2,
    input tri id_3,
    input tri0 id_4,
    input tri1 id_5,
    input supply0 id_6
);
  always @(id_3 or 1) id_1 <= 1;
  tri  id_8;
  wire id_9;
  assign id_8 = 1;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_8,
      id_0,
      id_5,
      id_3,
      id_6,
      id_8,
      id_3,
      id_8,
      id_4,
      id_0,
      id_5,
      id_6
  );
  assign modCall_1.id_10 = 0;
  assign id_9 = id_9;
  assign id_8 = id_0;
endmodule
