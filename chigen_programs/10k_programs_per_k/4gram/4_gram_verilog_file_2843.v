// Seed: 3134687071
module module_0 (
    output supply1 id_0,
    output wire id_1,
    output wire id_2,
    input tri1 id_3
    , id_13,
    input tri1 id_4,
    input wor id_5,
    output wor id_6,
    input uwire id_7,
    output tri1 id_8,
    output wire id_9,
    output uwire id_10,
    input tri0 id_11
);
  supply1 id_14 = id_7, id_15, id_16, id_17;
  wire id_18;
  genvar id_19;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    output supply0 id_2,
    input tri id_3,
    input wire id_4,
    output wire id_5,
    input tri1 id_6,
    input supply1 id_7,
    input supply0 id_8
);
  assign id_5 = id_0;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_8,
      id_4,
      id_0,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.type_2 = 0;
endmodule
