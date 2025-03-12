// Seed: 2155316428
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_10 = 32'd25,
    parameter id_4  = 32'd44,
    parameter id_5  = 32'd90,
    parameter id_8  = 32'd5
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7
);
  output logic [7:0] id_7;
  inout wire id_6;
  input wire _id_5;
  output wire _id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [1 : 1] _id_8;
  ;
  logic [1 : 1 'b0] id_9;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_1,
      id_2,
      id_2,
      id_6,
      id_6
  );
  logic [id_5  +  -1 : -1] _id_10;
  wire id_11;
  logic [{  {  id_4  ,  1  }  ,  1 'h0 } : id_10] id_12;
  ;
endmodule
