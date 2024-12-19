// Seed: 80838353
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    input wand id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wor id_5
);
endmodule
module module_0 (
    input uwire id_0,
    input wire id_1,
    input wand id_2,
    input tri0 id_3,
    output tri id_4,
    input uwire id_5,
    output logic id_6,
    output tri1 id_7,
    output tri id_8,
    input supply0 id_9,
    output logic module_1
);
  wire id_12;
  always @(posedge id_0)
    if (id_2)
      forever begin : LABEL_0
        if (id_2) id_10 <= 1;
      end
    else id_6 <= 1;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_9,
      id_5,
      id_1,
      id_5
  );
  assign modCall_1.type_8 = 0;
  wire id_13 = id_9 < id_1;
endmodule
