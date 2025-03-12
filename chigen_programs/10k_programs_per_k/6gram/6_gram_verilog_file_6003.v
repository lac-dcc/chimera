// Seed: 83111509
module module_0 (
    output logic id_0,
    output wand  id_1,
    output tri0  id_2,
    output uwire id_3,
    output tri1  id_4
);
  wire id_6;
  initial id_0 = #1 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd72
) (
    output wor   id_0,
    input  tri0  _id_1,
    output tri0  id_2,
    output logic id_3
);
  wire \id_5 ;
  nand primCall (id_3, id_8, id_6, \id_5 );
  assign id_3 = -1 & "" ? -1 : 1 ? -1 : -1 == -1;
  always @((id_1) == 1 - \id_5 ) begin : LABEL_0
    id_3 <= \id_5 ;
  end
  logic id_6;
  ;
  wire [1 'b0 : id_1] id_7;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_2,
      id_2
  );
  logic [1  /  -1 : -1] id_9;
  wire id_10;
endmodule
