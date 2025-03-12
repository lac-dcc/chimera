// Seed: 1122660429
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
  inout wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5, id_6;
endmodule
module module_2 #(
    parameter id_12 = 32'd78,
    parameter id_9  = 32'd5
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    _id_12,
    id_13
);
  inout reg id_13;
  input wire _id_12;
  input wire id_11;
  input wire id_10;
  inout wire _id_9;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1
  );
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_13 = id_9;
  logic [7:0][-1 : (  id_12  )] id_14;
  initial repeat (id_14.id_2) id_13 = #(id_14[id_9] : id_1 == id_1  : id_14) -1;
endmodule
