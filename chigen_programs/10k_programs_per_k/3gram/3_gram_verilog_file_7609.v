// Seed: 59621501
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input uwire id_3,
    input supply0 id_4,
    output tri id_5,
    input tri id_6,
    input supply1 id_7,
    output uwire id_8,
    output uwire id_9,
    output uwire id_10,
    output tri id_11,
    input wand id_12,
    output wire id_13,
    output wor id_14,
    input supply0 id_15,
    input supply1 id_16,
    input wand id_17
);
  assign module_1.id_17 = 0;
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    input wand id_2,
    output wire id_3,
    input tri1 id_4,
    input tri1 id_5,
    output tri0 id_6,
    input wire id_7,
    output logic id_8,
    input wire id_9,
    input supply0 id_10,
    output wand id_11,
    inout tri1 id_12,
    input tri0 id_13,
    input uwire id_14,
    output wand id_15,
    input tri id_16,
    output tri id_17,
    output logic id_18,
    input wire id_19,
    input wand id_20,
    output wand id_21
);
  always @(id_0(id_13, -1 == id_2)) id_8 <= 1;
  always @(-1 or posedge id_0) begin : LABEL_0
    id_18 = -1;
  end
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_19,
      id_9,
      id_11,
      id_4,
      id_12,
      id_17,
      id_11,
      id_12,
      id_15,
      id_2,
      id_21,
      id_3,
      id_10,
      id_19,
      id_10
  );
endmodule
