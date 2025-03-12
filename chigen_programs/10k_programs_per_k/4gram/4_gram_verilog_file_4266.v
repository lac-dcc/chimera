// Seed: 3837868853
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout tri id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = id_4 - id_6;
endmodule
module module_1 #(
    parameter id_3 = 32'd99
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire _id_3;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_2,
      id_4,
      id_4,
      id_7,
      id_7,
      id_4
  );
  assign modCall_1.id_5 = 0;
  input wire id_2;
  output wire id_1;
  logic [-1 : {  id_3  <  -1  ,  1  ,  -1  ,  1 'b0 ==?  -1  }] id_8;
  ;
endmodule
