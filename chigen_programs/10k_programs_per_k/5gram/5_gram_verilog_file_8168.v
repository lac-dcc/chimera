// Seed: 3374634906
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
    id_10
);
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout uwire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3#(
      .id_3(1),
      .id_9(1)
  ) = id_9 && id_7;
endmodule
module module_1 #(
    parameter id_11 = 32'd4
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
    id_10,
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  inout tri id_14;
  input wire id_13;
  output wire id_12;
  inout wire _id_11;
  output wire id_10;
  inout wire id_9;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_14,
      id_9,
      id_9,
      id_9,
      id_6,
      id_8,
      id_13,
      id_12
  );
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_14 = 1;
  id_16 :
  assert property (@(posedge -1 == !id_14) 1)
  else $signed(73);
  ;
  wire [id_11 : -1 'd0] id_17;
endmodule
