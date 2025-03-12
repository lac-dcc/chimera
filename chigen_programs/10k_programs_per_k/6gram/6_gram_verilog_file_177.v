// Seed: 1087996292
module module_0 (
    input wire id_0,
    output wand id_1,
    input uwire id_2,
    input wor id_3,
    input tri id_4,
    input supply1 id_5,
    input tri1 id_6,
    input wand id_7,
    input tri0 id_8,
    input tri0 id_9,
    input wor id_10,
    output tri id_11
);
  assign module_1.id_2 = 0;
  parameter id_13 = 1;
  wire id_14;
  assign id_1 = -1;
endmodule
module module_1 #(
    parameter id_0  = 32'd40,
    parameter id_16 = 32'd11
) (
    input wire _id_0,
    input uwire id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input tri id_8,
    input tri0 id_9,
    input wire id_10,
    input wire id_11,
    output uwire id_12,
    input wor id_13
);
  logic [7:0] id_15;
  reg _id_16, id_17, id_18, id_19;
  always begin : LABEL_0
    id_19 <= 1 != id_5;
  end
  module_0 modCall_1 (
      id_6,
      id_12,
      id_3,
      id_5,
      id_10,
      id_5,
      id_8,
      id_13,
      id_2,
      id_7,
      id_9,
      id_12
  );
  parameter id_20 = -1;
  wire id_21;
  bit  id_22;
  always @(posedge id_15[id_0 : id_16] or posedge 'h0) begin : LABEL_1
    id_22 <= id_21;
  end
endmodule
