// Seed: 993983584
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output tri id_2,
    input wor id_3
);
  id_5(
      .id_0(id_2),
      .id_1(""),
      .id_2(1 && id_0),
      .id_3(1),
      .id_4(1'b0),
      .id_5(id_1 < id_2 & (id_0)),
      .id_6(id_1)
  );
endmodule
module module_1 (
    output wire id_0,
    output supply1 id_1,
    input tri id_2,
    output supply0 id_3,
    input supply1 id_4
    , id_6
);
  assign id_1 = (1);
  xnor (id_1, id_6, id_4, id_2);
  module_0(
      id_2, id_4, id_0, id_4
  );
endmodule
