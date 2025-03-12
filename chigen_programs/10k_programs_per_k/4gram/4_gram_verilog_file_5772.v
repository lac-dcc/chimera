// Seed: 1146079738
module module_0 #(
    parameter id_4 = 32'd2
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire _id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire [id_4 : -1] id_8, id_9;
endmodule
module module_1 #(
    parameter id_3 = 32'd11,
    parameter id_4 = 32'd40,
    parameter id_5 = 32'd67
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  input wire id_2;
  output logic [7:0] id_1;
  assign id_1[id_3] = id_3;
  localparam id_4 = -1;
  parameter id_5 = id_4 || ~id_4;
  assign id_1[-1] = id_3;
  assign id_1 = id_4;
  localparam id_6 = -1;
  assign id_1[!id_5-id_3&-1] = id_3;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_5,
      id_6,
      id_6,
      id_2
  );
  parameter id_7 = -1;
endmodule
