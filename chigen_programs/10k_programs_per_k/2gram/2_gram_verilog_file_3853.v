// Seed: 536836590
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input tri1 id_2,
    input tri1 id_3
);
  initial #1;
  assign module_2.id_6 = 0;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output tri id_5,
    input tri1 id_6
);
  assign id_2 = (1);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_0
  );
endmodule
module module_2 #(
    parameter id_9 = 32'd26
) (
    output uwire id_0,
    input wor id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri id_4,
    input tri id_5,
    input uwire id_6,
    output wor id_7,
    input uwire id_8,
    output uwire _id_9,
    output tri id_10,
    input wand id_11,
    output logic id_12,
    input wire id_13,
    input wor id_14
);
  logic [1 : id_9] id_16;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_3,
      id_3
  );
  always id_12 = id_3;
endmodule
