// Seed: 4147272881
module module_0 #(
    parameter id_1  = 32'd2,
    parameter id_15 = 32'd81
) (
    _id_1,
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
    _id_15
);
  output wire _id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire _id_1;
  logic id_16;
  wire [-1 : id_15  &&  id_1] id_17;
  logic id_18;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd8,
    parameter id_5 = 32'd90
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6
);
  inout wire id_6;
  inout wire _id_5;
  output logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  inout tri0 id_1;
  assign id_5 = id_1;
  assign id_1 = -1;
  logic [7:0][id_5 : id_3] id_7;
  parameter id_8 = -1;
  for (id_9 = 1; id_9 < {id_7[""], id_7}; id_1++) begin : LABEL_0
    assign id_4[1 :-1] = id_3;
  end
  module_0 modCall_1 (
      id_5,
      id_1,
      id_6,
      id_1,
      id_8,
      id_6,
      id_2,
      id_8,
      id_8,
      id_1,
      id_1,
      id_9,
      id_8,
      id_9,
      id_5
  );
endmodule
