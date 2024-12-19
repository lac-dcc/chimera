// Seed: 84671700
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input uwire id_2,
    input tri1 id_3
);
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    input wire id_4,
    input tri0 id_5
);
  generate
    wire id_7;
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_0,
      id_5,
      id_2
  );
  assign modCall_1.type_1 = 0;
  id_8(
      .id_0($display(1, id_0, id_9, id_1, id_2, 1)),
      .id_1(id_5),
      .id_2(1 | id_4 - id_3),
      .id_3(id_7)
  );
  assign id_9 = 1'b0;
endmodule
