// Seed: 2802935048
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge 1 or posedge 1) release id_7;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  inout wire id_4;
  buf primCall (id_4, id_6);
  input wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  logic id_6 = id_6;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_6,
      id_4,
      id_4,
      id_2,
      id_4
  );
  assign id_6 = id_1[id_5];
endmodule
