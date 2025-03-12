// Seed: 65436413
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_7;
  ;
endmodule
module module_1 #(
    parameter id_5 = 32'd36,
    parameter id_6 = 32'd27
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6
);
  inout wire _id_6;
  inout wire _id_5;
  inout wire id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4
  );
  output wire id_1;
  assign id_5 = id_2[1] ? id_4 : id_4;
  wire [-1 : 1] id_7;
  logic [id_5 : id_6] id_8;
  ;
  struct packed {logic id_9;} id_10;
  ;
endmodule
