// Seed: 2622846489
module module_0 (
    input  tri   id_0,
    input  uwire id_1,
    output tri0  id_2
);
  assign id_2 = 1'd0;
endmodule
module module_1 #(
    parameter \id_11 = 32'd26,
    parameter id_8   = 32'd84
) (
    input wire id_0,
    input wire id_1,
    input tri1 id_2,
    input tri id_3,
    input supply1 id_4,
    output tri id_5,
    output uwire id_6,
    output wire id_7,
    input tri1 _id_8,
    output tri1 id_9
);
  assign id_9 = -1;
  and primCall (id_7, id_3, id_12, id_0, id_2);
  wire _ \id_11 ;
  reg [-1 'h0 : \id_11  >>  id_8  &&  -1 'b0] id_12 = id_8;
  initial begin : LABEL_0
    id_12 <= id_1 <= 1;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_7
  );
  assign modCall_1.id_2 = 0;
endmodule
