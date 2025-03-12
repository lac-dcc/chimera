// Seed: 2909262337
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output logic id_5,
    input uwire id_6,
    output tri0 id_7,
    input tri1 id_8,
    output supply1 id_9,
    input wand id_10,
    output wire id_11
);
  always @(posedge 1) begin : LABEL_0
    id_5 = id_8;
  end
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd47,
    parameter id_5  = 32'd72
) (
    output logic id_0,
    input tri0 id_1,
    output logic id_2,
    input wire id_3,
    input wor id_4,
    input uwire _id_5,
    output uwire id_6,
    input tri1 id_7,
    output logic id_8,
    input wire id_9,
    output tri0 id_10,
    input tri0 id_11,
    input supply0 _id_12,
    output uwire id_13,
    output wire id_14
);
  logic id_16;
  logic [id_5 : id_12] id_17;
  assign id_13 = 1'b0;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_3,
      id_9,
      id_0,
      id_7,
      id_13,
      id_1,
      id_13,
      id_9,
      id_10
  );
  initial begin : LABEL_0
    id_8 <= -1;
    id_2 = -1;
    id_0 = -1;
  end
endmodule
