// Seed: 1342444854
module module_0 (
    input supply1 id_0
);
  id_2(
      1'b0, ~1, 1, 1
  );
  tri1 id_3, id_4, id_5;
  assign id_4 = 1 ? 1 : ('b0);
  wor id_6, id_7 = 1;
  supply1 id_8, id_9, id_10, id_11, id_12, id_13, id_14;
  assign id_5  = id_13;
  assign id_8  = 1'd0;
  assign id_14 = id_4;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1
);
  tri1 id_3;
  assign id_3 = id_0;
  id_4 :
  assert property (@(*) !1 ^ id_3) @(id_1) id_3 = ~id_1;
  assign id_4 = 1;
  module_0(
      id_3
  );
endmodule
