// Seed: 832313796
module module_0 (
    input wire id_0,
    inout wire id_1,
    output wire id_2,
    input wire id_3,
    output tri0 id_4,
    id_10,
    output wor id_5,
    input tri0 id_6,
    output tri0 id_7,
    output supply0 id_8
);
  always begin : LABEL_0
    id_4 = id_10 + id_0 == -1'b0;
  end
  assign id_5 = 1'b0;
endmodule
module module_1 (
    input  tri   id_0,
    output tri   id_1,
    output uwire id_2
);
  tri0 id_4, id_5, id_6;
  tri1 id_7, id_8;
  assign id_1 = id_0;
  tri0 id_9;
  id_10 :
  assert property (@(negedge id_10 or negedge 1'd0 or posedge id_0) id_5)
    @(negedge id_4, posedge id_8 or negedge -1'b0) force id_1 = id_7 - id_7;
  else;
  tri0 id_11 = id_10;
  assign id_5  = -1;
  assign id_10 = 1;
  module_0 modCall_1 (
      id_11,
      id_7,
      id_1,
      id_7,
      id_7,
      id_1,
      id_10,
      id_8,
      id_2
  );
  assign modCall_1.type_1 = 0;
  supply1 id_12 = 1;
  id_13(
      .id_0(id_4 == id_8 ^ -1'd0),
      .id_1(id_9 == id_0),
      .id_2(id_8),
      .id_3(),
      .id_4(id_4),
      .id_5(1),
      .id_6(1),
      .id_7((id_1)),
      .id_8(-1 ? -1 : -1),
      .id_9(!id_12),
      .id_10(-1),
      .id_11(id_1)
  );
  assign id_8  = id_12;
  assign id_12 = id_0;
endmodule
