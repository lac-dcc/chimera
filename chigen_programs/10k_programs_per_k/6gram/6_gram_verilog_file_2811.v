// Seed: 3330551708
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input wor id_2,
    input uwire id_3,
    output wand id_4,
    input tri0 id_5,
    output uwire id_6,
    input uwire id_7,
    input tri id_8,
    output supply1 id_9,
    input tri1 id_10,
    output wire id_11
);
  parameter id_13 = 1;
  assign module_1.id_12 = 0;
  assign id_11 = -1;
endmodule
module module_1 (
    input uwire id_0,
    output logic id_1,
    output supply0 id_2,
    input wand id_3,
    input wor id_4,
    output wire id_5,
    input supply0 id_6,
    output wand id_7,
    input uwire id_8,
    input supply1 id_9,
    input wand id_10,
    input tri0 id_11,
    output wor id_12,
    input tri0 id_13
    , id_15
);
  wire id_16 = id_11;
  assign id_2 = -1 | id_11;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_10,
      id_5,
      id_3,
      id_5,
      id_4,
      id_0,
      id_12,
      id_3,
      id_12
  );
  always @(posedge id_13) begin : LABEL_0
    $unsigned(7);
    ;
  end
  always @(-1 or posedge 1'b0) begin : LABEL_1
    id_1 <= -1'b0;
  end
endmodule
