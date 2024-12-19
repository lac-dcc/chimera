// Seed: 3209447598
module module_0 (
    output tri0 id_0,
    input  wand id_1,
    input  wand id_2,
    input  tri0 id_3
);
  logic [7:0] id_5;
  wire id_7;
  assign module_1.type_4 = 0;
  assign id_5[1] = 1;
  wire id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20;
  assign id_6 = id_9;
  wire id_21;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    input supply0 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    output uwire id_7,
    input tri id_8,
    input wor id_9,
    input wand id_10,
    output supply0 id_11,
    input logic id_12
    , id_16,
    input wor id_13,
    input tri1 id_14
);
  always @(1'b0 or posedge 1) begin : LABEL_0
    id_1 <= id_12;
  end
  static id_17(
      .id_0(1),
      .id_1(id_4),
      .id_2({1'b0, 1'b0}),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(id_11),
      .id_7(1)
  );
  module_0 modCall_1 (
      id_0,
      id_5,
      id_3,
      id_5
  );
endmodule
