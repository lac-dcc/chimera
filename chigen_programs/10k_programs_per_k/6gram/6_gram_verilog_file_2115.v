// Seed: 3229590841
module module_0 (
    output wor id_0,
    input wor id_1,
    input supply0 id_2,
    input wand id_3,
    input wand id_4,
    input tri0 id_5,
    output tri0 id_6
);
  always @(*) begin : LABEL_0
    if (1) begin : LABEL_1
      if ("") disable id_8;
      else begin : LABEL_2
        $signed(48);
        ;
      end
    end
  end
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input supply0 id_2,
    output tri0 id_3,
    output wand id_4,
    input uwire id_5,
    input supply1 id_6,
    output tri id_7
);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_5,
      id_6,
      id_6,
      id_7
  );
  assign modCall_1.id_5 = 0;
  wire id_9;
  ;
  initial id_1 = id_6;
endmodule
