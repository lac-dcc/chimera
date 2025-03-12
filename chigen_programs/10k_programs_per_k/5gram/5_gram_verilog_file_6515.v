// Seed: 2262246770
module module_0 (
    input tri0 id_0,
    output supply0 id_1
);
  assign id_1 = 1;
  assign module_1.id_0 = 0;
  wire id_3;
  assign module_2.id_4 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    input supply1 id_2,
    output supply0 id_3,
    output uwire id_4
);
  logic id_6;
  module_0 modCall_1 (
      id_2,
      id_0
  );
endmodule
module module_2 #(
    parameter id_0 = 32'd63,
    parameter id_5 = 32'd87,
    parameter id_6 = 32'd79
) (
    input tri0 _id_0,
    output tri0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri1 _id_5,
    input supply1 _id_6
);
  wire [id_5 : id_6] id_8;
  module_0 modCall_1 (
      id_4,
      id_1
  );
  final begin : LABEL_0
    disable id_9;
  end
  wire [id_5 : id_0] \id_10 ;
  nand primCall (id_1, id_8, id_2);
endmodule
