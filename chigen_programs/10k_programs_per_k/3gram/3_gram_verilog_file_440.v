// Seed: 472937730
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_10;
endmodule
module module_1 #(
    parameter id_14 = 32'd83,
    parameter id_9  = 32'd77
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  output logic [7:0] id_17;
  inout wire id_16;
  output wire id_15;
  inout wire _id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_16,
      id_4,
      id_4,
      id_6,
      id_12,
      id_3,
      id_16
  );
  input wire id_10;
  input wire _id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_19;
  ;
  assign id_17 = {id_12, id_16};
  tri id_20 = -1;
  if (1) assign id_17[id_9] = "";
  else begin : LABEL_0
    logic [id_14 : 1] id_21;
    ;
  end
endmodule
