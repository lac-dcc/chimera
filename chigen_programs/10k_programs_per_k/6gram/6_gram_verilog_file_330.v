// Seed: 957021099
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output tri0 id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  genvar id_5;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd82,
    parameter id_3 = 32'd35
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output reg id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire _id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
  input wire _id_2;
  inout wire id_1;
  struct packed {
    logic [id_3 : id_2] id_8;
    logic [-1 : 1] id_9;
  } id_10;
  always @(posedge (~id_10.id_8 && id_6)) begin : LABEL_0
    id_7 = -1;
  end
endmodule
