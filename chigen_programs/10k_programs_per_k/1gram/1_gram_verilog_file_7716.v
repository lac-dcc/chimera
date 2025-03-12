// Seed: 1636425356
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout tri0 id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = id_1;
  assign id_4 = 1;
  timeprecision 1ps;
  parameter id_5 = 1;
  logic id_6;
endmodule
module module_1 #(
    parameter id_0 = 32'd84,
    parameter id_1 = 32'd96,
    parameter id_3 = 32'd24
) (
    output wor _id_0,
    input  wor _id_1[-1 'b0 : id_1  &  id_0]
);
  localparam id_3 = 1;
  wire [id_3 : id_3] id_4;
  wire id_5, id_6;
  wire [-1 'd0 : id_1] \id_7 ;
  id_8 :
  assert property (@(posedge id_5 or posedge 1'b0 & id_3) id_6) if (-1);
  module_0 modCall_1 (
      id_4,
      \id_7 ,
      id_4,
      id_5
  );
  always @(posedge id_5);
  wire id_9[id_0 : id_1];
  ;
endmodule
