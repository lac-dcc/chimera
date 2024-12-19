// Seed: 1385632001
module module_0 (
    input wand id_0,
    output tri1 id_1,
    input wire id_2,
    input tri id_3,
    input wand id_4,
    output supply0 id_5,
    input uwire id_6
    , id_10,
    output uwire id_7,
    output uwire id_8
);
  wire id_11;
  id_12(
      .id_0(id_2),
      .id_1(id_2),
      .id_2(id_8 & 1'd0),
      .id_3(id_7 ==? id_4),
      .id_4(),
      .id_5(id_4),
      .id_6(1'b0),
      .id_7(0),
      .id_8(1),
      .id_9(id_0 && 1 && 1'b0),
      .id_10(id_11),
      .id_11(""),
      .id_12(1),
      .id_13(id_2),
      .id_14(id_5),
      .id_15(id_3 | 1)
  );
  wire id_13;
  assign module_1.type_2 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd17,
    parameter id_11 = 32'd12
) (
    input supply1 id_0,
    input wor id_1,
    output supply1 id_2,
    output uwire id_3,
    input supply1 id_4,
    input logic id_5
    , id_8, id_9,
    input supply1 id_6
);
  assign id_2 = id_1 * id_4 - ~|id_1;
  always @(posedge id_8) begin : LABEL_0
    if (1) id_8 <= id_5;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_0,
      id_4,
      id_3,
      id_6,
      id_3,
      id_3
  );
  defparam id_10.id_11 = 1;
endmodule
