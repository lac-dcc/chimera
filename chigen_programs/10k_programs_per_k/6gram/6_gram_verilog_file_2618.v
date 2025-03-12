// Seed: 2911094938
module module_0 (
    input uwire id_0,
    input tri   id_1,
    input wor   id_2,
    input tri0  id_3,
    input wor   id_4
);
  wire id_6;
  ;
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    output supply1 id_2,
    output logic id_3,
    input uwire id_4,
    input wor id_5,
    input supply0 id_6,
    input uwire id_7,
    input supply0 id_8,
    input tri id_9,
    input supply1 id_10
);
  wire id_12;
  always @(id_5 or posedge 1) begin : LABEL_0
    id_3 <= 1 ? 1 : id_0;
  end
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_6
  );
endmodule
