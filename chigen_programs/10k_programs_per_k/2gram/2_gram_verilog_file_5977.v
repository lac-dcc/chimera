// Seed: 3276364018
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd10
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  inout wire id_5;
  xnor primCall (id_2, id_7, id_3, id_5, id_9, id_8, id_6);
  input wire _id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  parameter id_6 = 1;
  logic [{  id_4  {  -1  }  } : 1] id_7;
  ;
  assign id_7[id_4] = id_4 - {1, !id_1, id_4, id_3 * (-1), id_3, id_3};
  wire id_8;
  parameter id_9 = id_6;
  assign id_3[-1'b0] = id_6;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_6,
      id_2
  );
endmodule
