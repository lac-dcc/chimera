// Seed: 2910342530
module module_0 (
    output wire id_0,
    output uwire id_1,
    input tri id_2,
    input wor id_3,
    output uwire id_4,
    input wor id_5,
    input supply0 id_6,
    input tri0 id_7,
    output uwire id_8,
    output supply1 id_9,
    input tri id_10,
    output tri0 id_11,
    input tri id_12,
    output tri1 id_13,
    input wire id_14,
    input wire id_15,
    output tri id_16,
    output tri1 id_17
);
  wire id_19;
endmodule
module module_1 (
    output tri1 id_0,
    input wor id_1,
    output supply0 id_2,
    output supply0 id_3,
    input tri1 id_4,
    output tri1 id_5,
    input wor id_6
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_2,
      id_5,
      id_1,
      id_2,
      id_6,
      id_0,
      id_1,
      id_6,
      id_2,
      id_3
  );
  assign modCall_1.id_6 = 0;
endmodule
