// Seed: 2903228775
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    output wor id_2,
    input wor id_3,
    input uwire id_4,
    input wor id_5,
    input uwire id_6,
    input wire id_7,
    output supply0 id_8,
    input tri1 id_9
);
  wire id_11;
endmodule
module module_1 (
    input wire id_0,
    input logic id_1,
    output logic id_2,
    output logic id_3,
    input supply1 id_4,
    output wor id_5,
    output tri id_6,
    input wire id_7,
    output wire id_8,
    input supply1 id_9
);
  function id_11;
    output id_12;
    id_3 = id_1;
  endfunction
  wire id_13, id_14;
  nor primCall (id_3, id_13, id_9, id_4, id_1, id_0, id_7, id_11, id_14);
  always_comb @(posedge -1 or posedge -1 or posedge -1 == 1) id_2 <= 1;
  tri0 id_15 = {1{id_4}};
  integer id_16;
  final id_3 <= id_16 == 1'd0;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_15,
      id_0,
      id_9,
      id_7,
      id_15,
      id_4,
      id_15,
      id_15
  );
  assign modCall_1.type_3 = 0;
  parameter id_17 = 1'h0;
  wire id_18;
endmodule
