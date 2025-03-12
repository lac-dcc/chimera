// Seed: 1167064008
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
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_11;
  ;
  wire id_12;
endmodule
module module_1 #(
    parameter id_4 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire _id_4;
  inout wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7,
      id_1,
      id_9,
      id_7,
      id_7,
      id_8,
      id_8,
      id_7
  );
  output wire id_1;
  assign id_3 = 1'b0;
  wire [-1 'b0 : id_4] id_10;
  always @(id_9 - id_10) $clog2(92);
  ;
endmodule
