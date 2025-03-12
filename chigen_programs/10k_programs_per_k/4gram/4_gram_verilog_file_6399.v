// Seed: 3358581574
module module_0 #(
    parameter id_10 = 32'd84
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  output supply0 id_14;
  output supply1 id_13;
  output wire id_12;
  output wire id_11;
  inout wire _id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_14 = -1;
  wire [1 : -1  -  id_10] id_16;
  wire id_17;
  ;
  wire id_18;
  id_19 :
  assert property (@(posedge id_13++) 1)
  else $signed(86);
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd19,
    parameter id_3 = 32'd24
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout logic [7:0] id_5;
  input wire id_4;
  inout wire _id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_5[id_3*id_2] = 1'b0;
  assign id_2 = id_5;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_6,
      id_6,
      id_1,
      id_6,
      id_6,
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_6,
      id_1,
      id_6
  );
endmodule
