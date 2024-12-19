// Seed: 4102673424
module module_0 #(
    parameter id_8 = 32'd62,
    parameter id_9 = 32'd27
) (
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
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  defparam id_8.id_9 = id_9;
  assign id_8 = id_8;
  wire id_10;
endmodule
module module_1 (
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
    id_16
);
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always #1 begin : LABEL_0
    id_12 <= 1;
  end
  and primCall (id_12, id_8, id_15, id_5, id_11, id_2, id_9, id_1, id_10, id_16, id_7);
  module_0 modCall_1 (
      id_6,
      id_9,
      id_15,
      id_3,
      id_14,
      id_7,
      id_8
  );
  assign id_12 = id_5[1-(1'b0)][1];
  assign id_6  = 1;
  assign id_3  = 1;
  id_17(
      .id_0(1), .id_1(1), .id_2(1), .id_3((id_13)), .id_4(1)
  );
  initial begin : LABEL_0
    id_2 <= 1;
  end
endmodule
