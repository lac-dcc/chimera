// Seed: 4225336750
module module_0 (
    id_1
);
  input wire id_1;
  wire id_2;
endmodule
module module_1 ();
  assign id_1 = 1;
  module_0 modCall_1 (id_1);
  id_2(
      .id_0(1), .id_1(""), .id_2(id_1), .id_3()
  );
endmodule
macromodule module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  final id_5 <= 1;
  module_0 modCall_1 (id_1);
endmodule
