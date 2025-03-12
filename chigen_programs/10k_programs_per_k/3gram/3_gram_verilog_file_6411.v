// Seed: 2328299220
module module_0 (
    input tri id_0,
    output wor id_1,
    output wor id_2,
    input wor id_3,
    input wor id_4,
    input supply1 id_5,
    input wor id_6,
    input uwire id_7,
    output wire id_8,
    input tri1 id_9
);
endmodule
module module_1 #(
    parameter id_1 = 32'd74
) (
    input tri1 id_0,
    input wor _id_1,
    input supply0 id_2,
    output uwire id_3,
    output logic id_4,
    input wand id_5,
    input wor id_6,
    input tri0 id_7,
    input wor id_8,
    output logic id_9,
    output uwire id_10,
    input uwire id_11,
    input wire id_12
    , id_14
);
  always_latch @(negedge 1) if ("") @(id_12 or posedge id_2) id_9 <= -1;
  wire  id_15;
  logic id_16;
  assign id_9 = {1{id_12}} & 1;
  wire id_17;
  always @(posedge id_8);
  always @(*) begin : LABEL_0
    id_9 <= 1;
    id_4 <= id_6;
  end
  module_0 modCall_1 (
      id_6,
      id_3,
      id_3,
      id_5,
      id_5,
      id_2,
      id_12,
      id_5,
      id_3,
      id_12
  );
  assign modCall_1.id_2 = 0;
  wire [id_1 : -1  +  1] id_18;
  xnor primCall (id_3, id_8, id_14, id_2, id_0, id_7, id_6, id_5, id_11, id_15);
endmodule
