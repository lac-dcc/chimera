// Seed: 2909903590
module module_0 (
    input wire id_0,
    input wire id_1,
    input supply0 id_2,
    input uwire id_3,
    input supply0 id_4,
    output wand id_5,
    output tri0 id_6,
    output wor id_7,
    output supply1 id_8,
    input tri0 id_9,
    output wor id_10,
    input supply0 id_11,
    output tri id_12,
    input tri id_13,
    input tri0 id_14,
    input uwire id_15,
    output tri1 id_16,
    input tri1 id_17
);
  initial id_5 = 1;
  assign module_1.type_23 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1,
    output tri   id_2,
    input  tri0  id_3,
    input  wire  id_4,
    input  wand  id_5,
    input  logic id_6,
    output logic id_7,
    input  tri0  id_8,
    output wor   id_9,
    input  tri0  id_10,
    output uwire id_11,
    output logic id_12,
    output tri1  id_13,
    output logic id_14
);
  always @(posedge 1 ~^ id_0 == 1'd0, posedge 1)
    if (1) begin : LABEL_0
      id_7  <= 1'b0;
      id_12 <= id_6;
    end
  wire id_16;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_10,
      id_5,
      id_5,
      id_1,
      id_11,
      id_9,
      id_9,
      id_3,
      id_2,
      id_8,
      id_9,
      id_10,
      id_4,
      id_8,
      id_9,
      id_3
  );
  wire id_17;
  always @(1 or id_0) id_14 <= 1'b0;
  or primCall (id_13, id_10, id_0, id_4, id_8, id_5, id_16);
endmodule
