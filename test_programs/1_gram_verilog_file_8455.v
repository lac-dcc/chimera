// Seed: 1090525786
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_2 = -1'd0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(.id_7(id_8.id_9)),
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  final id_3 <= id_5;
  always_ff
    if (-1) begin : LABEL_0
      #1 $display(-1 && id_4);
      id_6 = id_5;
    end
  module_0 modCall_1 (
      id_12,
      id_13
  );
  assign modCall_1.id_2 = 0;
endmodule
