// Seed: 4241128674
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  uwire id_6;
  assign id_6 = 1;
  parameter id_7 = -1;
  logic id_8 = !id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd59,
    parameter id_2 = 32'd73
) (
    _id_1,
    _id_2,
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
  output wire id_9;
  output tri id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_7,
      id_10,
      id_3
  );
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire _id_2;
  input wire _id_1;
  id_11 :
  assert property (@(posedge id_6++) id_3)
  else $signed(51);
  ;
  assign id_8 = ~id_7 ? id_4 : -1;
  logic [id_2 : id_1  | ""] id_12;
  ;
endmodule
