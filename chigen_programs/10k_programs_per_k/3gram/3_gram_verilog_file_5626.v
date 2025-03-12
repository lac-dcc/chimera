// Seed: 2565558375
module module_0 (
    output tri1 id_0,
    output tri0 id_1,
    input tri id_2,
    input tri0 id_3,
    input tri0 id_4,
    output supply1 id_5,
    output supply0 id_6,
    input supply1 id_7,
    output tri id_8,
    input uwire id_9,
    output uwire id_10,
    input wire id_11,
    output supply1 id_12,
    output supply1 id_13,
    input supply0 id_14,
    input supply0 id_15,
    output wor id_16,
    input wire id_17,
    input tri0 id_18,
    output wire id_19,
    input wire id_20,
    output wor id_21
);
  wire id_23;
  assign id_5 = id_15;
  parameter id_24 = 1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    output wor id_2,
    input uwire id_3,
    output uwire id_4,
    input tri id_5,
    input wand id_6,
    output tri0 id_7,
    output logic id_8,
    input tri id_9,
    input tri id_10,
    input wand id_11,
    output wand id_12,
    input supply1 id_13
);
  always @(posedge -1 or posedge id_10) begin : LABEL_0
    id_8 = 1;
  end
  genvar id_15;
  nand primCall (id_2, id_5, id_10, id_15, id_9, id_6, id_0, id_3, id_13, id_11);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_11,
      id_13,
      id_9,
      id_4,
      id_7,
      id_5,
      id_1,
      id_5,
      id_1,
      id_10,
      id_7,
      id_12,
      id_6,
      id_11,
      id_4,
      id_3,
      id_9,
      id_7,
      id_10,
      id_2
  );
endmodule
