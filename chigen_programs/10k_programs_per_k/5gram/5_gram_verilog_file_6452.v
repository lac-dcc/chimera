// Seed: 3780881965
module module_0 (
    output tri1 id_0,
    output tri1 id_1,
    output uwire id_2,
    output wor id_3,
    input wire id_4,
    output supply1 module_0,
    input supply1 id_6,
    input supply1 id_7,
    input tri1 id_8,
    input tri id_9,
    input uwire id_10
);
  assign id_2 = id_6 & 1;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    output wire id_2
);
  always @(posedge (id_1)) begin : LABEL_0
    id_0 <= id_1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
