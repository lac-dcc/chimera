// Seed: 1036451908
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
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  localparam id_10 = -1'b0;
  assign id_8 = -1'b0;
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = {id_2{id_1}};
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
