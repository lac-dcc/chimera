// Seed: 2559872614
module module_0 (
    output tri1  id_0,
    input  uwire id_1,
    output tri0  id_2
);
  wire  id_4;
  logic id_5;
  assign module_2.id_1 = 0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input uwire id_2,
    output supply0 id_3,
    input wor id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3
  );
endmodule
module module_2 (
    output supply1 id_0,
    output logic id_1,
    input wand id_2,
    input tri0 id_3
);
  initial begin : LABEL_0
    id_1 = id_3;
    $signed(76);
    ;
    SystemTFIdentifier(1);
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0
  );
  always @(posedge id_2) id_1 += 1;
  wire id_5;
endmodule
