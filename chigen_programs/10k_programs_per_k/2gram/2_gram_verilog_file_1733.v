// Seed: 885004332
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5 = ~1;
endmodule
module module_1 #(
    parameter id_1 = 32'd79
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_8,
      id_5,
      id_7,
      id_5,
      id_6
  );
  input wire _id_1;
  wire [-1 : id_1] id_9;
  assign id_8 = id_5;
endmodule
