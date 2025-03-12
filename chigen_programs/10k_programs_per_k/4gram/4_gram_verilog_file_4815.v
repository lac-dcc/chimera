// Seed: 3076494236
module module_0;
  logic [-1 'h0 : 1] id_1;
  ;
  assign id_1 = 1'b0;
  assign id_1 = 1'h0;
  localparam id_2 = {-1, 1, -1};
  assign id_1 = id_2;
  uwire [1 : 1  +  1 'b0] id_3 = 1;
  uwire id_4 = -1;
  logic id_5;
endmodule
module module_1 #(
    parameter id_3 = 32'd9,
    parameter id_4 = 32'd65
) (
    output supply0 id_0,
    output uwire id_1,
    input tri0 id_2,
    input supply1 _id_3,
    input tri0 _id_4,
    output supply1 id_5,
    input tri id_6,
    input supply1 id_7,
    input supply1 id_8,
    output supply1 id_9
    , id_16,
    output tri1 id_10,
    input tri id_11,
    output uwire id_12,
    output supply1 id_13,
    input uwire id_14
);
  wire [(  id_4  ) : id_3] id_17;
  nor primCall (id_0, id_11, id_14, id_16, id_17, id_2, id_6, id_7, id_8);
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
endmodule
