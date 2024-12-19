// Seed: 4116874543
module module_0 #(
    parameter id_6 = 32'd19,
    parameter id_7 = 32'd24
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = 1;
  defparam id_6.id_7 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_7 = 0;
  id_3(
      .id_0(1),
      .id_1(id_1),
      .id_2(id_4),
      .id_3(id_4#(.id_4({(1), 1})) / id_1),
      .id_5(1),
      .id_6(1),
      .id_7(1)
  );
endmodule
