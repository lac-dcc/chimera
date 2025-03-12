// Seed: 1878817871
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output tri id_2,
    output uwire id_3,
    input wand id_4,
    input supply0 id_5,
    input wire id_6,
    input wor id_7,
    output uwire id_8,
    input tri id_9,
    output supply0 id_10,
    input wand id_11,
    input supply1 id_12,
    input tri1 id_13,
    input uwire id_14
);
  logic id_16;
endmodule
module module_1 #(
    parameter id_0 = 32'd98,
    parameter id_4 = 32'd25,
    parameter id_8 = 32'd81
) (
    output wire _id_0,
    input tri1 id_1,
    input wand id_2,
    output tri id_3,
    input uwire _id_4,
    input supply0 id_5,
    input tri0 id_6,
    output supply0 id_7,
    input tri1 _id_8,
    input wire id_9,
    output tri1 id_10,
    output wire id_11,
    output wand id_12,
    output logic id_13,
    output wand id_14
);
  always_latch @(1 or posedge id_1) begin : LABEL_0
    id_13 <= 1;
    wait (1'b0);
  end
  assign id_14 = 1;
  logic [7:0] id_16;
  assign id_16[id_4 : id_8] = id_14++;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_9,
      id_9,
      id_6,
      id_9,
      id_11,
      id_9,
      id_10,
      id_1,
      id_5,
      id_6,
      id_2
  );
  assign modCall_1.id_8 = 0;
  logic [1  !=  id_0 : id_0] id_17 = -1;
endmodule
