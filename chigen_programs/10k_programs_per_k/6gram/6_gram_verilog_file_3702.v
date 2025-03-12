// Seed: 3562215561
module module_0 (
    input uwire id_0,
    input wand id_1,
    output wand id_2,
    input tri1 id_3,
    input tri0 id_4,
    output supply1 id_5,
    output tri id_6,
    output uwire id_7,
    input uwire sample,
    output tri id_9,
    input tri1 id_10,
    input wand id_11,
    input supply1 id_12,
    output tri0 id_13,
    input tri1 id_14,
    input wor id_15,
    output wor id_16,
    input wire id_17,
    output tri0 module_0,
    input supply0 id_19
);
  logic [-1 'd0 : ""] id_21;
  ;
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    input wire id_2,
    input tri0 id_3,
    output logic id_4,
    input supply0 id_5,
    input uwire id_6,
    output logic id_7,
    input tri id_8,
    output wor id_9
);
  assign id_7 = id_0 == -1'b0;
  assign id_7 = id_0;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_9,
      id_2,
      id_8,
      id_9,
      id_9,
      id_9,
      id_3,
      id_9,
      id_3,
      id_8,
      id_6,
      id_9,
      id_8,
      id_3,
      id_9,
      id_3,
      id_9,
      id_3
  );
  assign modCall_1.id_8 = 0;
  always @(-1, posedge id_1) begin : LABEL_0
    id_7 <= id_6;
    if (1 & 1'd0) if (1) id_4 <= id_11 * -1;
  end
endmodule
