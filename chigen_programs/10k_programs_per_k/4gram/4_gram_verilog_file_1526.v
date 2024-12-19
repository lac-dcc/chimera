// Seed: 1359016659
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  assign id_2 = 1 ? id_3 : 1;
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_4,
      id_1
  );
endmodule
module module_2 (
    input  uwire id_0,
    inout  wire  id_1,
    input  tri1  id_2,
    input  wand  id_3,
    output wire  id_4,
    input  wire  id_5,
    input  uwire id_6,
    input  tri1  id_7
);
  assign id_1 = id_2 & 1;
  wire id_9;
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_9,
      id_9
  );
  assign modCall_1.id_2 = 0;
endmodule
