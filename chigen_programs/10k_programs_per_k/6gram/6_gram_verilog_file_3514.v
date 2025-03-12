// Seed: 1865608613
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  integer id_7;
  ;
  logic [1 'b0 : -1] \id_8 ;
  supply0 id_9;
  assign id_9 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    output tri id_2,
    input tri0 id_3,
    output uwire id_4,
    output logic id_5,
    output wor id_6,
    input tri0 id_7,
    output supply1 id_8,
    input supply0 id_9,
    output wire id_10,
    output wire id_11,
    input uwire id_12,
    input supply0 id_13,
    input wand id_14,
    input tri0 id_15,
    output tri1 id_16
);
  wire id_18;
  ;
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18
  );
  wire id_19;
  ;
  initial begin : LABEL_0
    id_5 <= -1;
  end
  nand primCall (id_16, id_12, id_7, id_18, id_14, id_9, id_0, id_15);
endmodule
