// Seed: 2084744985
module module_0 (
    output tri id_0,
    output tri id_1,
    input tri1 id_2,
    input tri0 id_3,
    output tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    output uwire id_7,
    input uwire id_8,
    output wire id_9,
    output supply1 id_10,
    output supply1 id_11,
    output supply0 id_12,
    input supply0 id_13,
    output wor id_14,
    input wire id_15,
    input supply1 id_16,
    input supply0 id_17,
    input supply1 id_18,
    input tri0 id_19,
    input wire id_20
);
  wire id_22;
  wire id_23 = -1;
  wor  id_24 = id_20 && -1;
  assign id_14 = 1;
  wire id_25;
  assign id_9 = -1;
  wire id_26, id_27;
  assign id_23 = id_24;
  wire id_28;
  wire id_29;
  assign id_25 = id_27;
endmodule
module module_1 (
    input  wire id_0,
    input  tri  id_1,
    input  tri1 id_2,
    output tri1 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_0,
      id_3,
      id_1,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_3,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_17 = 0;
endmodule
