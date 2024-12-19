// Seed: 2015151972
module module_0 (
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
    id_17
);
  input wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  tri0 id_18 = 1;
  id_19(
      .id_0(1'b0),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(id_2),
      .id_5(id_10),
      .id_6(id_18),
      .id_7(id_12),
      .id_8(1),
      .id_9(id_2)
  );
  wire id_20;
  for (id_21 = 1; {id_15, id_17}; id_8 = id_20) begin : LABEL_0
    assign id_9 = 1;
  end
  wire id_22;
  always @(posedge id_7) begin : LABEL_0
    disable id_23;
  end
  wire id_24;
endmodule
module module_1 (
    input wand id_0,
    input wand id_1
    , id_4,
    input tri0 id_2
);
  reg id_5, id_6, id_7, id_8, id_9;
  reg id_10;
  supply0 id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_4,
      id_11,
      id_4,
      id_11,
      id_4,
      id_11,
      id_11,
      id_11,
      id_4,
      id_4,
      id_4,
      id_4,
      id_11
  );
  assign modCall_1.id_18 = 0;
  assign id_6 = id_8;
  assign id_11 = 1 ? 1'b0 : 1;
  initial id_6 <= 1'b0;
  always_ff begin : LABEL_0
    id_10 = id_6;
  end
  wor id_12 = 1'b0;
endmodule
