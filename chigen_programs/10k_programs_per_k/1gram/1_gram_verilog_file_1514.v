// Seed: 1457882587
module module_0 (
    id_1,
    id_2
);
  output supply1 id_2;
  input wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
  wire id_4;
endmodule
module module_2 #(
    parameter id_10 = 32'd80,
    parameter id_13 = 32'd41,
    parameter id_3  = 32'd2
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6[id_3 : id_13],
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15
);
  output wire id_15;
  inout tri id_14;
  output wire _id_13;
  inout wire id_12;
  inout wire id_11;
  input wire _id_10;
  input wire id_9;
  output wire id_8;
  module_0 modCall_1 (
      id_12,
      id_12
  );
  inout wire id_7;
  output logic [7:0] id_6;
  input wire id_5;
  input wire id_4;
  inout wire _id_3;
  inout wire id_2;
  output wire id_1;
  parameter id_16 = -1;
  wire id_17;
  localparam id_18 = 1;
  wire  id_19;
  wire  id_20;
  logic id_21;
  ;
  wire [id_10 : -1] id_22, id_23;
  assign id_14 = -1;
endmodule
