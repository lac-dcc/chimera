// Seed: 637185056
module module_0 (
    output wire id_0,
    input uwire id_1,
    input wire id_2,
    output uwire id_3,
    output tri0 id_4,
    input supply0 id_5,
    input wand id_6,
    input wand id_7,
    input tri0 id_8,
    output wor id_9,
    output wand id_10
    , id_12
);
  wire id_13;
  id_14(
      .id_0(id_8), .id_1(1), .id_2(1), .id_3(id_12), .id_4(id_4), .id_5(id_9)
  );
endmodule
module module_1 (
    output supply0 id_0,
    output tri1 id_1,
    output logic id_2,
    input tri0 id_3,
    input wand id_4,
    input wire id_5,
    input wire id_6,
    input tri0 id_7,
    input wor id_8,
    output tri0 id_9,
    input supply1 id_10
    , id_20,
    input tri id_11,
    output tri0 id_12,
    input logic id_13,
    input wor id_14,
    input supply0 id_15,
    input tri0 id_16,
    output tri1 id_17,
    input uwire id_18
);
  always @(id_15 or negedge id_20) begin : LABEL_0
    id_2 <= {id_13, 1};
  end
  module_0 modCall_1 (
      id_20,
      id_11,
      id_20,
      id_0,
      id_1,
      id_6,
      id_6,
      id_11,
      id_20,
      id_9,
      id_12
  );
endmodule
