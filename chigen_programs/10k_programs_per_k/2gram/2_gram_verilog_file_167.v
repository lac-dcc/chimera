// Seed: 573845211
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
  module_2 modCall_1 (id_8);
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  not primCall (id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2
  );
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  id_2(
      .id_0(id_1),
      .id_1(id_3 != id_1),
      .id_2(),
      .id_3(id_1),
      .id_4(id_3),
      .id_5(id_3),
      .id_6(1),
      .id_7(1),
      .id_8((id_4)),
      .id_9(1'b0),
      .id_10(id_3),
      .id_11(1)
  );
endmodule
