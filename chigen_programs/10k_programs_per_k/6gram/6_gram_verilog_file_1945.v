// Seed: 1759517790
module module_0 (
    output wand id_0,
    output supply0 id_1,
    output wor id_2,
    output wor id_3,
    input tri1 id_4,
    input tri1 id_5,
    output wand id_6,
    output tri0 id_7
);
  assign id_6 = id_4;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input wire id_2,
    input wand id_3,
    input supply0 id_4,
    input tri0 id_5,
    input uwire id_6,
    input wire id_7,
    input wor id_8,
    output uwire id_9
);
  generate
    case (1)
      1'b0: supply1 id_11 = id_3;
      default:
      assign id_11 = 1;
    endcase
  endgenerate
  module_0 modCall_1 (
      id_9,
      id_9,
      id_11,
      id_9,
      id_7,
      id_1,
      id_11,
      id_9
  );
  assign modCall_1.id_3 = 0;
endmodule
