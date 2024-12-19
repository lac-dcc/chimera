// Seed: 284319709
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    output supply1 id_3,
    input uwire id_4,
    output tri id_5,
    output tri1 id_6,
    input supply1 id_7,
    output tri0 id_8
);
  tri1 id_10;
  assign id_3 = id_10 ? 1 == id_10 : 1'b0;
  assign id_6 = 1;
  uwire id_11 = id_4;
endmodule
module module_1 (
    inout uwire   id_0,
    input supply1 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_16(
      .id_0(),
      .id_1(1),
      .id_2(1),
      .id_3(1'b0 == id_15),
      .id_4(1 - 1),
      .id_5(id_4 < id_3),
      .id_6(id_8),
      .id_7(id_7),
      .id_8(1),
      .id_9((id_8)),
      .id_10(~id_2),
      .id_11(1),
      .id_12({id_4, id_6} && id_15)
  );
  always @(posedge 1 or 1 + {1'b0{{id_14, 1 & 1'h0}}}) begin : LABEL_0
    id_7 <= 1;
  end
  wire id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  reg module_3 = id_3;
  always @* begin : LABEL_0
    assert (1);
    id_5 <= 1;
    id_5 <= id_3;
  end
  module_2 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_5,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_4,
      id_4,
      id_4
  );
  wire id_6;
endmodule
