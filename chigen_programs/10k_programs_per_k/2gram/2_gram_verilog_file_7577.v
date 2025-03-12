// Seed: 679980480
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  assign module_1._id_3 = 0;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_12 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd13,
    parameter id_3 = 32'd98,
    parameter id_6 = 32'd90
) (
    input tri1  id_0,
    input uwire _id_1,
    inout tri0  id_2
    , _id_6,
    input tri1  _id_3,
    input wire  id_4
);
  wire [id_3 : id_6] id_7;
  logic [id_1 : 1] id_8;
  tri id_9 = -1 + id_4;
  real id_10;
  ;
  assign id_9 = id_0;
  wire id_11;
  wire id_12, id_13, id_14, id_15, id_16, id_17, id_18;
  wire id_19;
  wire id_20;
  wire id_21;
  ;
  module_0 modCall_1 (
      id_20,
      id_17,
      id_18,
      id_19,
      id_19,
      id_14,
      id_20,
      id_11,
      id_12,
      id_18,
      id_21
  );
  localparam id_22 = 1;
  specify
    (id_23 => id_24) = (1 ? id_10 : id_0  : 1  : id_8, id_22  : -1  : ~id_22);
    (id_25 => id_26) = 1;
  endspecify
endmodule
