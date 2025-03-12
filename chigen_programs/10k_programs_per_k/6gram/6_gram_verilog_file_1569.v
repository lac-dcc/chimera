// Seed: 92460577
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    output wire id_4,
    input tri1 id_5,
    output tri0 id_6,
    input supply0 id_7,
    output logic id_8
);
  always @(posedge 1'b0 + -1 or posedge -1) begin : LABEL_0
    id_8 = 1;
  end
endmodule
module module_1 (
    output uwire id_0,
    output logic id_1,
    output logic id_2,
    input tri1 id_3,
    input supply1 id_4,
    output wand id_5,
    input tri1 id_6,
    input uwire id_7,
    input supply1 id_8
    , id_14,
    output wand id_9,
    input tri id_10,
    input wor id_11,
    output wand id_12
);
  always #(1) begin : LABEL_0
    id_1 <= id_7;
    fork
      #1;
      $unsigned(32);
      ;
    join_any
    id_2 = id_11;
  end
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_7,
      id_5,
      id_8,
      id_5,
      id_8,
      id_1
  );
endmodule
