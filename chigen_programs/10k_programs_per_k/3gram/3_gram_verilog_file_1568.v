// Seed: 3115707532
module module_0 (
    output uwire id_0,
    input wor id_1,
    input uwire id_2,
    output tri id_3,
    input wand id_4,
    input wire id_5,
    output wor id_6,
    output wor id_7,
    input uwire id_8,
    input uwire id_9,
    input uwire id_10,
    input supply0 id_11,
    input tri id_12,
    input tri id_13,
    output supply1 id_14
);
  assign id_3 = id_4;
  wire id_16;
  wire id_17;
  parameter id_18 = 1;
  assign id_14 = id_12 & 1;
  logic id_19 = id_1;
  assign id_0 = 1;
endmodule
module module_1 (
    input uwire id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri0 id_4,
    input tri id_5,
    input wire id_6
);
  logic id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1,
      id_6,
      id_4,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_5,
      id_5,
      id_3,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
