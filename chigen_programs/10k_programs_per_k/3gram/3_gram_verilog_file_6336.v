// Seed: 2648463063
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_4;
endmodule
module module_1 #(
    parameter id_2 = 32'd43,
    parameter id_3 = 32'd63
) (
    id_1,
    _id_2,
    _id_3
);
  input wire _id_3;
  inout wire _id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire [id_3 : id_2] id_4;
endmodule
module module_2 #(
    parameter id_1 = 32'd73
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire _id_1;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_4,
      id_4
  );
  wire [{  -1  ,  id_1  } : -1] id_6;
endmodule
