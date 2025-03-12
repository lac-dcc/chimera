// Seed: 4127746405
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always #1 begin : LABEL_0
    deassign id_3;
  end
endmodule
module module_1 #(
    parameter id_4 = 32'd80,
    parameter id_8 = 32'd56
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  inout wire _id_8;
  nand primCall (id_3, id_7, id_6, id_5);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_5,
      id_1
  );
  output wire _id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  logic [id_8  ==  id_4 : 1] id_9;
endmodule
