// Seed: 3418943874
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_4 = -1;
  logic id_5;
  ;
  wire id_6;
endmodule
module module_1 #(
    parameter id_10 = 32'd39,
    parameter id_17 = 32'd34,
    parameter id_22 = 32'd21,
    parameter id_3  = 32'd59
) (
    id_1,
    id_2,
    _id_3,
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
    id_15,
    id_16,
    _id_17
);
  inout wire _id_17;
  output wire id_16;
  inout logic [7:0] id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire _id_10;
  inout wire id_9;
  input wire id_8;
  output logic [7:0] id_7;
  output uwire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire _id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = -1;
  wire id_18;
  parameter id_19 = (1);
  parameter id_20 = id_19 == -1;
  module_0 modCall_1 (
      id_1,
      id_13,
      id_20
  );
  wire [id_10 : id_10] id_21;
  assign id_7[id_3] = id_1;
  wire [1 : id_17] _id_22;
  generate
    always @* begin : LABEL_0
      assume (id_13 == id_19);
    end
  endgenerate
  assign id_15[id_22] = 1;
endmodule
