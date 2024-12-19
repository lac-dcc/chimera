// Seed: 2284500153
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  id_3(
      .id_0(id_1),
      .id_1(1'b0 || ~1),
      .id_2(""),
      .id_3(1),
      .id_4(id_2),
      .id_5(1),
      .id_6(id_1 & id_2[1'h0]),
      .id_7({1, id_1}),
      .id_8(1)
  );
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
