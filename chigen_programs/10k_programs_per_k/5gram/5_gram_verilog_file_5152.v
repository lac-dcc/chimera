// Seed: 2259888461
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  assign module_1.id_0 = 0;
  inout wire id_1;
  assign module_2.id_8 = 0;
  assign id_1 = id_2;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wand id_4,
    output wor id_5,
    output supply1 id_6,
    output tri0 id_7,
    output uwire id_8,
    output uwire id_9,
    input wor id_10,
    output wor id_11
);
  logic id_13;
  or primCall (id_5, id_10, id_0, id_13, id_3, id_4, id_2, id_1);
  module_0 modCall_1 (
      id_13,
      id_13
  );
endmodule
module module_2 #(
    parameter id_8 = 32'd92
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire _id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_7,
      id_5
  );
  input wire id_6;
  inout wire id_5;
  inout uwire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = -1;
  logic [id_8 : ""] id_13;
endmodule
