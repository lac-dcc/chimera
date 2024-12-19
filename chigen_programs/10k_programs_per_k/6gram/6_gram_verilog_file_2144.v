// Seed: 1707069054
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    input wand id_3,
    output wire id_4,
    input tri0 id_5,
    input wor id_6,
    output tri1 id_7,
    input wor id_8,
    output wand id_9
);
  wire id_11;
  genvar id_12;
  wire id_13;
  assign module_1.id_11 = 0;
  id_14(
      id_0, 1'd0, id_12
  );
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    output tri id_2,
    output supply0 id_3,
    input supply1 id_4,
    output tri id_5,
    input uwire id_6,
    input tri1 id_7,
    output supply0 id_8,
    input supply1 id_9,
    input logic id_10,
    output tri0 id_11,
    input wand id_12
);
  always id_0 <= #1 id_10;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_8,
      id_7,
      id_11,
      id_12,
      id_7,
      id_5,
      id_6,
      id_8
  );
endmodule
