// Seed: 4060126218
module module_0 (
    input supply0 id_0,
    output wor id_1,
    input wor id_2,
    output tri0 id_3,
    input tri id_4,
    output uwire id_5,
    output wire id_6,
    output tri0 id_7,
    input supply1 id_8,
    input supply0 id_9,
    input supply0 id_10,
    input wire id_11,
    input tri1 id_12,
    output uwire id_13,
    input wor id_14,
    input tri0 id_15,
    output tri id_16,
    input wor id_17,
    output wire id_18
);
  assign id_16 = -1'b0;
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1
    , id_16,
    output logic id_2,
    input tri1 id_3,
    input tri id_4,
    input wand id_5,
    input supply0 id_6,
    output logic id_7,
    input wire id_8,
    input supply1 id_9,
    input tri id_10,
    input tri id_11,
    input supply0 id_12
    , id_17,
    input uwire id_13,
    output supply1 id_14
);
  assign id_14 = -1;
  module_0 modCall_1 (
      id_6,
      id_14,
      id_3,
      id_0,
      id_1,
      id_14,
      id_0,
      id_14,
      id_8,
      id_13,
      id_9,
      id_9,
      id_10,
      id_0,
      id_1,
      id_12,
      id_0,
      id_9,
      id_0
  );
  assign modCall_1.id_0 = 0;
  always @(posedge -1'b0 or posedge -1) begin : LABEL_0
    id_7 <= id_12;
    id_2 <= -1;
    id_7 <= ~(id_8);
  end
endmodule
