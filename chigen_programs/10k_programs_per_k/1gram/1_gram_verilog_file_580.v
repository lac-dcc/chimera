// Seed: 666819501
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  supply0 id_3, id_4 = id_3, id_5;
  assign id_3 = 1'd0;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6, id_7;
  module_0 modCall_1 (
      id_7,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    input wand id_0,
    output tri id_1,
    output supply1 id_2,
    input wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply0 id_6,
    output supply1 id_7,
    output wor id_8
);
  wire id_10;
  wire id_11 = id_4;
  wire id_12;
  wire id_13 = 1;
  assign module_3.id_0 = 0;
  wire id_14;
  wire id_15;
  wire id_16;
endmodule
module module_3 (
    input tri1 id_0,
    output wor id_1,
    output supply0 id_2
);
  assign id_2 = 1;
  module_2 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2
  );
  buf primCall (id_2, id_0);
endmodule
