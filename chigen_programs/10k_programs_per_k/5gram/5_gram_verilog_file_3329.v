// Seed: 1054774502
module module_0 (
    input tri id_0,
    input wor id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wire id_4
);
  wire id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_8 = 32'd94
) (
    input tri1 id_0,
    input tri id_1,
    output supply1 id_2,
    input wor id_3,
    output supply1 id_4,
    input wand id_5,
    input uwire id_6,
    output tri id_7,
    input tri0 _id_8
);
  logic [-1 : -1 'b0] id_10;
  localparam id_11 = 1;
  assign id_7 = ~id_5 == {id_1, -1};
  assign id_7 = id_11;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_3,
      id_7,
      id_3
  );
  id_12 :
  assert property (@(posedge id_1) 1)
  else $signed(94);
  ;
  assign id_2  = -1'h0;
  assign id_12 = id_11;
  logic [id_8 : -1  <  1] id_13;
endmodule
