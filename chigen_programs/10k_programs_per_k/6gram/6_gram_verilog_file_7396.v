// Seed: 2864195670
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output uwire id_2
    , id_5,
    output tri0 id_3
);
  assign id_1 = id_0;
endmodule
module module_1 #(
    parameter id_14 = 32'd79
) (
    input tri id_0,
    output tri1 id_1,
    output tri id_2,
    output tri0 id_3,
    input uwire id_4,
    output tri1 id_5,
    output tri id_6,
    input tri1 id_7,
    input uwire id_8
    , id_22,
    input tri id_9,
    input tri id_10,
    input wire id_11,
    input wire id_12,
    input supply0 id_13,
    input supply1 _id_14,
    input wor id_15,
    output supply1 id_16,
    output logic id_17,
    output supply1 id_18,
    output tri id_19,
    output wor id_20
);
  logic id_23;
  assign id_18 = -1 ? 1 & 1 : id_4 - ((id_22[id_14] == 1));
  module_0 modCall_1 (
      id_9,
      id_6,
      id_20,
      id_2
  );
  assign modCall_1.id_1 = 0;
  assign id_1 = id_14;
  assign id_5 = id_4;
  wire id_24;
  wire id_25;
  ;
  always @(id_15 or posedge id_15) begin : LABEL_0
    id_17 <= 1;
  end
endmodule
