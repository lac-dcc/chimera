// Seed: 1400133042
module module_0 #(
    parameter id_2 = 32'd11,
    parameter id_3 = 32'd5,
    parameter id_5 = 32'd34
) (
    id_1,
    _id_2,
    _id_3,
    id_4
);
  output wire id_4;
  inout wire _id_3;
  input wire _id_2;
  input wire id_1;
  wire _id_5;
  logic [id_3  -  1 'd0 : (  1  )] id_6;
  ;
  logic [-1 'h0 +  id_2 : 1 'b0] id_7;
  ;
  wire [1  *  1  -  -1 : id_5] id_8;
endmodule
module module_1 #(
    parameter id_3 = 32'd34
) (
    id_1,
    id_2
);
  inout wire id_2;
  inout logic [7:0] id_1;
  localparam id_3 = 1;
  logic id_4;
  ;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.id_2 = 0;
  assign id_1[id_3] = id_1 == id_2;
endmodule
