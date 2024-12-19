// Seed: 3209028596
module module_0;
  specify
    (id_1 => id_2) = 1;
    specparam id_3 = id_2++ < 1;
  endspecify
  assign module_1.id_4 = 0;
endmodule
macromodule module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  generate
    assign id_2 = id_3;
  endgenerate
  uwire id_4;
  id_5(
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3(1'h0),
      .id_4(id_2),
      .id_5(1'b0),
      .id_6(id_1),
      .id_7(1'h0 == id_2),
      .id_8(1)
  );
  module_0 modCall_1 ();
  assign id_3 = 1;
  wire id_6;
  wire id_7;
endmodule
