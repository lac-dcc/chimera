// Seed: 1692746786
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input tri1 id_2
);
  id_4(
      .id_0(id_2), .id_1(1)
  );
  module_2 modCall_1 ();
endmodule
module module_1 (
    input tri0 id_0,
    input tri  id_1
);
  id_3(
      .id_0(1), .id_1(id_1), .id_2(1), .id_3(1), .id_4(id_0), .id_5(id_1)
  );
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1
  );
endmodule
module module_2;
  assign id_1 = 1;
  reg id_2;
  always_comb
  fork
    if (id_2) begin : LABEL_0
      id_1 <= id_2;
    end
    id_2 = id_2;
    id_2 <= 1;
    id_1 = 1;
  join
  assign module_0.type_2 = 0;
endmodule
