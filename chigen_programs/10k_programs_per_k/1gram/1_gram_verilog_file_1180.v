// Seed: 1509627719
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  logic id_3;
  ;
  assign id_3 = id_1;
endmodule
module module_1 #(
    parameter id_7 = 32'd93
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
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire _id_7;
  output wire id_6;
  output wor id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  localparam [1 : id_7] id_14 = -1;
  integer id_15;
  initial $unsigned(63);
  ;
  assign id_5 = -1;
  logic id_16;
  assign id_2 = id_13;
  wire id_17;
  module_0 modCall_1 (
      id_12,
      id_17
  );
  wire id_18 = id_16;
  wire id_19;
  ;
  initial
    if (id_14)
      @(negedge 1, id_16)
        if (id_14 & id_14[1'd0]) id_16 = id_12 - -1'b0;
        else id_15 <= id_16 ==? 1;
  assign id_6 = id_4, id_12 = id_3;
endmodule
