// Seed: 4199917334
module module_0 (
    output wand id_0,
    output tri1 id_1,
    output tri id_2,
    input supply1 id_3,
    input tri0 module_0,
    input tri1 id_5,
    output wor id_6,
    input wor id_7,
    input uwire id_8,
    input wand id_9,
    input uwire id_10,
    input wand id_11,
    output tri1 id_12
);
  wire id_14;
  ;
  assign id_12 = ~id_4;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    output wire id_2,
    input supply1 id_3,
    output supply1 id_4,
    input wand id_5,
    input wand id_6,
    input wire id_7,
    output uwire id_8,
    output tri0 id_9,
    output tri0 id_10,
    input supply1 id_11,
    output wor id_12
);
  logic [7:0] id_14;
  assign id_2 = -1'b0 == id_11;
  assign id_4 = -1 !=? -1'd0;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_7,
      id_5,
      id_11,
      id_4,
      id_5,
      id_11,
      id_3,
      id_5,
      id_3,
      id_4
  );
  assign modCall_1.id_0 = 0;
  reg id_15;
  for (id_16 = id_6; id_14[-1]; id_15 = 1) begin : LABEL_0
    always @(negedge -1) begin : LABEL_1
      wait (1);
    end
  end
  xor primCall (id_4, id_14, id_1, id_11, id_0, id_3, id_7, id_5, id_6);
endmodule
