// Seed: 1768599065
module module_0 #(
    parameter id_12 = 32'd3,
    parameter id_13 = 32'd20
) (
    input tri id_0,
    input supply0 id_1,
    input tri id_2,
    output supply0 id_3,
    input tri1 id_4,
    output tri0 id_5,
    input wire id_6,
    output uwire id_7
);
  logic [7:0] id_9;
  uwire id_10;
  wire id_11;
  defparam id_12.id_13 = id_13;
  wire id_14;
  uwire id_15 = id_2, id_16;
  always @(id_2 or posedge 1) id_3 = 1;
  assign id_9[1] = "";
  wire id_17;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    output tri1 id_2
);
  always repeat ({1, 1}) #1 id_2 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.type_19 = 0;
endmodule
