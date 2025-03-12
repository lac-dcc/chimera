// Seed: 792202954
module module_0 (
    output supply1 id_0,
    output tri id_1,
    input wor id_2,
    output tri0 id_3,
    input uwire id_4,
    output wor id_5,
    input wor id_6,
    output supply1 id_7
);
  wire id_9;
  ;
  assign module_1.id_1 = 0;
  assign id_0 = id_9;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input wand id_2,
    output supply1 id_3
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3
  );
endmodule
module module_2 (
    output uwire id_0,
    input  wire  id_1,
    output logic id_2
);
  wire id_4;
  ;
  wire id_5;
  ;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
  wire id_6;
  ;
  wire id_7;
  always @(*) begin : LABEL_0
    id_2 = -1 == 1;
  end
  assign id_0 = 1'b0;
endmodule
