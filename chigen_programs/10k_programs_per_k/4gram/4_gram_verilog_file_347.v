// Seed: 1475920249
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
  logic [7:0] id_5;
  assign id_5[1] = id_2;
  module_2 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_4,
      id_4
  );
endmodule
module module_1 (
    input  tri   id_0,
    output tri   id_1,
    output wand  id_2,
    output wire  id_3,
    input  uwire id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6
  );
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
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_19(
      .id_0(1), .id_1(id_6), .id_2(1), .id_3()
  );
  always_latch @(posedge 1'b0) begin : LABEL_0
    assert (id_16);
  end
  id_20(
      .id_0(1), .id_1(id_12 == id_18), .id_2(id_12), .product(id_18), .id_3(1), .id_4(1)
  );
  assign id_17 = id_1 ? id_10 : id_1;
endmodule
