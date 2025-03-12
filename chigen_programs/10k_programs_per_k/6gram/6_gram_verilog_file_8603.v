// Seed: 1098716341
module module_0 (
    output tri0 id_0,
    output uwire id_1,
    input wor id_2,
    input tri1 id_3,
    input tri0 id_4,
    input wire id_5,
    output tri0 id_6,
    input wire id_7,
    input supply1 id_8,
    input tri id_9,
    input tri0 id_10,
    input tri id_11,
    output wor id_12,
    output tri0 id_13,
    input tri0 id_14,
    input tri0 id_15,
    output wor id_16,
    output wire id_17
);
  reg id_19;
  assign id_0 = ~id_10;
  always @(-1'b0 == id_10 or posedge id_9) begin : LABEL_0
    id_19 = id_14;
  end
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    output logic id_2,
    input wor id_3,
    output uwire id_4,
    output supply1 id_5,
    input tri1 id_6,
    input wor id_7,
    output supply1 id_8
);
  always @(-1, posedge id_7) id_2 = #1  !id_6;
  module_0 modCall_1 (
      id_4,
      id_8,
      id_1,
      id_0,
      id_3,
      id_3,
      id_5,
      id_1,
      id_3,
      id_0,
      id_1,
      id_0,
      id_5,
      id_4,
      id_3,
      id_0,
      id_8,
      id_4
  );
  assign modCall_1.id_19 = 0;
endmodule
