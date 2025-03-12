// Seed: 567572481
module module_0 (
    input tri0 id_0,
    output tri id_1,
    input wor id_2,
    output tri0 id_3,
    input tri0 id_4,
    input tri0 id_5
    , id_10,
    output wand id_6,
    input tri id_7,
    output supply1 id_8
);
  logic id_11 = (1 && -1'b0);
  assign id_8 = -1;
  logic id_12;
  assign id_12 = -1;
endmodule
module module_1 (
    input wire id_0,
    output tri1 id_1,
    output wand id_2,
    input supply0 id_3,
    output tri0 id_4,
    output supply1 id_5,
    input uwire id_6,
    input tri1 id_7,
    input uwire id_8,
    input wor id_9,
    output logic id_10
);
  always id_10 = #1 -1'b0 && id_6;
  nor primCall (id_10, id_9, id_8, id_6, id_7);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_7,
      id_2,
      id_7,
      id_6,
      id_4,
      id_8,
      id_4
  );
  assign modCall_1.id_12 = 0;
endmodule
