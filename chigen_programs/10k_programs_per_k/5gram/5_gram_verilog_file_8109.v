// Seed: 2461986401
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd65
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7
);
  input wire _id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_3,
      id_4
  );
  inout wire id_2;
  input wire id_1;
  wire [-1 : id_7] id_8;
endmodule
