// Seed: 2241887978
module module_0 (
    output tri1  id_0,
    output tri0  id_1,
    input  uwire id_2,
    input  tri1  id_3,
    input  tri0  id_4,
    output wire  id_5,
    output tri   id_6
);
  tri0 id_8 = id_2 | 1;
  assign id_0 = 1;
  assign id_8 = 1;
  generate
    if (1 && id_3) begin : LABEL_0
      assign id_5 = 1;
      assign id_6 = 1;
    end
  endgenerate
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri0 id_3,
    output wire id_4,
    output supply0 id_5,
    output tri1 id_6
);
  assign (strong0, strong1) id_4 = 1;
  wire id_8;
  genvar id_9;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_0,
      id_3,
      id_5,
      id_6
  );
endmodule
