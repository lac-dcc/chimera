// Seed: 2400119672
module module_0 (
    output wire id_0,
    input supply0 id_1,
    input tri0 id_2,
    output tri id_3,
    output wand id_4,
    output tri0 id_5,
    input uwire id_6,
    input uwire id_7,
    input wand id_8,
    output supply0 id_9
);
  always @(posedge id_2 - 1 or posedge {id_2,
    id_8
  })
  begin : LABEL_0
    disable id_11;
  end
  initial assume (id_6);
endmodule
module module_1 (
    input supply0 id_0,
    output tri1 id_1,
    input wire id_2,
    input wand id_3,
    input supply0 id_4,
    output logic id_5,
    input supply1 id_6
);
  initial begin : LABEL_0
    $clog2(72);
    ;
    id_5 <= id_0;
  end
  module_0 modCall_1 (
      id_1,
      id_2,
      id_6,
      id_1,
      id_1,
      id_1,
      id_6,
      id_0,
      id_2,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
