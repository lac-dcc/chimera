// Seed: 2246828373
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input uwire id_3
);
  tri id_5;
  assign id_5 = id_3 & 1 ? 1'h0 : id_5++;
  uwire id_6 = 0;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1
);
  wire id_3;
  wor  id_4;
  module_0(
      id_1, id_0, id_0, id_1
  );
  wire id_5 = 1;
  id_6(
      .id_0(),
      .id_1(id_4),
      .id_2(id_5),
      .id_3(id_1),
      .id_4(id_1),
      .id_5(1'b0),
      .id_6(1 & id_0 > id_4)
  );
endmodule
