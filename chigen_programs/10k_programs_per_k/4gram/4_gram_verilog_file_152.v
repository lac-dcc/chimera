// Seed: 1719131350
module module_0 (
    output tri0 id_0,
    input  wand id_1,
    output tri1 id_2,
    output tri0 id_3,
    input  tri0 id_4,
    input  wor  id_5,
    output tri  id_6
);
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input wire id_2,
    input wand id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri1 id_6,
    input tri0 id_7
);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_0,
      id_0,
      id_6,
      id_4,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = 1'b0;
  wire id_8;
  assign id_5[1==1] = id_6;
  module_2 modCall_1 (
      id_8,
      id_6,
      id_6
  );
  assign id_6 = 1;
endmodule
