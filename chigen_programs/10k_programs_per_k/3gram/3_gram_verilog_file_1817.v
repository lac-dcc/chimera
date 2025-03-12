// Seed: 3514960111
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_5;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2
  );
  wire id_5;
endmodule
module module_2 #(
    parameter id_4 = 32'd10
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_1
  );
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire [-1 : id_4] id_5;
endmodule
