// Seed: 649212834
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
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_10 = id_7;
endmodule
module module_1 #(
    parameter id_1 = 32'd69,
    parameter id_2 = 32'd52
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
  input wire _id_2;
  input wire _id_1;
  logic id_5[id_1  ==  -1 : (  id_2  )];
  ;
  assign id_5[-1'd0] = ~id_1 | -1;
endmodule
