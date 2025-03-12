// Seed: 2589494082
module module_0 #(
    parameter id_8 = 32'd71
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_6 = id_6 & id_1;
  assign id_6 = id_6 ? id_1 : -1;
  wire module_0;
  logic [7:0] id_7;
  genvar _id_8;
  initial $clog2(12);
  ;
  localparam id_9 = 1;
  assign id_7[id_8] = ~id_7;
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
    .id_17(id_9),
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_3,
      id_5,
      id_10
  );
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  nor primCall (id_10, id_14, id_12, id_9, id_3, id_2, id_7, id_17, id_6, id_8, id_15);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_18;
endmodule
