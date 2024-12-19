// Seed: 1499412069
module module_0 (
    output tri1 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input uwire id_3,
    input wand id_4,
    input uwire id_5,
    input tri id_6,
    input tri1 id_7,
    input wand id_8,
    output tri id_9,
    input uwire id_10,
    input tri0 id_11
);
  wire id_13;
endmodule
module module_1 (
    input wire id_0,
    output supply1 id_1
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.type_14 = 0;
  wire id_3;
endmodule
module module_2;
  assign #1 id_1 = id_1 - 1;
  wire id_2;
  wire id_3;
  wire id_4;
endmodule
module module_3 (
    input  wand  id_0,
    input  wand  id_1,
    input  wor   id_2,
    output logic id_3
);
  always begin : LABEL_0
    begin : LABEL_0
      if (id_1) id_3 <= 1'b0;
      else id_3 = 1'h0 | 1 * 1;
    end
  end
  wire id_5, id_6;
  wire id_7, id_8;
  assign id_8 = 1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
