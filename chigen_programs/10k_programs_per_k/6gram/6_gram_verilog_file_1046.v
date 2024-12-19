// Seed: 505713577
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output logic id_2,
    input tri0 id_3,
    input wor id_4,
    output supply0 id_5,
    output tri id_6,
    input tri id_7,
    input wire id_8,
    input wire id_9,
    input uwire id_10,
    input supply0 id_11,
    input wand id_12,
    output tri0 id_13,
    input wor id_14,
    input wire id_15,
    input supply0 id_16,
    output tri1 id_17,
    input tri0 id_18,
    output uwire id_19,
    output tri1 id_20
);
  always @(posedge id_4 !== 1 or posedge id_15) begin : LABEL_0
    id_2 <= 1'b0;
  end
endmodule
module module_1 (
    input logic id_0,
    input wand id_1,
    output logic id_2,
    input uwire id_3,
    output supply0 id_4,
    output tri id_5,
    output logic id_6,
    output supply0 id_7,
    output supply0 id_8,
    input supply1 id_9,
    output supply0 id_10,
    input tri0 id_11,
    output tri id_12,
    output supply0 id_13
);
  assign id_6 = 1 ? 1 : id_0;
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_6,
      id_9,
      id_9,
      id_8,
      id_13,
      id_9,
      id_11,
      id_3,
      id_1,
      id_3,
      id_9,
      id_13,
      id_11,
      id_3,
      id_11,
      id_5,
      id_3,
      id_4,
      id_13
  );
  assign modCall_1.id_15 = 0;
  assign id_5 = 1'b0;
  tri0 id_15;
  always @(1) begin : LABEL_0
    #1;
    id_6 <= !id_15;
  end
endmodule
