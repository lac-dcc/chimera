// Seed: 2580036856
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output tri id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  string id_11 = "";
  assign id_6 = 1;
  assign id_9 = id_7;
endmodule
module module_1 #(
    parameter id_4 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.id_6 = 0;
  wire [1 : -1  ||  id_4] id_5;
endmodule
