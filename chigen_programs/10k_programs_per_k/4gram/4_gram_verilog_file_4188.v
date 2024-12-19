// Seed: 4279266729
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input tri id_2,
    input wand id_3,
    output wire id_4
);
  assign id_4 = 1'b0;
  wire id_6;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    input uwire id_2,
    output wor id_3,
    output supply0 id_4,
    output supply1 id_5,
    output wand id_6
    , id_18,
    input supply1 id_7,
    output uwire id_8,
    input wor id_9,
    output wor id_10
    , id_19,
    output uwire id_11,
    inout uwire id_12,
    input uwire id_13,
    input wire id_14,
    output supply0 id_15,
    input tri id_16
);
  module_0 modCall_1 (
      id_4,
      id_13,
      id_12,
      id_9,
      id_0
  );
  assign modCall_1.type_1 = 0;
  wire id_20;
  always @(posedge id_19 or posedge ~id_1) begin : LABEL_0
    assign id_11 = 1;
  end
endmodule
