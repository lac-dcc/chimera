// Seed: 1097395716
module module_0 (
    output supply1 id_0,
    input wor id_1,
    output wand id_2,
    output tri id_3,
    output supply0 id_4,
    input supply0 id_5,
    input wand id_6,
    output wire id_7,
    input wand id_8,
    output tri id_9
);
  struct packed {
    logic id_11;
    id_12 id_13  = 1;
    id_14 id_15;
  } id_16;
endmodule
module module_1 #(
    parameter id_0 = 32'd81,
    parameter id_2 = 32'd20
) (
    input  uwire _id_0,
    output tri   id_1,
    output tri0  _id_2,
    input  wire  id_3,
    output logic id_4,
    input  wire  id_5
);
  wire [id_0  ==  ~  -1 : 1 'b0] id_7;
  wire id_8, id_9;
  logic id_10[id_2 : 1 'b0];
  ;
  wire id_11, id_12;
  always #(1) begin : LABEL_0
    id_4 = id_10;
  end
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_5,
      id_3,
      id_1,
      id_5,
      id_1
  );
endmodule
