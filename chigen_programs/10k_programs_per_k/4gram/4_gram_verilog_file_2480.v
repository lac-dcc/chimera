// Seed: 3238243521
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd28,
    parameter id_2 = 32'd29
) (
    _id_1,
    _id_2
);
  input wire _id_2;
  input wire _id_1;
  logic [7:0][id_1 : id_2] id_3;
  wire id_4;
  assign id_3[1] = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
