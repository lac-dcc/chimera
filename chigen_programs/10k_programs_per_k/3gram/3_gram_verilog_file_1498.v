// Seed: 840509697
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input wand id_2,
    input wor id_3,
    output tri id_4
);
  logic \id_6 ;
  wire  id_7;
  assign id_4 = -1;
endmodule
module module_1 #(
    parameter id_14 = 32'd4
) (
    inout supply1 id_0,
    input tri0 id_1,
    output logic id_2,
    input wor id_3,
    input wire id_4,
    input wire id_5,
    output wor id_6,
    input supply0 id_7,
    input tri0 id_8,
    input wor id_9,
    output uwire id_10,
    output logic id_11,
    input tri id_12,
    output uwire id_13,
    output tri0 _id_14,
    output wand id_15,
    input tri0 id_16
);
  wire [1 : -1 'b0] id_18;
  logic [id_14] id_19;
  always @(posedge id_16) begin : LABEL_0
    id_11 <= 1;
    id_2  <= 1'h0;
  end
  assign id_13 = id_1;
  logic id_20;
  assign id_20 = -1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_12,
      id_5,
      id_0
  );
  assign modCall_1.id_4 = 0;
  logic id_21;
  ;
endmodule
