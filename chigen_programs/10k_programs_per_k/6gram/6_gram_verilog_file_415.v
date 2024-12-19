// Seed: 245999621
module module_0 (
    output wor id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3,
    input wor id_4,
    input uwire id_5,
    output wor id_6,
    input tri1 id_7,
    output tri1 id_8,
    output supply1 id_9
);
  wire id_11;
  assign module_1.id_0 = 0;
  always disable id_12;
  wire id_13;
  id_14(
      .id_0(1),
      .id_1(id_0),
      .id_2(""),
      .id_3(~(1'b0 - !id_4)),
      .id_4(id_9),
      .id_5(1'b0),
      .id_6(id_1)
  );
endmodule
module module_1 (
    input  wire id_0,
    input  wor  id_1,
    output wor  id_2
);
  tri0 id_4 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2
  );
  wire id_6;
endmodule
