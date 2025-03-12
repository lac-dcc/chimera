// Seed: 565424799
module module_0;
  logic id_1;
  assign module_2.id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd29
) ();
  logic [7:0] id_1;
  wire _id_2 = id_1[id_2];
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_0 = 32'd90
) (
    input wand _id_0,
    input supply1 id_1,
    input wire id_2,
    input tri id_3,
    output wire id_4
);
  buf primCall (id_4, id_6);
  logic [7:0][1 : -1] id_6;
  assign id_6[id_0] = -1'b0 != id_6 + id_1;
  module_0 modCall_1 ();
endmodule
module module_3 #(
    parameter id_3 = 32'd3,
    parameter id_4 = 32'd6,
    parameter id_6 = 32'd63
) (
    id_1,
    id_2
);
  output logic [7:0] id_2;
  output logic [7:0] id_1;
  wire _id_3;
  wire _id_4;
  wire [-1 : id_3] id_5;
  parameter id_6 = 1;
  wire id_7;
  parameter id_8 = id_6;
  assign id_5 = id_3;
  logic [id_6 : 1] id_9 = 1;
  assign id_1 = (id_5);
  module_0 modCall_1 ();
  wire id_10;
  ;
  assign id_2[id_4] = -1;
  assign id_1[-1]   = id_3;
  parameter id_11 = id_8[id_4];
  wire id_12;
  always @(id_6 or posedge id_6 ^ -1) begin : LABEL_0
    assert  (  id_9  ||  -1  &  {  1  ,  1  -  id_10  ,  id_8  ,  id_9  ,  1 'h0 ,  id_6  ,  1  }  ||  id_12  &&  -1 'b0 &&  -1  ||  1  ||  id_8  )  ;
  end
endmodule
