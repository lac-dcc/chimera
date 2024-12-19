// Seed: 4078174876
module module_0;
  reg id_1;
  reg
      id_2 = 1,
      id_3 (
          .id_0(1'd0),
          .id_1(id_2),
          .id_2(1),
          .id_3($display)
      );
  assign id_2 = 1;
  assign module_1.id_4 = 0;
  always
  fork : SymbolIdentifier
    #("" + id_3);
    begin : LABEL_0
      {id_2} += 1;
      id_1 <= id_2;
    end
  join
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    input tri id_3,
    input tri0 id_4,
    input wor id_5,
    input supply0 id_6,
    input tri0 id_7,
    input tri1 id_8,
    input supply0 id_9,
    output tri0 id_10
);
  assign id_10 = 1;
  module_0 modCall_1 ();
endmodule
