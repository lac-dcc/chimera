// Seed: 3255638699
module module_0 #(
    parameter id_4 = 32'd67
) (
    input supply1 id_0,
    output wire id_1,
    input wire id_2,
    input tri1 id_3,
    input supply1 _id_4,
    output tri1 id_5,
    input tri id_6,
    input wand id_7,
    input tri id_8
);
  logic [id_4 : -1] id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19;
  assign module_1._id_0 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd30,
    parameter id_4 = 32'd84
) (
    input  wand  _id_0,
    output wire  id_1,
    input  uwire id_2
);
  localparam id_4 = 1;
  parameter id_5 = -1 == 1'b0;
  assign id_1 = id_5[~id_0] == (-1'b0 ~^ id_4 ? id_5[id_4] : -1);
  logic id_6;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_2,
      id_4,
      id_1,
      id_2,
      id_2,
      id_2
  );
endmodule
