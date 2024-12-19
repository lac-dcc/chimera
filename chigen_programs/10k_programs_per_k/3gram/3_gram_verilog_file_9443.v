// Seed: 1443711334
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    output wire id_3,
    input wire id_4
    , id_7,
    output wire id_5
);
  initial begin : LABEL_0
    #1;
  end
  wire id_8;
  assign id_5 = 1;
  assign id_0 = 1'b0;
  wire id_9;
  wire id_10;
endmodule
module module_1 (
    input supply0 id_0,
    output wire id_1,
    input tri1 id_2,
    input wand id_3,
    input supply1 id_4,
    input tri1 id_5,
    input wor id_6,
    output tri0 id_7,
    output tri1 id_8,
    input tri0 id_9,
    input wor id_10,
    input supply0 id_11
);
  assign id_8 = 1;
  xor primCall (id_7, id_4, id_2, id_9, id_10, id_6, id_3, id_0);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_9,
      id_8,
      id_6,
      id_7
  );
endmodule
