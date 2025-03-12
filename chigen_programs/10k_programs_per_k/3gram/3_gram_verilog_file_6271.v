// Seed: 2586203960
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_6;
  ;
  assign id_6 = id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd50,
    parameter id_3 = 32'd87
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire _id_3;
  input wire id_2;
  input wire _id_1;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_5,
      id_5,
      id_5
  );
  wire  id_6;
  logic id_7 [id_3 : id_1];
  ;
endmodule
