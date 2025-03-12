// Seed: 3118650848
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input supply1 id_2
);
  wire id_4;
endmodule
module module_1 #(
    parameter id_17 = 32'd4
) (
    input tri0 id_0,
    input supply0 id_1,
    output uwire id_2,
    output logic id_3,
    output wand id_4,
    input wire id_5,
    input uwire id_6,
    output tri0 id_7,
    output logic id_8,
    input tri0 id_9,
    input tri id_10,
    input supply0 id_11,
    input tri1 id_12,
    output logic id_13,
    input wire id_14,
    input tri id_15,
    output wand id_16,
    input wand _id_17,
    input tri0 id_18
);
  logic id_20;
  or primCall (id_13, id_0, id_14, id_18, id_9, id_20, id_1, id_10, id_12);
  wire [id_17 : -1] id_21;
  module_0 modCall_1 (
      id_15,
      id_1,
      id_6
  );
  assign modCall_1.id_1 = 0;
  always disable id_22;
  always @(posedge -1'b0) begin : LABEL_0
    id_8 <= id_14;
    id_20 = -1;
    id_13 = "";
    id_3 <= 1;
  end
endmodule
