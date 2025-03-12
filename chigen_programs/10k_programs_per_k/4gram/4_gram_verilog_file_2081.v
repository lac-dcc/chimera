// Seed: 719918612
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd14,
    parameter id_5 = 32'd76,
    parameter id_6 = 32'd16
) (
    id_1,
    _id_2,
    id_3
);
  input wire id_3;
  inout wire _id_2;
  output logic [7:0] id_1;
  parameter id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  logic [id_2 : 1] _id_5;
  ;
  logic _id_6[1  ^  id_5 : id_2];
  ;
  assign id_1[id_5] = id_6;
  assign id_1[id_6] = id_6;
  `define pp_7 0
  assign `pp_7 = id_4;
endmodule
