// Seed: 602390359
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1) for (id_2 = 1; 1 + 1; id_1 = 1) $display(id_2);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.id_2 = 0;
  id_7(
      .id_0(id_6),
      .id_1(1),
      .id_2(1),
      .id_3(id_6(1, 1)),
      .id_4(id_1),
      .id_5(1),
      .id_6({id_5{1 != id_3}}),
      .id_7(id_3),
      .id_8(1'b0)
  );
endmodule
