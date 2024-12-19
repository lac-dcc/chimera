// Seed: 817402465
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign {id_1, id_2, 1} = id_6;
  id_7(
      .id_0(id_4),
      .id_1(id_5),
      .id_2(id_5),
      .id_3(1),
      .id_4(1),
      .id_5(id_2),
      .id_6(1),
      .id_7(1),
      .id_8(id_2),
      .id_9(""),
      .id_10(id_2 & 1),
      .id_11(id_1)
  );
endmodule
module module_1 #(
    parameter id_3 = 32'd59,
    parameter id_4 = 32'd22
) (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  defparam id_3.id_4 = 1 < 1;
  not primCall (id_2, id_3);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
