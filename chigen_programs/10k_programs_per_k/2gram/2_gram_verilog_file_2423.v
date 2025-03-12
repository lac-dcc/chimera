// Seed: 2702367899
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
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
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3
  );
endmodule
module module_2 #(
    parameter id_7 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire _id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output tri0 id_3;
  input wire id_2;
  input wire id_1;
  logic id_11;
  ;
  assign id_3 = id_1;
  parameter id_12 = 1;
  assign id_3 = -1;
  logic [(  id_7  ) : 1] id_13;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_8
  );
  and primCall (id_4, id_8, id_12, id_5, id_1, id_11, id_9, id_13, id_6, id_2);
  assign id_4 = id_12;
  wire id_14;
endmodule
