// Seed: 519891672
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd35
) (
    _id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire _id_1;
  wire [-1 'h0 : id_1  -  1] id_4;
  bufif1 primCall (id_2, id_3, id_4);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_2
  );
endmodule
module module_2 #(
    parameter id_6 = 32'd56
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_8,
      id_1
  );
  input wire _id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input logic [7:0] id_2;
  inout wire id_1;
  assign id_9 = id_2[id_6];
endmodule
