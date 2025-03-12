// Seed: 1127495859
module module_0 (
    output wand id_0,
    output wire id_1,
    output tri id_2,
    output uwire id_3,
    input uwire id_4,
    output supply1 id_5,
    input wand id_6,
    input uwire id_7,
    input tri0 id_8,
    output supply1 id_9,
    input tri id_10
);
  wire id_12;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd26
) (
    output wor id_0,
    output tri0 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output supply0 id_4,
    input uwire id_5,
    input tri id_6,
    input wand _id_7,
    input wire id_8,
    input tri id_9,
    output wire id_10,
    input wire id_11,
    inout supply1 id_12
);
  module_0 modCall_1 (
      id_10,
      id_3,
      id_3,
      id_4,
      id_5,
      id_4,
      id_11,
      id_6,
      id_11,
      id_0,
      id_9
  );
  assign modCall_1.id_2 = 0;
  logic [1 : 1] id_14;
  generate
    logic [7:0] id_15;
  endgenerate
  always begin : LABEL_0
    $clog2(61);
    ;
  end
  assign id_15[id_7-1] = -1;
endmodule
