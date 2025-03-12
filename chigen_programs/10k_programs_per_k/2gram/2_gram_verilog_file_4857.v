// Seed: 926492331
module module_0 (
    output tri   id_0,
    input  uwire id_1
);
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    output uwire id_2
);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  assign id_2 = id_0;
  buf primCall (id_2, id_0);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_3 #(
    parameter id_3 = 32'd43,
    parameter id_6 = 32'd35
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6
);
  inout wire _id_6;
  input wire id_5;
  output wire id_4;
  input wire _id_3;
  output wire id_2;
  output wire id_1;
  wire [(  -1  ) : id_3  +  (  id_3  )] id_7;
  logic [7:0][id_3 : id_3] id_8;
  module_2 modCall_1 (
      id_7,
      id_7,
      id_5,
      id_7,
      id_1,
      id_7,
      id_7,
      id_7,
      id_4,
      id_5,
      id_7
  );
  assign id_8 = (id_8[id_6]);
endmodule
