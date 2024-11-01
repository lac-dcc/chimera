// Seed: 3842843598
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri0 id_5
);
  assign id_0 = ~id_2;
  uwire id_7;
  tri0  id_8;
  assign id_7 = id_8 != 1 - id_1;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri id_3,
    input tri1 id_4,
    output supply1 id_5
);
  id_7(
      .id_0(1'b0), .id_1(1), .id_2(id_5 == 1), .id_3(1'd0)
  );
  assign id_5 = id_4;
  module_0(
      id_5, id_1, id_4, id_2, id_3, id_0
  );
endmodule
