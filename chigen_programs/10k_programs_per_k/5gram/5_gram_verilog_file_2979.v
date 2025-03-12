// Seed: 1052243472
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output supply1 id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = (id_2 < id_8) ? id_5 : -1;
endmodule
module module_1 #(
    parameter id_12 = 32'd92,
    parameter id_8  = 32'd15
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14
);
  inout wire id_14;
  input wire id_13;
  output wire _id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire _id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_7,
      id_4,
      id_1,
      id_4,
      id_4,
      id_9
  );
  inout wire id_1;
  id_15 :
  assert property (@(posedge !id_3) -1)
  else $clog2(16);
  ;
  wire [-1 'd0 : -1] id_16;
  wire [-1 : id_8  !=  id_12] id_17;
endmodule
