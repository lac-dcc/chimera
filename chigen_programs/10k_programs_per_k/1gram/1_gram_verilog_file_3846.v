// Seed: 958154576
module module_0 ();
  generate
    wire id_1;
  endgenerate
  for (id_2 = 1; id_2; id_2 = 1) id_3(1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final id_2 <= id_3;
  wire id_4;
  module_0(); id_5 :
  assert property (@(*) {id_3});
  id_6(
      1, id_2, 1'b0
  );
endmodule
module module_2;
  wire id_1, id_2;
  module_0(); id_4(
      id_3
  );
endmodule
