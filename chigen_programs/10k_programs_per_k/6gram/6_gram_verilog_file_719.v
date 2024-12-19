// Seed: 2779758938
module module_0 (
    output wor   id_0,
    input  tri   id_1,
    output uwire id_2,
    input  wire  id_3,
    output uwire id_4
);
  assign id_2 = id_3;
  assign module_1.id_2 = 0;
  assign id_0 = 1;
endmodule
module module_1 (
    input  wire id_0,
    output wire id_1,
    output wire id_2
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_0,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  wire id_7;
  wire id_8, id_9;
  wire id_10;
  id_11(
      .id_0(1), .id_1(id_10 != 1'b0), .id_2(id_10), .id_3(id_1)
  );
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6 = id_4;
  module_2 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_2,
      id_2
  );
  wire id_7;
  wire id_8;
  assign id_8 = id_2;
endmodule
