// Seed: 1886935576
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output tri id_2
);
  assign id_2 = id_1 - $unsigned(23);
  ;
  assign module_2.id_2 = 0;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output logic id_0,
    output wire id_1,
    input wand id_2,
    input wor id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wire id_6
);
  always @(posedge 1) begin : LABEL_0
    id_0 = (-1 & 1);
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1
  );
endmodule
module module_2 (
    output supply0 id_0,
    output wire id_1,
    input wor id_2
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1
  );
endmodule
