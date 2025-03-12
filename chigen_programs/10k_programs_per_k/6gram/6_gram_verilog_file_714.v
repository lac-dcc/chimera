// Seed: 3056002888
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd56,
    parameter id_11 = 32'd11,
    parameter id_3  = 32'd42,
    parameter id_8  = 32'd29
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    _id_10,
    _id_11,
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  output wire _id_11;
  input wire _id_10;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_7,
      id_9,
      id_5
  );
  inout wire id_9;
  inout wire _id_8;
  inout wire id_7;
  output logic [7:0] id_6;
  output wire id_5;
  output wire id_4;
  input wire _id_3;
  inout wire id_2;
  output wire id_1;
  wire [id_8  !==  id_8 : id_3] id_14;
  assign id_7 = 1;
  wire id_15;
  struct packed {
    logic [id_11 : 1 'h0 &  id_10] id_16;
    id_17 id_18;
  } [-1 : -1] id_19 = 1;
  assign id_6[1] = id_2 && id_14 == id_19.id_16;
  wire id_20;
  ;
  logic [-1 : 'b0 * "" -  1 'b0 %  id_8] id_21;
endmodule
