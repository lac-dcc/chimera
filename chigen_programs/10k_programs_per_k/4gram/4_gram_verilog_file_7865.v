// Seed: 3554067800
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    output tri1 id_2,
    output wor id_3,
    input supply1 id_4,
    input tri1 id_5,
    output wire id_6,
    input wire id_7,
    output supply1 id_8,
    output wor id_9,
    input wor id_10,
    input supply0 id_11,
    input tri id_12,
    input tri0 id_13,
    output tri0 id_14,
    input wor id_15,
    input tri0 id_16,
    input wire id_17,
    input tri1 id_18,
    input wire id_19,
    input uwire id_20
);
  wire id_22;
  ;
  assign id_1 = -1;
  wire id_23;
  assign #id_24 id_23 = id_22#(.id_7((-1)));
endmodule
module module_1 #(
    parameter id_3 = 32'd24
) (
    output tri1  id_0,
    input  tri0  id_1,
    output logic id_2,
    input  tri   _id_3,
    input  tri   id_4,
    output uwire id_5,
    output tri0  id_6
);
  always_comb @(negedge "") begin : LABEL_0
    id_2 <= 1'b0;
    id_2 <= id_1;
  end
  logic [7:0] id_8, id_9, id_10, id_11, id_12;
  assign id_10 = -1 ? (id_12) : id_11[1 : (id_3|-1)];
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_6,
      id_4,
      id_1,
      id_5,
      id_1,
      id_0,
      id_5,
      id_1,
      id_4,
      id_4,
      id_1,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
