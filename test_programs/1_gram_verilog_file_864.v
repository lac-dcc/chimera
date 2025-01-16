// Seed: 1484604742
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    output supply1 id_4
);
  case (-1 - id_3)
    !((id_3)): assign id_4 = -1;
    default:
    wire id_6, id_7;
  endcase
  wire id_8;
  wire id_9;
  assign id_4 = 1;
  wire id_10, id_11, id_12, id_13, id_14, id_15;
  assign id_14 = id_11;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    input wire id_3,
    input tri1 id_4,
    input supply0 id_5,
    input wire id_6,
    input supply0 id_7
);
  assign id_9 = id_0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_9,
      id_9
  );
  assign modCall_1.id_3 = 0;
endmodule
