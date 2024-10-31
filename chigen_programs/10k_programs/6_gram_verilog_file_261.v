// Seed: 4128663693
module module_0;
  always @(posedge 1) begin
    deassign id_1;
  end
  module_2();
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    output uwire id_2,
    output wor id_3
);
  wor id_5 = 1;
  module_0();
endmodule
module module_2 ();
  wire id_2;
  id_4(
      .id_0(1),
      .id_1(id_1),
      .id_2(id_1),
      .id_3(id_3),
      .id_4(1 + 1),
      .id_5(id_1),
      .id_6(1),
      .id_7(id_1)
  ); specify
    (id_5 *> id_6) = 1;
    specparam id_7 = id_6;
  endspecify
endmodule
