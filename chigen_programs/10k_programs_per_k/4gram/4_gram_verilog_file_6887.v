// Seed: 3130147725
module module_0 (
    input tri1 id_0,
    output wire id_1,
    output wor id_2,
    input tri id_3,
    input tri0 id_4,
    output wor id_5,
    input tri id_6,
    input tri id_7,
    input tri1 id_8,
    input wor id_9,
    input supply0 id_10,
    input wand id_11,
    input wor id_12
);
  localparam id_14 = 1;
  wire id_15;
endmodule
module module_1 #(
    parameter id_0 = 32'd12
) (
    output supply1 _id_0,
    output wor id_1,
    input wand id_2,
    input wire id_3,
    input uwire id_4,
    input tri0 id_5
);
  logic [1 : (  id_0  - "" )] id_7;
  logic [7:0][1 : -1 'b0] id_8, id_9, id_10, id_11;
  wire id_12;
  always @(posedge id_7 or posedge id_10[-1]) begin : LABEL_0
    id_13((id_4));
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_3,
      id_1,
      id_5,
      id_5,
      id_2,
      id_5,
      id_2,
      id_4,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
