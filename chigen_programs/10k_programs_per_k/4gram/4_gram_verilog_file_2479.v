// Seed: 1440512413
module module_0 #(
    parameter id_18 = 32'd53,
    parameter id_19 = 32'd86
) (
    output tri1 id_0,
    input tri0 id_1,
    input tri id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input supply0 id_6,
    input supply1 id_7,
    output uwire id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wire id_11,
    output wire id_12,
    input wand id_13,
    input tri0 id_14,
    output supply0 id_15
);
  wire id_17;
  defparam id_18.id_19 = id_18;
  wire id_20;
endmodule
module module_1 (
    input wire id_0,
    output wor id_1,
    output wand id_2
    , id_10,
    output tri id_3,
    output uwire id_4,
    output uwire id_5,
    inout supply0 id_6,
    input supply1 id_7
    , id_11,
    output wand id_8,
    wire id_12
);
  supply1 id_13, id_14;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0,
      id_6,
      id_7,
      id_7,
      id_13,
      id_13,
      id_3,
      id_14,
      id_13,
      id_14,
      id_3,
      id_13,
      id_0,
      id_3
  );
  assign modCall_1.id_10 = 0;
  always @(posedge id_13 or posedge {1, 1'b0}) $display(1 & 1'b0, id_11);
  always @(id_10 or negedge 1'b0) if ("") release id_5;
  wire id_15;
  wire id_16;
endmodule
