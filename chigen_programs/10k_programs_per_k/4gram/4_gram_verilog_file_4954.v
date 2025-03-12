// Seed: 1029697269
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output uwire id_2,
    input supply1 id_3,
    input wand id_4,
    input supply0 id_5
    , id_11,
    input tri id_6,
    output tri id_7,
    output tri0 id_8,
    input supply1 id_9
);
endmodule
module module_1 #(
    parameter id_2 = 32'd78
) (
    output supply0 id_0,
    input wand id_1,
    input uwire _id_2,
    input tri1 id_3,
    input wire id_4,
    input supply1 id_5,
    input tri id_6,
    output tri0 id_7,
    output tri id_8,
    output tri1 id_9,
    output logic id_10,
    input tri1 id_11,
    input tri1 id_12
);
  always
    repeat (id_1) begin : LABEL_0
      if (1) if (1) id_10#(.id_3(1)) <= -1;
    end
  wire [1 : -1] id_14;
  assign id_7 = 1'b0;
  logic id_15;
  ;
  wire id_16;
  xor primCall (id_9, id_6, id_1, id_16, id_11, id_4, id_15, id_3, id_14);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_9,
      id_4,
      id_4,
      id_4,
      id_4,
      id_8,
      id_0,
      id_12
  );
  assign modCall_1.id_9 = 0;
  wire [-1 : id_2] id_17;
  wire id_18;
  assign id_8 = id_16;
  parameter integer id_19 = -1 - 1;
endmodule
