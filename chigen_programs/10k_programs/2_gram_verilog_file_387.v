// Seed: 2338438205
module module_0 (
    output wand id_0,
    input wand id_1,
    input wand id_2,
    output tri1 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output tri0 id_6#(
        .id_11(1'b0),
        .id_12(1)
    )
    , id_13,
    output supply0 id_7,
    output wor id_8,
    input wor id_9
);
  wire id_14;
  tri0 id_15;
  always id_15 = id_13[1] === 1;
  always_ff id_7 = id_11;
  assign #1 id_12 = id_1;
  supply0 id_16 = id_4;
  wire id_17;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    input wand id_2,
    input wire id_3,
    input tri0 id_4
);
  id_6 :
  assert property (@(posedge id_4 or posedge 1) id_2)
  else;
  module_0(
      id_6, id_0, id_2, id_6, id_0, id_3, id_6, id_6, id_6, id_6
  );
endmodule
