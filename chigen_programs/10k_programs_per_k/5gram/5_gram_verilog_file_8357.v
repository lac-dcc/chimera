// Seed: 806265726
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
  output tri id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  parameter id_9 = {1, 1} + 1;
  assign id_8 = id_2 == id_1;
  always
    repeat (-1) begin : LABEL_0
      wait (-1'b0);
    end
  assign module_1.id_1 = 0;
  assign id_8 = (id_4 == -1) == id_9;
  genvar id_10;
endmodule
module module_1;
  supply1 id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
