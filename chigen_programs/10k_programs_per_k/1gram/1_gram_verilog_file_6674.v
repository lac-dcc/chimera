// Seed: 1908193992
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri id_5, id_6, id_7;
  id_8(
      id_7 - 1'b0
  );
  wire id_9;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  specify
    (id_2 *> id_3) = 1;
    (id_4 => id_5, id_6) = 1;
    (id_7 => id_8) = (1, (1), id_7 - "");
    (id_9 => id_10) = (id_10 - id_6[1][(1)]);
    $setup(negedge id_11, posedge id_12, 1'b0 ? id_11 : id_2);
  endspecify
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_5
  );
endmodule
