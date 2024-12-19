// Seed: 1107874493
module module_0;
  wire id_1;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_4 <= id_1;
    case (id_2)
      id_4: id_5 = 1 ? 1'b0 : id_1.id_2;
    endcase
    id_4 <= 1;
  end
  integer id_6 = 1, id_7;
  module_0 modCall_1 ();
endmodule
macromodule module_2 (
    input uwire id_0,
    input wire id_1,
    input uwire id_2,
    output tri0 id_3,
    output tri0 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input supply0 id_7,
    output uwire id_8,
    output wor id_9,
    input supply0 id_10,
    input supply0 id_11,
    input wand id_12,
    output logic id_13,
    input supply1 id_14,
    input supply1 id_15,
    output wor id_16
);
  always_ff id_13 <= 1;
  module_0 modCall_1 ();
endmodule
