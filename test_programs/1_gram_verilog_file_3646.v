// Seed: 3841663537
module module_0 (
    output wor id_0,
    input uwire id_1,
    output supply0 id_2,
    output supply0 id_3,
    input wand id_4,
    id_19,
    input supply1 id_5,
    input supply1 id_6,
    input uwire id_7,
    output wire id_8,
    input uwire id_9,
    input tri0 id_10,
    output tri0 id_11,
    input supply0 id_12,
    output supply0 id_13,
    input supply0 id_14,
    input wor id_15,
    input tri id_16,
    input wor id_17
);
  wire id_20;
  wire id_21;
  assign module_1.type_3 = 0;
  wire id_22;
  parameter id_23 = -1;
  wire id_24;
  always if (1'b0) id_19 = -1;
endmodule
module module_1 (
    output wire  id_0,
    output tri1  id_1,
    output uwire id_2,
    output wor   id_3,
    input  wire  id_4,
    input  wand  id_5,
    output uwire id_6,
    output tri1  id_7
);
  always_ff id_7 = id_4;
  wire id_9;
  initial id_1 = id_5;
  assign id_6 = -1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_0,
      id_5,
      id_5,
      id_5,
      id_4,
      id_3,
      id_4,
      id_4,
      id_0,
      id_5,
      id_1,
      id_5,
      id_5,
      id_5,
      id_4
  );
  tri1 id_10 = 1'b0, id_11, id_12;
endmodule
