// Seed: 1860496314
module module_0;
  wire id_2;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1;
  module_0 modCall_1 ();
endmodule
module module_2;
  logic [7:0] id_1;
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
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = id_7;
  static id_8(
      .id_0(id_6), .id_1(1), .id_2(""), .id_3(1)
  );
  assign id_3[1] = id_6;
  assign id_6 = id_8;
  module_2 modCall_1 ();
endmodule
