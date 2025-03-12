// Seed: 3760349697
module module_0 #(
    parameter id_6 = 32'd6,
    parameter id_8 = 32'd97
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5[id_6 : 1'b0],
    _id_6,
    id_7,
    _id_8,
    id_9
);
  output wire id_9;
  output wire _id_8;
  output wire id_7;
  input wire _id_6;
  output logic [7:0] id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_10[1 : id_8];
  assign id_9 = id_4;
endmodule
module module_1 #(
    parameter id_2 = 32'd38
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire _id_2;
  output wire id_1;
  struct packed {logic id_5;} id_6;
  parameter id_7 = 1'b0;
  assign id_3 = id_2.id_7;
  logic id_8, id_9 = id_7;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6,
      id_3,
      id_8,
      id_7,
      id_3,
      id_7,
      id_5
  );
  assign id_8[id_2] = id_8;
  assign id_6.id_5[1'b0] = 1;
endmodule
