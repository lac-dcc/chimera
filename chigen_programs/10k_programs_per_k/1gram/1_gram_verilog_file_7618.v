// Seed: 3446258369
module module_0 #(
    parameter id_2 = 32'd40
);
  defparam id_2 = 1'b0;
  always $display(id_2);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  always id_2 <= id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_5, id_6, id_7;
  wire id_8;
  or primCall (id_1, id_2, id_3, id_4);
endmodule
module module_2;
  assign id_1#(
      .id_1(1),
      .id_1(~-1'b0 % 1),
      .id_1((1))
  ) = id_1;
  wire id_2 = id_1;
  module_0 modCall_1 ();
endmodule
