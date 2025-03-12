// Seed: 3590478494
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input wire id_2,
    input tri1 id_3,
    input wand id_4,
    input wand id_5,
    output uwire id_6
);
  always @(posedge 1) #1;
  wire id_8;
endmodule
module module_1 (
    input tri id_0,
    output wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wire id_4,
    input supply1 id_5,
    output wand id_6,
    input wire id_7,
    output supply0 id_8,
    output wor id_9,
    input supply0 id_10,
    input uwire id_11,
    output tri0 id_12,
    input wire id_13,
    input tri0 id_14,
    input uwire id_15,
    input tri1 id_16,
    output wire id_17,
    output supply0 id_18
);
  assign id_8 = 1 - id_14;
  wire id_20;
  module_0 modCall_1 (
      id_15,
      id_11,
      id_15,
      id_4,
      id_4,
      id_2,
      id_6
  );
  assign modCall_1.id_4 = 0;
  bit   id_21;
  logic id_22;
  always @(posedge id_4 or negedge 1'b0) begin : LABEL_0
    id_21 = id_4;
  end
  logic id_23;
  assign id_6 = id_20;
endmodule
