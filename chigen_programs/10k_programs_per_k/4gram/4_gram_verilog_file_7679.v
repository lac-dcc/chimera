// Seed: 2214967280
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input logic [7:0] id_1;
  assign  id_2  =  1 'h0 ==  -1  ?  id_1  :  id_4  ?  1  :  id_4  ?  id_2  :  id_1  [  -1 'h0 ]  ?  id_1  :  1  ?  id_4  :  -1  ?  id_4  :  -1  ?  id_1  :  1  ?  id_2  :  1  ?  id_4  :  -1 'b0 ?  -1 'h0 :  1  ?  -1  :  id_1  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd68,
    parameter id_3 = 32'd39,
    parameter id_7 = 32'd12
) (
    input  tri1  _id_0,
    output tri0  id_1,
    output logic id_2,
    output wire  _id_3,
    output wire  id_4,
    output wand  id_5
);
  wire [-1 : id_0] _id_7;
  logic [7:0] id_8, id_9;
  logic [id_3 : 1] id_10;
  logic id_11;
  ;
  nor primCall (id_4, id_12, id_9, id_8, id_11, id_10);
  assign id_10 = "" || -1;
  wire id_12;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_10,
      id_12,
      id_12
  );
  assign modCall_1.id_2 = 0;
  always @(id_11 or posedge (-1)) id_2 = -1;
  generate
    assign id_1 = id_8[-1 : (id_7)];
  endgenerate
endmodule
