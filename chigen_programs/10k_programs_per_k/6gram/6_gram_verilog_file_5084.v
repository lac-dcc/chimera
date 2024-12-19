// Seed: 4192699957
module module_0 (
    output uwire id_0,
    input wor id_1,
    output uwire id_2,
    input wor id_3,
    inout tri id_4,
    output tri id_5,
    input supply0 id_6,
    output uwire id_7,
    input uwire id_8,
    input tri id_9,
    input supply1 id_10,
    input tri id_11,
    input tri1 id_12,
    input tri id_13,
    input wire id_14,
    output tri1 id_15
);
  assign id_4 = id_10;
  wire id_17;
  wire id_18;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    output wand id_2
);
  wor id_4;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_0
  );
  assign modCall_1.id_5 = 0;
  assign id_0 = id_4;
endmodule
