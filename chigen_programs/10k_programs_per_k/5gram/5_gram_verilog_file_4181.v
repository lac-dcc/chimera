// Seed: 1559756424
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input wand id_2,
    input supply1 id_3,
    input tri id_4,
    input supply0 id_5,
    input supply0 id_6,
    output supply0 id_7,
    input supply1 id_8,
    output uwire id_9,
    input supply1 id_10
);
  assign id_9 = id_2 > id_10;
  wire \id_12 = id_5;
  assign id_0 = -1'd0;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input tri id_5,
    output tri id_6,
    input uwire id_7,
    input uwire id_8,
    output tri id_9,
    input wor id_10,
    input tri1 id_11,
    output logic id_12,
    output wand id_13,
    output wire id_14
);
  always @(posedge id_8) begin : LABEL_0
    id_12 <= -1;
    $unsigned(64);
    ;
  end
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4,
      id_4,
      id_4,
      id_4,
      id_7,
      id_14,
      id_1,
      id_9,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
