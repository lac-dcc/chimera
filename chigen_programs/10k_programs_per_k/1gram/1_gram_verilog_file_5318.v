// Seed: 410565988
module module_0 (
    output wand id_0,
    input wire id_1,
    input wand id_2,
    output wand id_3,
    input tri id_4,
    input tri1 id_5,
    input wor id_6,
    input tri id_7,
    input supply1 id_8,
    input tri id_9
);
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
module module_2 (
    output tri1  id_0,
    output tri0  id_1,
    output logic id_2,
    input  wor   id_3,
    output wor   id_4,
    output wire  id_5,
    input  tri0  id_6
);
  assign id_0 = id_6 >> 1'b0;
  assign id_5 = 1;
  assign id_1 = id_3;
  supply1 id_8;
  wire id_9;
  always
    if (id_8) begin : LABEL_0$display
      ;
    end else id_2 <= 1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_6,
      id_0,
      id_3,
      id_3,
      id_6,
      id_6,
      id_3,
      id_6
  );
  assign modCall_1.type_4 = 0;
  assign id_8 = id_8;
  wire id_10;
endmodule
