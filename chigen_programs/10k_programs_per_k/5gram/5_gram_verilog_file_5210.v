// Seed: 2655228482
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    output wand id_3,
    input supply1 id_4,
    output supply0 id_5
    , id_14,
    input wor id_6,
    input wire id_7,
    input tri id_8,
    input wor id_9,
    input tri1 id_10,
    output tri id_11,
    input wand id_12
);
  assign id_14 = id_4;
  wire id_15;
  ;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output wand id_0,
    output logic id_1,
    input supply1 id_2,
    input wor id_3
);
  generate
    always @(id_3 == ~id_2 or posedge id_3) begin : LABEL_0
      if (-1) id_1 <= id_2;
    end
  endgenerate
  logic id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_0,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_3
  );
endmodule
