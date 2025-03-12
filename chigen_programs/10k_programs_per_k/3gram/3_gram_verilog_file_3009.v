// Seed: 1107417624
module module_0 (
    input wire id_0,
    input uwire id_1,
    input wand id_2,
    input tri0 id_3,
    input wand id_4,
    output tri id_5,
    output tri1 id_6,
    input wor id_7,
    input uwire id_8,
    input tri0 id_9,
    output tri id_10,
    input wor id_11,
    input supply1 id_12
);
  logic id_14 = id_3;
  assign id_14 = -1;
  always @(-1'b0) begin : LABEL_0
    id_14 <= 1;
  end
  wire id_15;
  assign id_14 = id_7;
endmodule
module module_1 #(
    parameter id_11 = 32'd37,
    parameter id_9  = 32'd28
) (
    inout tri0 id_0#(
        .id_7  (1),
        .id_8  (1),
        ._id_9 (-1),
        .id_10 ((1) & -1'b0),
        ._id_11(1),
        .id_12 (-1 << -1 - -1)
    ),
    input uwire id_1,
    input tri1 id_2,
    input wand id_3,
    input wand id_4,
    output supply1 id_5
);
  logic [id_11  &&  1 'b0 : id_9] id_13;
  logic id_14;
  initial begin : LABEL_0
    id_8 <= #1 id_4;
    id_13 = 1;
  end
  logic id_15;
  ;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_3,
      id_1,
      id_5,
      id_5,
      id_4,
      id_4,
      id_3,
      id_5,
      id_0,
      id_4
  );
  assign modCall_1.id_7 = 0;
endmodule
