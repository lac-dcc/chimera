// Seed: 4112769665
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    input tri id_2,
    output wand id_3,
    output uwire id_4,
    input wand id_5,
    input uwire id_6,
    output tri id_7,
    input tri1 id_8,
    input uwire id_9,
    input tri0 id_10,
    input supply0 id_11,
    input wand id_12,
    input wire id_13,
    input supply0 id_14
);
  wire id_16;
endmodule
module module_1 #(
    parameter id_0 = 32'd5
) (
    input  tri1 _id_0,
    input  tri0 id_1,
    output wand id_2,
    output tri0 id_3
);
  wire [id_0 : 1] id_5;
  bit id_6;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_2,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_9 = 0;
  always @(posedge id_1) begin : LABEL_0
    id_6 = id_5;
    id_6 <= id_0;
  end
endmodule
