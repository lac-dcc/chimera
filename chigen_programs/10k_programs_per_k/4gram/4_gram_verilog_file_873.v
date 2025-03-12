// Seed: 661511230
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    output supply0 id_2,
    input tri0 id_3,
    input supply0 id_4
    , id_18,
    input wand id_5,
    output logic id_6,
    output wand id_7,
    input wire id_8,
    input tri id_9,
    output supply0 id_10,
    output wor id_11,
    input wand id_12,
    output supply1 id_13,
    output tri0 id_14,
    output uwire id_15,
    input tri0 id_16
);
  always_ff @(posedge "") begin : LABEL_0
    $clog2(41);
    ;
    id_6 <= id_9;
  end
endmodule
module module_1 (
    input wire id_0,
    output wor id_1,
    input supply0 id_2,
    output supply0 id_3,
    output wor id_4,
    input tri0 id_5,
    output tri1 id_6,
    output logic id_7,
    input supply1 id_8,
    input tri id_9
);
  always @(posedge -1 or posedge 1) begin : LABEL_0
    id_7 <= 1;
  end
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_9,
      id_5,
      id_0,
      id_7,
      id_1,
      id_2,
      id_9,
      id_1,
      id_3,
      id_2,
      id_1,
      id_6,
      id_4,
      id_8
  );
  assign modCall_1.id_2 = 0;
endmodule
