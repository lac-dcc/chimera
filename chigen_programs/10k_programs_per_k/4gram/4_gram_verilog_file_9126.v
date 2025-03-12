// Seed: 3064425883
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout supply0 id_1;
  assign id_1#(
      .id_8(-1),
      .id_3(-1)
  ) = -1'h0;
  wire id_9;
endmodule
module module_1 #(
    parameter id_7 = 32'd21,
    parameter id_8 = 32'd55,
    parameter id_9 = 32'd79
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    _id_9
);
  input wire _id_9;
  input wire _id_8;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_3,
      id_2,
      id_1,
      id_4,
      id_5,
      id_5
  );
  input wire _id_7;
  output logic [7:0] id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6[id_8!==-1*id_7-id_9 : id_7] = 1;
endmodule
