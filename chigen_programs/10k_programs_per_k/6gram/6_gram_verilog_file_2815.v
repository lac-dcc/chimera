// Seed: 1811384686
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    output supply1 id_2
);
  always @(posedge 1) begin : LABEL_0
    cover (1);
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd84,
    parameter id_6 = 32'd40
) (
    output wor _id_0,
    output logic id_1,
    input wor id_2,
    input wire id_3,
    output wor id_4,
    output tri0 id_5,
    input wor _id_6,
    input supply0 id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri0 id_10,
    input supply0 id_11,
    input tri id_12,
    output tri1 id_13,
    input supply0 id_14,
    input tri1 id_15,
    input wand id_16
);
  wire [1 : 1] id_18;
  wire id_19;
  ;
  module_0 modCall_1 (
      id_3,
      id_12,
      id_5
  );
  assign modCall_1.id_2 = 0;
  assign id_13 = 1;
  logic [1 : id_6] id_20;
  wire id_21;
  always if (-1 === 1) id_1 <= 1;
  logic [id_6 : id_0] id_22, id_23, id_24, id_25;
endmodule
