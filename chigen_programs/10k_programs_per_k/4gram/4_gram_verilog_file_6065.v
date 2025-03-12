// Seed: 4026798865
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input tri1 id_2,
    output wire id_3
);
  logic id_5[] = id_0;
  pullup (-1'h0 == 1, id_3);
  always force id_5 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd89,
    parameter id_4 = 32'd93
) (
    input  uwire id_0,
    input  wand  id_1,
    input  uwire id_2,
    input  tri1  _id_3,
    input  uwire _id_4,
    input  wire  id_5,
    output logic id_6,
    input  wire  id_7,
    output tri   id_8,
    output wand  id_9
);
  wire [id_4 : id_3  ==  -1] id_11;
  logic id_12;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_5,
      id_9
  );
  assign modCall_1.id_1 = 0;
  final $signed(92);
  ;
  logic [7:0] id_13;
  always @* begin : LABEL_0
    if (-1'b0) id_6 <= id_7;
    else id_13[-1+-1] = -1;
  end
endmodule
