// Seed: 3156118582
module module_0 (
    input wand id_0,
    input wire id_1
);
endmodule
module module_1 #(
    parameter id_14 = 32'd37,
    parameter id_4  = 32'd26,
    parameter id_5  = 32'd78
) (
    input supply0 id_0,
    output supply1 id_1,
    input supply1 id_2,
    input wire id_3,
    input tri0 _id_4,
    input wand _id_5,
    output tri1 id_6,
    input tri0 id_7,
    input supply0 id_8,
    input tri0 id_9,
    input tri id_10,
    input supply0 id_11,
    output logic id_12,
    input tri id_13,
    output supply1 _id_14,
    input uwire id_15,
    input uwire id_16
    , id_18
);
  logic [id_14 : 1 'b0] id_19[1 : id_5] = id_18[id_4];
  module_0 modCall_1 (
      id_16,
      id_10
  );
  always @(posedge {1{-1}}) begin : LABEL_0
    id_12 <= id_16;
  end
  assign id_6 = 1'b0 ? id_10 == ((-1)) : -1;
  nand primCall (id_12, id_18, id_19, id_15, id_0, id_13, id_11, id_8, id_16, id_7, id_2);
endmodule
