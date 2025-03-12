// Seed: 346712463
module module_0 #(
    parameter \id_4 = 32'd56
) (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire _ \id_4 ;
  logic id_5, id_6[-1 : \id_4 ];
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd93,
    parameter id_4 = 32'd18
) (
    _id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  input wire _id_1;
  wire id_5;
  assign id_2[1] = id_5;
  logic [-1  |  id_4 : id_1] id_6;
  id_7 :
  assert property (@(posedge id_1 or -1) id_4)
  else;
  initial id_7 = -1'b0 - 1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5
  );
  wire id_8;
  assign id_8 = id_1;
endmodule
