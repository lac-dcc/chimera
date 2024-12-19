// Seed: 112531436
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  tri1 id_6 = id_5;
  assign id_1 = id_3 & 1;
  wire id_7;
  assign id_6 = 1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3
  );
endmodule
module module_2 ();
  wire id_1 = 1;
  assign module_0.id_1 = 0;
  assign id_1 = 1;
  id_3(
      .id_0(1), .id_1(id_2), .id_2(1), .id_3(1), .id_4({1 == id_1{1}} == id_1), .id_5(1), .id_6(1)
  );
endmodule
