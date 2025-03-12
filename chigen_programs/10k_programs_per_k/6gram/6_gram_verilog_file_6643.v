// Seed: 3599492632
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  timeprecision 1ps;
endmodule
module module_1 #(
    parameter id_10 = 32'd49,
    parameter id_6  = 32'd89
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    _id_10
);
  output wire _id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire _id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_11;
  logic [id_6  >=  id_10 : id_6] id_12;
  assign id_11 = id_7;
  logic id_13;
  ;
  module_0 modCall_1 (
      id_13,
      id_7,
      id_11,
      id_9
  );
  always @(negedge 1 != id_6) begin : LABEL_0
    wait ((-1));
  end
endmodule
