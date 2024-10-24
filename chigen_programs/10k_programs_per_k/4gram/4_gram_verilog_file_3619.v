// Seed: 3997819492
module module_0 (
    input logic id_0,
    input id_1
);
  logic id_2;
  assign id_2 = id_0;
  type_14 id_3 (
      .id_0 (id_1),
      .id_1 (id_0),
      .id_2 (id_2),
      .id_3 (1),
      .id_4 (id_2 | 1),
      .id_5 (),
      .id_6 (id_0),
      .id_7 (id_1),
      .id_8 (1),
      .id_9 (id_0),
      .id_10(!id_1 && 1)
  );
  type_0 id_4 (
      .id_0(id_0),
      .id_1(1),
      .id_2(1)
  );
  integer id_5 (
      .id_0(id_0),
      .id_1(1),
      .id_2(1 - id_6)
  );
  specify
    $setup(id_7, id_8, id_0 + 1'b0);
    (posedge id_9 => (id_10 +: 1)) = (id_10, 1 == 1);
    specparam id_11 = 1 - id_1;
  endspecify
endmodule
