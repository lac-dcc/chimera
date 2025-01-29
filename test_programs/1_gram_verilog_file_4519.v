// Seed: 3588274014
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wor id_4,
    input tri1 id_5,
    input wor id_6,
    output supply1 id_7,
    output wand id_8,
    input tri id_9,
    input wire id_10
);
  wire id_12;
  wor  id_13;
  wire id_14;
  id_15(
      .id_0(-1),
      .id_1(1),
      .id_2(id_5),
      .id_3((id_0)),
      .id_4(-1'b0),
      .id_5(1),
      .id_6(1),
      .id_7(~-1'b0)
  );
  wire id_16;
  wire id_17;
  assign id_7  = 1;
  assign id_13 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1
);
  assign id_3 = 1 ? id_1 : -1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1
  );
  final if (id_3) id_4 = id_3;
endmodule
