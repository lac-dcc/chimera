// Seed: 1583747287
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input supply1 id_2,
    input supply1 module_0,
    output tri id_4,
    input uwire id_5
    , id_27,
    output tri0 id_6,
    input wire id_7,
    input wand id_8,
    output wire id_9,
    input wand id_10,
    input tri id_11,
    input uwire id_12,
    input uwire id_13,
    output tri1 id_14,
    input wor id_15,
    input tri0 id_16,
    input uwire id_17,
    input tri1 id_18,
    input uwire id_19,
    input tri1 id_20,
    input supply0 id_21,
    output wire id_22,
    output wor id_23,
    output tri0 id_24,
    output wand id_25
    , id_28
);
  wire id_29;
  ;
  assign id_22.id_15   = -1'b0 == id_18;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd42,
    parameter id_20 = 32'd68
) (
    input tri1 id_0,
    input supply0 id_1,
    input wire id_2,
    output wand id_3,
    input wor id_4,
    input wor id_5,
    input tri1 id_6,
    input tri id_7,
    output tri0 id_8,
    input wor id_9,
    input tri _id_10,
    input tri id_11,
    input uwire id_12,
    output tri1 id_13,
    input wor id_14,
    input wor id_15
);
  always @(posedge -1) begin : LABEL_0
    disable id_17;
  end
  localparam id_18 = 1;
  logic [7:0] id_19;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_14,
      id_5,
      id_3,
      id_5,
      id_8,
      id_1,
      id_2,
      id_8,
      id_9,
      id_9,
      id_11,
      id_0,
      id_8,
      id_2,
      id_2,
      id_7,
      id_5,
      id_4,
      id_15,
      id_7,
      id_3,
      id_13,
      id_3,
      id_3
  );
  wire _id_20;
  assign id_19[id_20 :-1!=-1>id_10] = -1;
endmodule
