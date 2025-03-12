// Seed: 2501338447
module module_0 (
    input tri0  id_0,
    input uwire id_1,
    input tri0  id_2,
    input wire  id_3
);
endmodule
module module_1 #(
    parameter id_3 = 32'd40,
    parameter id_5 = 32'd22
) (
    input  uwire id_0,
    output logic id_1,
    input  tri   id_2,
    input  wor   _id_3
);
  generate
    always @(negedge id_3) id_1 = 1;
  endgenerate
  wire _id_5;
  wire [-1  +  id_3 : id_3] id_6;
  parameter id_7 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_0 = 0;
  logic id_8;
  ;
  wire id_9;
  logic [id_5  &  -1 : 1] id_10 = id_5;
  wire id_11;
  wire id_12;
endmodule
