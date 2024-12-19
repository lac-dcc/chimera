// Seed: 925616918
module module_0 (
    output tri0  id_0,
    input  wire  id_1,
    output tri   id_2,
    input  tri   id_3,
    input  tri0  id_4,
    output uwire id_5,
    output tri0  id_6,
    input  wand  id_7,
    input  tri0  id_8,
    input  tri1  id_9,
    input  wand  id_10,
    input  tri0  id_11,
    input  wire  id_12,
    input  wand  id_13,
    output wire  id_14,
    input  tri0  id_15,
    input  tri0  id_16,
    input  wire  id_17,
    input  uwire id_18,
    output tri0  id_19,
    output tri1  id_20
);
  assign module_1.id_16 = 0;
  id_22(
      1, id_10, 1
  );
endmodule
module module_1 (
    output wire id_0,
    input supply1 id_1,
    output wand id_2,
    output wor id_3,
    input wor id_4,
    output tri1 id_5,
    output wire id_6,
    input uwire id_7,
    output wor id_8,
    input tri0 id_9,
    input tri1 id_10,
    input tri id_11,
    input supply1 id_12,
    inout tri0 id_13,
    input supply0 id_14
);
  reg id_16, id_17;
  always @(posedge id_12 or posedge id_1) begin : LABEL_0
    id_16 <= "";
  end
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_12,
      id_1,
      id_5,
      id_8,
      id_12,
      id_1,
      id_7,
      id_9,
      id_9,
      id_10,
      id_12,
      id_8,
      id_12,
      id_10,
      id_7,
      id_1,
      id_0,
      id_2
  );
endmodule
