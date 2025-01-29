// Seed: 380824346
program module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri0 id_2
);
  wor id_4, id_5, id_6;
  id_7(
      .id_0(-1'h0), .id_1(id_0), .id_2(-1), .id_3(1), .id_4(-1 * id_4)
  );
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    output tri1 id_2,
    input wor id_3,
    output tri0 id_4,
    output uwire id_5,
    id_9,
    input wor id_6,
    input wor id_7
);
  wand id_10 = id_1;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_2 = id_1 | -1;
  supply1 id_12, id_13 = id_0;
  always begin : LABEL_0
    id_9 = id_3;
  end
  assign id_2  = id_9;
  assign id_10 = -1'b0;
endmodule
