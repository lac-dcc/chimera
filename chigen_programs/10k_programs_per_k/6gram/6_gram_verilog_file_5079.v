// Seed: 2422514380
module module_0 (
    input wire id_0,
    output wire id_1,
    input wire id_2,
    output wire id_3,
    input tri0 id_4,
    input wor id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri0 id_8,
    output supply0 id_9,
    output tri1 id_10
);
  assign id_9 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input tri0 id_1,
    output supply0 id_2,
    input wire id_3,
    input wand id_4,
    output supply0 id_5,
    output tri1 id_6
    , id_16,
    output wor id_7,
    input tri0 id_8,
    inout uwire id_9,
    input tri0 id_10,
    output logic id_11,
    input wand id_12,
    output tri id_13,
    output tri0 id_14
);
  assign id_14 = id_1;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_10,
      id_5,
      id_1,
      id_3,
      id_8,
      id_4,
      id_12,
      id_14,
      id_14
  );
  always @(posedge 1) begin : LABEL_0
    id_11 <= 1;
  end
endmodule
