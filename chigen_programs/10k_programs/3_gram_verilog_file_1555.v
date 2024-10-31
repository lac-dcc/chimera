// Seed: 1052624075
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  id_3(
      .id_0(id_2), .id_1(id_1), .id_2(id_2)
  ); module_2();
  always @(1) id_1 = 1'b0;
endmodule
module module_1;
  wire id_2;
  module_0(
      id_2, id_2
  );
endmodule
module module_2 ();
  final $display(1, 1, !1, id_1);
endmodule
module module_3 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1[1] = id_2;
  module_2();
  wire id_3;
endmodule
