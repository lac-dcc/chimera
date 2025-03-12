// Seed: 1641471644
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
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout supply0 id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_10;
  ;
  assign id_6 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd16,
    parameter id_3 = 32'd66
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  inout wire _id_3;
  inout wire _id_2;
  input wire id_1;
  logic [-1 : id_3] id_7;
  wire id_8;
  ;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_4,
      id_7,
      id_7,
      id_4
  );
  assign id_5[id_2] = 1'b0 ? -1 : 1;
endmodule
