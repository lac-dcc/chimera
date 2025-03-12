// Seed: 3973048019
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd62,
    parameter id_3 = 32'd28
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  input wire _id_3;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_1,
      id_4
  );
  input wire _id_2;
  inout wire id_1;
  struct packed {
    struct packed {
      logic [-1  -  id_2 : -1] id_7;
      logic [id_3 : id_2] id_8;
    } [-1 : 1] id_9;
  } id_10;
  assign id_5[1] = id_10.id_8;
endmodule
