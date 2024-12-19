// Seed: 1135058566
module module_0 (
    output supply0 id_0,
    input wire id_1,
    output wand id_2,
    input uwire id_3,
    output wand id_4,
    input tri0 id_5,
    output tri id_6
);
  assign id_6 = id_3 == id_5;
  assign id_2 = 1;
  always @(posedge 1'b0) release id_0;
endmodule
module module_1 (
    output tri0  id_0,
    input  wor   id_1,
    output wand  id_2,
    output uwire id_3
);
  timeprecision 1ps;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    output tri0 id_0,
    input wor id_1,
    output tri0 id_2,
    output uwire id_3,
    input supply1 id_4,
    output tri id_5,
    input wand id_6,
    input wor id_7,
    output supply0 id_8,
    input tri1 id_9,
    output supply0 id_10,
    output logic id_11
);
  always @(posedge 1) begin : LABEL_0
    id_11 <= 1;
  end
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_1,
      id_0,
      id_7,
      id_5
  );
  assign modCall_1.type_2 = 0;
endmodule
