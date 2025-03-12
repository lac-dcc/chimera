// Seed: 3774410233
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    output wor id_4,
    input wire id_5,
    output supply0 id_6
);
  assign module_1.id_15 = 0;
  reg id_8;
  initial begin : LABEL_0
    begin : LABEL_1
      id_8 <= 1;
    end
    $signed(5);
    ;
  end
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    output supply0 id_2,
    output wand id_3,
    output tri id_4,
    input tri1 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input wire id_8,
    input wire id_9,
    input tri0 id_10,
    input supply1 id_11,
    output logic id_12,
    input supply0 id_13,
    output supply1 id_14
    , id_17,
    input tri0 id_15
);
  assign id_2 = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_13,
      id_5,
      id_4,
      id_5,
      id_6
  );
  logic id_18;
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_1
      id_12 <= id_9;
    end
  end
  nor primCall (id_6, id_9, id_5, id_7, id_1);
endmodule
