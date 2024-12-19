// Seed: 2493920817
module module_0 (
    input supply0 id_0,
    output wire id_1,
    output supply0 id_2,
    input wire id_3,
    input tri1 id_4,
    input supply0 id_5,
    input wire id_6,
    input wor id_7
);
  always @(posedge id_7) id_2 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    output tri   id_1,
    output logic id_2
);
  reg id_4;
  always @(posedge id_4++
  or negedge id_4)
  begin : LABEL_0
    id_2 <= id_4;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.type_12 = 0;
  assign id_1 = 1;
endmodule
