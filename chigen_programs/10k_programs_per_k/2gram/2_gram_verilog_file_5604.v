// Seed: 3330944315
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wor id_4,
    input uwire id_5,
    output tri0 id_6,
    input tri id_7,
    input supply0 id_8,
    input tri id_9,
    input tri1 id_10,
    input tri id_11,
    input uwire id_12,
    output supply0 id_13
);
  supply0 id_15;
  wire id_16;
  assign id_15 = 1;
  wire id_17;
  wire id_18;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    input wire id_2,
    output tri id_3,
    input wire id_4,
    output supply0 id_5,
    input uwire id_6,
    input wor id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_4,
      id_1,
      id_5,
      id_1,
      id_0,
      id_2,
      id_4,
      id_0,
      id_7,
      id_5
  );
  assign modCall_1.id_8 = 0;
endmodule
