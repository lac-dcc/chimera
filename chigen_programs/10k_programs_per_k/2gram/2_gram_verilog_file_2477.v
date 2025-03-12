// Seed: 2401196132
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input wor id_2,
    input wand id_3,
    output tri1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    output wire id_7
);
  always begin : LABEL_0
    if (1) begin : LABEL_1
      disable id_9;
    end
  end
endmodule
module module_1 (
    output tri0 id_0,
    input tri1 id_1,
    output supply0 id_2,
    output supply0 id_3,
    output tri id_4,
    input supply0 id_5,
    input tri id_6,
    output tri1 id_7,
    output tri0 id_8,
    input supply1 id_9
    , id_13,
    output wor id_10,
    input wire id_11
);
  logic id_14;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_6,
      id_9,
      id_8,
      id_9,
      id_6,
      id_8
  );
  assign modCall_1.id_3 = 0;
endmodule
