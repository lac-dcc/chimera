// Seed: 3435298794
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output supply1 id_2,
    output supply0 id_3,
    input wand id_4,
    input tri0 id_5,
    input wor id_6
);
  assign id_2 = id_0;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    output supply1 id_2
);
  assign id_2 = (-1) - id_1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_3 = 32'd16
) (
    id_1
);
  inout wire id_1;
  localparam id_2 = 1;
  wire  _id_3;
  logic id_4;
  ;
  logic [-1 : -1] id_5;
  logic id_6;
  ;
  wire [!  id_3  ==  1 : -1] id_7;
  generate
    for (id_8 = -1; id_3; id_5 = 1) begin : LABEL_0
      assign id_6 = 1;
    end
  endgenerate
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  module_2 modCall_1 (id_5);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_8;
  ;
endmodule
