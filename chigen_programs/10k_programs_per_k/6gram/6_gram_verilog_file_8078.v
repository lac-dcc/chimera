// Seed: 2817706725
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    output tri1 id_2,
    output tri0 id_3,
    output tri id_4,
    input tri0 id_5,
    input wand id_6,
    output wor id_7
);
  assign id_3 = {id_0{1}};
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    input uwire id_5,
    output logic id_6,
    input wor id_7,
    output tri1 id_8,
    output tri id_9
);
  always @("" or -1) begin : LABEL_0
    id_6 <= id_1;
  end
  module_0 modCall_1 (
      id_2,
      id_8,
      id_8,
      id_9,
      id_9,
      id_0,
      id_7,
      id_9
  );
endmodule
