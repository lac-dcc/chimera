// Seed: 610979965
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input tri id_2,
    output wire id_3
    , id_11,
    output wire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    output supply0 id_8,
    input uwire id_9
);
  wire id_12;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    input wand id_0,
    input logic id_1,
    output wor id_2,
    input wor id_3,
    output logic id_4,
    input uwire id_5,
    input supply1 id_6,
    output wor id_7,
    input supply1 id_8,
    output tri0 id_9,
    input wor id_10,
    input tri0 id_11
);
  always #1 begin : LABEL_0
    id_4 <= 1'b0;
    id_4 <= id_1;
    id_2 = 0 == 1;
  end
  reg id_13;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_7,
      id_2,
      id_8,
      id_10,
      id_10,
      id_9,
      id_8
  );
  assign id_13 = ({1, 1}) != 1;
  always @(posedge id_13, posedge 1'h0) id_13 <= 1;
endmodule
