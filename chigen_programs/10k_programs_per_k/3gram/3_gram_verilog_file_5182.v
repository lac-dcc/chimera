// Seed: 3740406960
module module_0 (
    output supply1 id_0,
    output tri id_1
);
  id_3(
      .id_0(1'h0),
      .id_1(1),
      .id_2(id_1),
      .id_3(1 ? id_1 : id_1),
      .id_4(id_1 == 1),
      .id_5(id_4),
      .id_6(1)
  );
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri  id_1,
    input  tri  id_2,
    output wire id_3,
    output tri  id_4
);
  id_6(
      .id_0(1), .id_1(), .id_2(1), .id_3("")
  );
  assign id_3 = 1;
  assign id_1 = id_0;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1
  );
endmodule
