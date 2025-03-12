// Seed: 1102179168
module module_0 (
    input tri1  id_0,
    input uwire id_1
);
  logic id_3;
  ;
endmodule
module module_1 (
    output uwire id_0,
    output tri0  id_1,
    input  tri1  id_2
);
  logic id_4;
  not primCall (id_0, id_4);
  module_0 modCall_1 (
      id_2,
      id_2
  );
endmodule
module module_2 #(
    parameter id_7 = 32'd78,
    parameter id_8 = 32'd31
) (
    output tri0 id_0,
    input  wire id_1,
    input  tri1 id_2,
    output tri1 id_3,
    input  tri1 id_4,
    input  tri  id_5
);
  wire _id_7 = id_2;
  module_0 modCall_1 (
      id_2,
      id_5
  );
  assign modCall_1.id_1 = 0;
  wire _id_8 = 1;
  uwire [1  ==  -1  *  id_8  -  1 : 1  ^  id_7] id_9 = -1;
endmodule
