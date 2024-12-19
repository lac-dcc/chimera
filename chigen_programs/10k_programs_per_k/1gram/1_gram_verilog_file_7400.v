// Seed: 519549796
macromodule module_0 (
    input  wand  id_0,
    output uwire id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  wire  id_4
);
  id_6(
      id_1, id_4 && 1'b0, 1, id_4, {id_4{{id_3}, 1'b0}}
  );
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output logic id_2,
    input uwire id_3,
    output wand id_4,
    input uwire id_5,
    input supply0 id_6,
    output supply1 id_7,
    input logic id_8
);
  always_comb id_2 <= !id_8;
  id_10(
      1'b0
  );
  string id_11;
  reg id_12;
  always release id_4;
  assign id_7 = 1;
  wire id_13;
  always id_12 <= id_8;
  wire id_14;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_5,
      id_6,
      id_0
  );
  assign modCall_1.id_0 = 0;
  wire  id_15;
  wand  id_16;
  uwire id_17 = 1'b0 !=? id_16 & id_8;
  id_18(
      .id_0(id_4), .id_1(id_17 == id_12 - 1'h0)
  );
  wire id_19;
  wire id_20;
  assign id_11 = "";
endmodule
