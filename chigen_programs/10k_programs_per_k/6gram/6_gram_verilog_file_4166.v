// Seed: 800239422
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_7 = 1;
  wire id_8;
  wire id_9;
  wire id_10;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    input wand id_2,
    input supply1 id_3,
    input supply1 id_4,
    input supply1 id_5,
    input wand id_6,
    input wire id_7,
    input tri1 id_8,
    input tri0 id_9,
    output supply0 id_10,
    output tri1 id_11
);
  wire id_13;
  tri0 id_14, id_15 = id_0;
  wire id_16;
  wire id_17;
  assign id_14 = id_0 ^ 1 == 1;
  xor primCall (id_10, id_16, id_17, id_6, id_9, id_5, id_7, id_3, id_13, id_15, id_4, id_2, id_1);
  module_0 modCall_1 (
      id_17,
      id_17,
      id_13,
      id_17,
      id_16,
      id_17,
      id_16
  );
  wire id_18;
  wire id_19 = id_15;
endmodule
