// Seed: 647420294
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    input tri id_4,
    input tri1 id_5,
    input tri0 id_6,
    input tri id_7,
    input supply0 id_8,
    input tri0 id_9,
    output supply1 id_10,
    input supply0 id_11,
    input wand id_12,
    input supply1 id_13,
    input tri0 id_14,
    input supply0 id_15,
    input supply1 id_16,
    output tri0 id_17
);
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output logic id_1,
    input wire id_2,
    input tri1 id_3,
    output logic id_4,
    input supply1 id_5,
    input wire id_6,
    output tri0 id_7,
    input wor id_8,
    input wor id_9,
    output supply1 id_10
);
  always @(negedge id_8) begin : LABEL_0
    if (1) begin : LABEL_1
      id_4 = id_5;
      id_1 = id_6;
      $unsigned(15);
      ;
    end else SystemTFIdentifier(id_8, 1, id_9, id_3, id_6);
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_9,
      id_9,
      id_2,
      id_8,
      id_8,
      id_3,
      id_6,
      id_10,
      id_8,
      id_6,
      id_3,
      id_8,
      id_9,
      id_3,
      id_7
  );
endmodule
