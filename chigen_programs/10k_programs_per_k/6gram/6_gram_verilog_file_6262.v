// Seed: 4169431342
module module_0 #(
    parameter id_8 = 32'd83
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_6 = id_2 == 1;
  wire id_7;
  wire _id_8;
  assign id_3 = $clog2(35);
  ;
  wire [id_8 : -1] id_9;
  logic id_10;
endmodule
module module_1 #(
    parameter id_3 = 32'd91
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  input wire id_4;
  inout wire _id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  logic [id_3 : 1] id_5;
  ;
  assign id_1['b0] = id_3;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_5,
      id_5
  );
  logic [{ "" -  1 'b0 ,  1  ,  1  }  &  1 'b0 : -1] id_6;
  ;
  not primCall (id_2, id_1);
endmodule
