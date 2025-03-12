// Seed: 658058148
module module_0 (
    input tri0 id_0,
    output supply0 id_1
);
  wire id_3;
  module_2 modCall_1 (id_3);
  assign id_1 = id_0;
endmodule
module module_1 (
    output tri1 id_0,
    input  wor  id_1
);
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1
);
  input wire id_1;
endmodule
program module_3 #(
    parameter id_0 = 32'd81,
    parameter id_3 = 32'd87
) (
    input tri0 _id_0
);
  logic [7:0][{  id_0  {  id_0  }  }] id_2, _id_3 = id_0;
  wire id_4[!  -1  -  id_3  ==  id_0  ?  -1 : 1 : -  id_3];
  assign id_2 = 1;
  module_2 modCall_1 (id_4);
endprogram
