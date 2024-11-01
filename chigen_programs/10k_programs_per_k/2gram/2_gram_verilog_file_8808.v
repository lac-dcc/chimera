// Seed: 1298813350
module module_0;
  assign id_1 = 1;
  module_2(
      id_1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4#(
        .id_5(1),
        .id_6(1),
        .id_7(1),
        .id_8(id_3)
    )
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  xnor (id_1, id_2, id_3, id_5, id_6, id_7, id_8);
  assign id_4 = id_2;
  always begin
    id_1 = id_5 <-> id_7;
  end
  module_0();
endmodule
module module_2 (
    id_1
);
  inout wire id_1;
  assign id_1 = id_1;
  assign id_1 = 1;
endmodule
