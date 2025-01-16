// Seed: 1452724451
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
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_10;
  wire id_11;
  wire id_12, id_13;
endmodule
module module_1 #(
    parameter id_7 = 32'd53,
    parameter id_8 = 32'd92,
    parameter id_9 = 32'd86
) (
    id_1,
    id_2,
    id_3#(
        .id_4(1'b0),
        .id_5(id_6[(1?_id_7 : 1&&_id_8)][~_id_9])
    ),
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire _id_9;
  output wire _id_8;
  input wire _id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_13 = 1'b0;
  module_0 modCall_1 (
      id_16,
      id_17,
      id_13,
      id_13,
      id_18,
      id_12,
      id_14,
      id_14,
      id_17
  );
endmodule
