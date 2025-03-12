// Seed: 3322612878
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
    id_10
);
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout uwire id_2;
  output wire id_1;
  assign id_2 = -1;
endmodule
module module_1 #(
    parameter id_6 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire _id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_1,
      id_4,
      id_5,
      id_7,
      id_7,
      id_8,
      id_7
  );
  output wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_7 or posedge id_5) id_3[id_6] = id_5;
endmodule
