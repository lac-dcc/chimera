// Seed: 1501920778
macromodule module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output wire id_2,
    output wire id_3,
    output wire id_4,
    input wire id_5,
    input tri0 id_6,
    input tri1 id_7,
    input wand id_8
);
  assign id_2 = 1;
  wire id_10;
  assign id_3 = id_5;
  uwire id_11, id_12;
  assign id_3 = id_11 != ((id_11) < id_6);
  assign id_1 = id_7 ? id_12 : 1;
  assign module_1.id_12 = 0;
  genvar id_13;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input wand id_2,
    output tri1 id_3,
    output wand id_4,
    input wor id_5,
    input wire id_6,
    input tri0 id_7,
    output wire id_8,
    output tri0 id_9,
    output tri1 id_10,
    input wor id_11,
    input tri0 id_12,
    input uwire id_13,
    input supply1 id_14
);
  tri0  id_16;
  uwire id_17 = id_12, id_18 = id_14;
  initial
    if (1'h0)
      fork
        $display;
        #id_19 id_18 = -1;
      join
    else if (id_18) $display;
    else id_18 = 1;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_8,
      id_9,
      id_3,
      id_6,
      id_18,
      id_14,
      id_2
  );
  id_20(
      .id_0(-1), .id_1(id_16.id_17), .id_2(1), .id_3(1), .id_4(1'b0), .id_5(), .id_6(1)
  );
  initial $display(1);
  assign id_4 = -1'b0;
endmodule
