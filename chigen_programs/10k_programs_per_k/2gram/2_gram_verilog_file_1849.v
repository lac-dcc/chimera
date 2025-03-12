// Seed: 123979768
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always begin : LABEL_0
    if (-1'h0) @(posedge "");
  end
endmodule
module module_1 #(
    parameter id_12 = 32'd63,
    parameter id_8  = 32'd15,
    parameter id_9  = 32'd19
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5#(
        .id_6 (id_7[1&&-1&&_id_8&&1+_id_9]),
        .id_10(1 & id_11[_id_12]),
        .id_13(-1)
    ),
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  output wire id_14;
  output wire id_13;
  output wire _id_12;
  output logic [7:0] id_11;
  inout wire id_10;
  module_0 modCall_1 (
      id_3,
      id_22,
      id_20,
      id_22,
      id_10,
      id_22,
      id_16,
      id_15,
      id_19,
      id_4,
      id_6,
      id_6,
      id_20,
      id_15,
      id_10,
      id_15,
      id_20
  );
  output wire _id_9;
  input wire _id_8;
  inout logic [7:0] id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  and primCall (id_13, id_4, id_16, id_18, id_17, id_22, id_10, id_21, id_15, id_6, id_19);
  output wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
