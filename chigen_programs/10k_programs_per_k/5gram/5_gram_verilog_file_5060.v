// Seed: 1232982318
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout uwire id_2;
  output wire id_1;
  assign id_2 = -1'b0;
  logic id_7;
  ;
endmodule
module module_1 #(
    parameter id_8 = 32'd5
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9
);
  output wire id_9;
  inout wire _id_8;
  input wire id_7;
  output logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  assign id_2[id_8+:-1'h0] = id_5;
  logic [1 'b0 : 1] id_10;
  always_ff @(id_1 - id_10) if (-1'b0) id_6[1 : 1] = -1;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_10,
      id_1,
      id_5,
      id_3
  );
endmodule
