// Seed: 1709388367
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
  module_0 modCall_1 (
      id_1,
      id_2
  );
endmodule
module module_2 (
    output supply0 id_0,
    output wor id_1,
    output supply1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    input wand id_6,
    output wor id_7
    , id_21,
    output wor id_8,
    output uwire id_9,
    output wor id_10,
    input tri1 id_11,
    input wand id_12,
    output supply0 id_13,
    output wor id_14,
    input wire id_15,
    input wand id_16,
    input supply0 id_17,
    output wor id_18,
    input uwire id_19
);
  wire id_22;
  final @(1'b0) id_0 = 1;
  module_0 modCall_1 (
      id_22,
      id_21
  );
  genvar id_23;
  or primCall (
      id_10, id_16, id_6, id_4, id_19, id_11, id_15, id_5, id_21, id_12, id_17, id_22, id_3
  );
  wire id_24;
endmodule
