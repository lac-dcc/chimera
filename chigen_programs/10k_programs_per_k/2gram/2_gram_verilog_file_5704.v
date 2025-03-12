// Seed: 3772182554
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout logic [7:0] id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_3[-1'b0];
endmodule
module module_1 #(
    parameter id_3 = 32'd66,
    parameter id_5 = 32'd52,
    parameter id_6 = 32'd17
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5
);
  input wire _id_5;
  inout logic [7:0] id_4;
  input wire _id_3;
  inout wire id_2;
  inout uwire id_1;
  assign id_1 = id_2 ? id_5 : 1;
  wire [-1 : id_3] _id_6;
  parameter id_7 = -1;
  assign id_4[""] = -1;
  wire id_8;
  ;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_4
  );
  assign id_1 = id_7;
  logic id_9;
  ;
  logic [{  id_5  ,  (  -1 'b0 )  } : (  id_6  )] id_10;
  ;
endmodule
