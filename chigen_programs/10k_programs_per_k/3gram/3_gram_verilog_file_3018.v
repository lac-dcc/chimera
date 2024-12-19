// Seed: 2982857595
module module_0 (
    output supply0 id_0,
    input wire id_1,
    input wand id_2,
    output uwire id_3,
    output wire id_4,
    output wor id_5,
    input uwire id_6,
    input supply1 id_7,
    output supply0 id_8,
    output tri0 id_9,
    input uwire id_10,
    input tri id_11,
    output supply1 id_12,
    output tri0 id_13,
    output tri1 id_14,
    input wand id_15,
    output uwire id_16,
    input wand id_17,
    output wand id_18
);
endmodule
module module_1 (
    input logic id_0,
    output supply1 id_1,
    input wor id_2,
    output tri0 id_3,
    input tri1 id_4,
    input tri id_5,
    output tri id_6
);
  reg id_8;
  if (id_4) begin : LABEL_0
    assign id_6 = id_5;
  end
  assign id_8 = 1;
  wire id_9;
  assign id_1 = 1'b0;
  assign id_6 = id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_3,
      id_5,
      id_2,
      id_3,
      id_6,
      id_4,
      id_5,
      id_1,
      id_1,
      id_3,
      id_5,
      id_6,
      id_4,
      id_1
  );
  assign modCall_1.id_8 = 0;
  assign id_8 = 1;
  assign id_1 = id_2;
  always @(posedge id_2) begin : LABEL_0
    id_8 <= id_0;
    id_6 = 1'b0;
  end
  assign id_3 = 1'b0;
  wire id_10;
  wire id_11;
  assign id_8 = 1;
endmodule
