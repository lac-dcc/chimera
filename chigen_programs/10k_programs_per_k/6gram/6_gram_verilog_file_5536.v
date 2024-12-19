// Seed: 1470126228
module module_0 (
    output tri1 id_0,
    input wor id_1,
    input tri0 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input tri0 id_5,
    input wand id_6,
    input wor id_7,
    output tri0 id_8,
    input wire id_9,
    input wand id_10,
    output tri0 id_11
);
  assign id_11 = id_9;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input supply0 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output logic id_6,
    input wor id_7
);
  always @* begin : LABEL_0
    id_6 <= 1'b0;
    #id_9;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_0,
      id_3,
      id_5,
      id_1,
      id_0,
      id_2,
      id_4,
      id_0
  );
endmodule
