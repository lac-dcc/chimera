// Seed: 2610937629
module module_0 #(
    parameter id_1 = 32'd25
) (
    output supply0 id_0,
    input wand _id_1,
    input tri0 id_2,
    output wor id_3,
    input wire id_4[-1 'h0 : id_1],
    output uwire id_5
);
  assign id_0 = ((1)) ? id_4 : -1;
  parameter id_7 = 1'b0;
  wire id_8;
  ;
  wire [1 : -1] id_9;
endmodule
module module_1 #(
    parameter id_0 = 32'd0,
    parameter id_6 = 32'd46
) (
    input  tri1  _id_0,
    output uwire id_1,
    output tri0  id_2,
    input  tri   id_3,
    input  tri   id_4
);
  logic _id_6 = id_3, id_7;
  logic [7:0] id_8;
  assign id_6 = id_8[{id_6, id_0}];
  module_0 modCall_1 (
      id_1,
      id_6,
      id_4,
      id_1,
      id_4,
      id_1
  );
  assign modCall_1._id_1 = 0;
endmodule
