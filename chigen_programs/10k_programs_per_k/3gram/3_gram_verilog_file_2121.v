// Seed: 2386658865
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  wire  id_3,
    input  tri1  id_4
);
  logic id_6;
  ;
  assign id_6 = 1;
  assign id_0 = -1;
  genvar id_7;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input wor id_1,
    input uwire id_2,
    input wire id_3,
    input uwire id_4,
    input tri0 id_5,
    output supply0 id_6
);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_2,
      id_5
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
endmodule
module module_3 #(
    parameter id_17 = 32'd12,
    parameter id_9  = 32'd9
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_7;
  wire id_8, _id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16;
  wire _id_17;
  wire [id_17 : {  id_9  *  1 'b0 ,  1 'b0 }] id_18;
  assign id_2 = id_8;
  xnor primCall (id_5, id_8, id_6, id_13, id_15, id_3, id_19, id_10);
  parameter id_19 = 1;
  module_2 modCall_1 (
      id_3,
      id_12,
      id_14,
      id_18,
      id_10,
      id_3,
      id_7
  );
endmodule
