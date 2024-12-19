// Seed: 2385677418
module module_0 ();
  wor id_1, id_2 = 1;
  assign id_1 = 1 + id_2;
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
  output wire id_1;
  assign id_2[1'b0<1] = id_3;
  wire id_5;
  id_6(
      .id_0(1), .id_1(1'b0)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  assign id_1 = id_3;
  always #1 $display;
endmodule
module module_2 ();
  wire id_2;
  module_0 modCall_1 ();
endmodule
