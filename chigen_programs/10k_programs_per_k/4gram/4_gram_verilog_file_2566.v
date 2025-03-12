// Seed: 1877976384
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    output uwire id_2,
    output wand id_3
);
  logic [1 : 1] id_5;
  wire id_6;
  parameter id_7 = -1 * 1;
  assign module_1._id_2 = 0;
  wire id_8, id_9, id_10;
  assign id_3 = id_7;
endmodule
module module_1 #(
    parameter id_2 = 32'd26
) (
    input  wand id_0,
    output wire id_1,
    input  wor  _id_2
);
  generate
    assign id_1 = 1 ? 1 : {id_0{id_2}};
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign id_1 = id_2;
  logic [1 : id_2] id_4;
  ;
endmodule
