// Seed: 2747786697
module module_0 (
    output supply0 id_0,
    output wire id_1,
    output tri0 id_2,
    input tri1 id_3,
    input wand id_4,
    input supply1 id_5,
    input tri1 id_6,
    output wor id_7,
    input tri1 id_8,
    input tri0 id_9
);
  function id_11;
    input id_12;
    input id_13;
    input id_14;
    begin : LABEL_0
      id_13 = 1'b0;
    end
  endfunction
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri  id_1,
    input  wor  id_2,
    output tri0 id_3,
    input  tri  id_4
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_4,
      id_0,
      id_1,
      id_0,
      id_3,
      id_1,
      id_4
  );
  assign modCall_1.id_1 = 0;
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9;
  id_10(
      .id_0(id_6),
      .id_1(id_7),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(1'b0),
      .id_7(1),
      .id_8(id_7),
      .id_9(1 >> id_4),
      .id_10(1'b0),
      .id_11()
  );
endmodule
