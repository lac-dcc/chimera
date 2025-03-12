// Seed: 232459000
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
endmodule
module module_1 ();
  wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_10 = 32'd90,
    parameter id_7  = 32'd23
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout logic [7:0] id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_5
  );
  input wire id_11;
  inout wire _id_10;
  input wire id_9;
  input wire id_8;
  input wire _id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_16 = 1;
  id_17 :
  assert property (@(posedge id_16 == -1) id_11)
  else $clog2(13);
  ;
  assign id_15[id_7<-1] = 1 < id_3[id_10];
endmodule
