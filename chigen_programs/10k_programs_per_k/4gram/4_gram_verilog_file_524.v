// Seed: 3479275709
module module_0 #(
    parameter id_15 = 32'd35,
    parameter id_16 = 32'd95
) (
    input tri0 id_0,
    input uwire id_1,
    input wire id_2,
    input uwire id_3,
    input wor id_4,
    input tri0 id_5,
    output supply1 id_6,
    output wor id_7,
    input wor id_8,
    input uwire id_9,
    input wor id_10,
    output wire id_11,
    output uwire id_12,
    input tri id_13
);
  assign module_1.type_7 = 0;
  defparam id_15.id_16 = 1;
  wire id_17;
  assign id_6 = id_9;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    output uwire id_2,
    output tri   id_3
);
  wire id_5;
  always @(posedge 1) begin : LABEL_0
    id_2 = 1'h0;
  end
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_3,
      id_0
  );
endmodule
