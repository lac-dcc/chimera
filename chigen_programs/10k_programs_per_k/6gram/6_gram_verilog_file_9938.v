// Seed: 1209838657
module module_0 (
    input  tri0  id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  tri1  id_3,
    output tri0  id_4
);
  wire id_6;
  assign module_2.id_4 = 0;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output supply0 id_1,
    input tri id_2,
    input wor id_3,
    output logic id_4
);
  tri1 id_6 = 1'h0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0
  );
  always @(negedge id_6) begin : LABEL_0
    id_4 <= 1;
  end
endmodule
module module_2 (
    input  wand id_0,
    output tri  id_1
);
  uwire id_3, id_4 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_1
  );
endmodule
