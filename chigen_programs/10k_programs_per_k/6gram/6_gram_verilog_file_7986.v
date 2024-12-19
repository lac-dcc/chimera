// Seed: 3473832547
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  supply1 id_3;
  assign id_2 = 'b0;
  id_4(
      id_1, id_3, ~id_3 | 1
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  id_3(
      .id_0(!id_2),
      .id_1(id_1),
      .id_2(id_4),
      .id_3(1'b0),
      .id_4(1 - id_4),
      .id_5(id_4),
      .id_6(1'b0),
      .id_7()
  );
endmodule
