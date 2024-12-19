// Seed: 3503218991
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_5(
      .id_0(""), .id_1(1), .id_2(id_4), .id_3(1), .id_4(), .id_5(id_4)
  );
  always @(1 or negedge (id_2)) begin : LABEL_0
    id_1 = id_3;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_5;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4
  );
  always @(id_2 or posedge id_2) id_2 = 1;
  wire  id_6;
  uwire id_7;
  id_8(
      .product(id_5),
      .id_0(id_6),
      .id_1(1),
      .id_2(1),
      .id_3(id_5[1]),
      .id_4(1),
      .id_5(id_5),
      .id_6(id_3),
      .id_7(id_1),
      .id_8(1),
      .id_9((id_6)),
      .id_10(1),
      .id_11(1'b0),
      .id_12(id_1)
  );
  wire id_9;
  assign id_2 = id_7;
endmodule
