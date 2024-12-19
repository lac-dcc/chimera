// Seed: 3599058889
macromodule module_0 (
    input wor id_0,
    input wand id_1,
    input wor id_2,
    output supply0 id_3,
    output wor id_4,
    output uwire id_5
);
  id_7(
      .id_0(id_1), .id_1(id_3)
  );
  assign module_2.type_6 = 0;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input  wand id_0,
    output tri  id_1
);
  always @(*) begin : LABEL_0$display
    ;
  end
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 (
    output wand id_0,
    output wor id_1
    , id_4,
    input supply0 id_2
);
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
