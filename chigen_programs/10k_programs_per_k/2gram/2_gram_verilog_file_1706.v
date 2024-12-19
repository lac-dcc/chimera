// Seed: 165980035
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5 = id_4;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_5,
      id_5,
      id_4
  );
endmodule
module module_2 (
    input wand id_0,
    input wor id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wire id_4,
    input wor id_5,
    output wor id_6,
    input supply0 id_7,
    output tri0 id_8
);
  wire id_10;
  xor primCall (id_8, id_1, id_10, id_4, id_3);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10
  );
  assign id_6 = id_5;
endmodule
