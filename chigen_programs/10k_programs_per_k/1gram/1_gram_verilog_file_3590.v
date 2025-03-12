// Seed: 4108949460
module module_0;
  assign module_2.id_1 = 0;
  wire id_1;
  ;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_6 = 32'd43
) (
    output logic id_0,
    input  wand  id_1,
    output logic id_2,
    input  tri0  id_3,
    input  wor   id_4
);
  assign id_2 = 1;
  always_comb begin : LABEL_0
    id_2 <= 1;
    id_0 <= 1 | 1;
    id_0 <= id_4;
  end
  module_0 modCall_1 ();
  assign id_2 = 1;
  logic _id_6;
  ;
  wire [1 : id_6] id_7;
  wire [1 : id_6] id_8;
endmodule
