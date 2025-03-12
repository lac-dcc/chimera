// Seed: 3220838234
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout tri id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_8 = id_2 === -1;
endmodule
module module_1 #(
    parameter id_14 = 32'd8,
    parameter id_5  = 32'd16
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_8,
      id_3,
      id_8,
      id_1,
      id_2,
      id_1
  );
  input wire _id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire [1 : -1] id_9;
  logic [7:0] id_10;
  logic [7:0][-1 : ""] id_11, id_12;
  assign id_3 = id_3;
  assign id_6 = id_2;
  wire id_13;
  localparam id_14 = 1;
  assign id_10[id_5] = id_12[id_14] ? 1 : id_5 && id_6;
endmodule
