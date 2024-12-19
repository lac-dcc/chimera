// Seed: 3948923951
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(negedge id_1) id_2 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
  wire id_6 = id_5;
  id_7(
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3(id_5),
      .id_4(1),
      .id_5(1),
      .id_6(id_1),
      .id_7(id_1),
      .id_8(id_6),
      .id_9(1'b0)
  );
endmodule
