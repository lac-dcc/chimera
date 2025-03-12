// Seed: 176243861
module module_0 (
    input tri0 id_0,
    output tri id_1,
    input supply0 id_2,
    input wand id_3,
    output wand id_4,
    input wand id_5,
    output tri0 id_6,
    input tri0 id_7,
    output tri1 id_8,
    input wire id_9,
    input wand id_10,
    output wire id_11
);
  assign id_4 = id_7 ? id_3 : -1;
  assign id_4 = 1'b0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    output tri1 id_2,
    input supply1 id_3,
    input tri id_4,
    input tri0 id_5,
    output logic id_6,
    input wor id_7,
    output supply0 id_8
);
  wire id_10;
  always @(*) begin : LABEL_0
    id_6 <= id_5 >= id_7;
  end
  module_0 modCall_1 (
      id_5,
      id_2,
      id_4,
      id_4,
      id_8,
      id_5,
      id_1,
      id_4,
      id_1,
      id_5,
      id_7,
      id_2
  );
endmodule
