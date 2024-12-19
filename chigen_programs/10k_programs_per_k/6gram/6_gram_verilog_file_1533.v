// Seed: 4161083737
module module_0 (
    output tri   id_0,
    input  tri1  id_1,
    input  uwire id_2,
    output wor   id_3
);
  assign id_0 = id_1;
endmodule
module module_1 (
    output tri0 id_0,
    output tri  id_1,
    input  wire id_2,
    input  wand id_3,
    output tri0 id_4,
    input  tri1 id_5,
    input  wand id_6,
    output tri0 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_5,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
  wire id_12;
  assign module_3.id_3 = 0;
  wire id_13;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  bufif0 primCall (id_3, id_2, id_1);
  module_2 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_3,
      id_1,
      id_2,
      id_3
  );
endmodule
