// Seed: 602180253
macromodule module_0 (
    input tri0 id_0,
    output wire id_1,
    input uwire id_2,
    output uwire id_3,
    input supply0 id_4,
    input wire id_5
);
  if (1)
    case ((id_0))
      -1: begin : LABEL_0
        wire id_7;
      end
      id_5: assign id_3 = 1'b0;
    endcase
  else begin : LABEL_1
    logic id_8;
    ;
  end
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input wire id_2,
    input tri1 id_3,
    input tri0 id_4,
    input uwire id_5,
    input uwire id_6,
    input tri0 id_7
    , id_23,
    input wand id_8,
    output supply1 id_9,
    input tri1 id_10,
    input wand id_11,
    output supply0 id_12,
    output logic id_13,
    output supply1 id_14,
    output tri1 id_15,
    output tri1 id_16,
    input supply0 id_17,
    input wand id_18,
    input supply0 id_19,
    input supply1 id_20,
    input tri1 id_21
);
  supply1 id_24 = 1'b0;
  final begin : LABEL_0
    id_13 = -1;
  end
  module_0 modCall_1 (
      id_2,
      id_12,
      id_2,
      id_14,
      id_19,
      id_8
  );
endmodule
