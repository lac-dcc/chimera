// Seed: 383284225
module module_0 (
    output tri id_0,
    input supply1 id_1,
    output tri id_2,
    input tri1 id_3,
    input tri0 id_4
);
  logic [1 : 1 'b0] id_6;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    output wire id_2,
    input tri id_3,
    output wor id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
  wire id_7;
endmodule
module module_2 #(
    parameter id_3 = 32'd68
) (
    output wand id_0,
    output wire id_1,
    input  wor  id_2,
    output wire _id_3
);
  struct packed {
    logic [1 : 1] id_5;
    logic [1 : id_3] id_6;
  } id_7;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
