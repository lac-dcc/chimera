// Seed: 18315503
module module_0 (
    output tri id_0
);
  assign id_0 = 1 ? -1 : 1'b0;
  logic id_2;
endmodule
module module_0 #(
    parameter id_8 = 32'd99
) (
    input wor id_0,
    input wand id_1,
    output supply1 id_2,
    input uwire id_3,
    input wand id_4,
    input supply0 id_5,
    input uwire id_6,
    input tri0 id_7,
    input wand _id_8,
    input supply0 id_9,
    input wire id_10,
    input wand id_11,
    output tri1 id_12,
    output uwire id_13,
    output tri0 id_14
);
  assign id_14 = 1;
  wire [id_8 : 1] id_16;
  nor primCall (id_14, id_4, id_0, id_6, id_11, id_7, id_17, id_10, id_1, id_3);
  always @(posedge -1 or posedge module_1 & 1'b0) begin : LABEL_0
    assert (id_5);
  end
  assign id_2 = 1 && id_7;
  wire id_17;
  module_0 modCall_1 (id_14);
  assign modCall_1.id_0 = 0;
  assign id_2 = id_10;
endmodule
