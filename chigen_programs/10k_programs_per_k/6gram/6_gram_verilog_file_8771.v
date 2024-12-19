// Seed: 3007086859
module module_0 (
    input wand id_0,
    output wand id_1,
    input wand id_2,
    input tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    output tri0 id_6,
    input uwire id_7,
    output wire id_8,
    input tri id_9,
    input uwire id_10,
    input uwire id_11,
    input wire id_12,
    input uwire id_13,
    output uwire id_14
);
  wire id_16, id_17;
  uwire   id_18 = 1'b0;
  supply0 id_19 = id_9;
  assign id_1 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input logic id_1
    , id_5,
    output supply0 id_2
    , id_6,
    output tri0 id_3
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_3,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.type_22 = 0;
  always @(*) begin : LABEL_0
    id_5 <= id_1;
  end
endmodule
