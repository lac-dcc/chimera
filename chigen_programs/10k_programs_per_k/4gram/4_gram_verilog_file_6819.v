// Seed: 905457830
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_21;
endmodule
module module_1 #(
    parameter id_4 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire _id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  integer id_12 = id_10;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_11,
      id_8,
      id_11,
      id_11,
      id_11,
      id_8,
      id_9,
      id_12,
      id_10,
      id_9,
      id_11,
      id_7,
      id_3,
      id_10
  );
  assign id_8 = id_3;
  assign id_8 = id_3;
  logic id_13;
  wire  id_14;
  ;
  assign id_10 = id_6;
  wire id_15, id_16;
  assign id_2[id_4] = -1;
  id_17 :
  assert property (@(posedge id_13) id_9)
  else $signed(79);
  ;
endmodule
