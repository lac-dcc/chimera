// Seed: 539145215
module module_0 #(
    parameter id_7 = 32'd87,
    parameter id_9 = 32'd25
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8
);
  inout wire id_8;
  inout wire _id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic _id_9;
  ;
  wire [id_7 : -1  -  id_9] id_10 = id_7;
endmodule
module module_1 #(
    parameter id_5 = 32'd4,
    parameter id_7 = 32'd7,
    parameter id_9 = 32'd59
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output tri1 id_2;
  input wire id_1;
  parameter id_5 = 1;
  wire [(  -1  ) : -1  &  1] id_6;
  assign id_2 = 1'b0;
  task _id_7(output id_8, input _id_9, [id_7 : id_5] id_10[id_9 : id_7], output [-1 : 1 'b0] id_11);
    logic [id_7 : id_5] id_12;
    id_12 <= id_1;
    ;
    struct packed {
      logic id_13;
      logic id_14;
    } id_15;
  endtask
  always id_11 <= id_9 | 1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_6,
      id_15,
      id_14,
      id_13,
      id_5,
      id_13
  );
  assign modCall_1.id_7 = 0;
endmodule
