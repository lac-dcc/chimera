// Seed: 954915364
module module_0 (
    output uwire id_0,
    input  tri   id_1,
    input  tri   module_0,
    input  uwire id_3,
    output wire  id_4
);
  wire  id_6;
  wire  id_7;
  wire  id_8;
  logic id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd98,
    parameter id_4 = 32'd90,
    parameter id_5 = 32'd24
) (
    output tri1  id_0,
    output wire  id_1,
    input  tri   _id_2,
    input  tri1  id_3,
    input  uwire _id_4,
    input  tri0  _id_5
);
  wire [{  id_4  +  id_5  -  id_2  ,  -1  } : id_4  |  id_4  >  -1 'b0] id_7;
  assign id_1 = -1'b0;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.id_4 = 0;
  wire [1 'b0 : 1] id_8;
endmodule
