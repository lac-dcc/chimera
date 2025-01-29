// Seed: 2474175664
module module_0 (
    output uwire id_0,
    input  wor   id_1,
    input  wor   id_2,
    input  uwire id_3
);
  uwire id_5;
  id_6(
      .id_0(1),
      .id_1(id_5),
      .id_2(),
      .id_3(1),
      .id_4(1),
      .id_5(-1),
      .product(id_3),
      .id_6(id_2),
      .id_7(""),
      .id_8(""),
      .id_9(-1),
      .id_10(1 & 1'b0),
      .id_11(id_7 == id_5)
  );
  wire id_8;
endmodule
module module_1 (
    output logic   id_0,
    input  supply0 id_1,
    output supply1 id_2,
    output uwire   id_3,
    input  logic   id_4,
    output logic   id_5
);
  logic id_7 = -1;
  for (id_8 = 1'b0; id_7; id_5 = id_4) begin : LABEL_0
    assign id_0 = id_8;
    id_9(
        id_5 == id_7
    );
  end
  wire id_10;
  always_ff id_0 <= #1 id_4;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
