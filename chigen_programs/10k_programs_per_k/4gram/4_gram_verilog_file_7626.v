// Seed: 1119171858
module module_0 (
    output tri0 id_0,
    input  wand id_1,
    input  tri0 id_2,
    input  tri0 id_3,
    output wor  id_4,
    input  wand id_5
);
  assign id_4 = id_1;
  tri0 id_7 = 1;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    output tri1 id_0,
    output wor  id_1,
    input  wire id_2
);
  wire id_4;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2
  );
endmodule
module module_2 (
    input supply1 id_0,
    input wor id_1,
    output supply0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output tri id_5,
    input wand id_6,
    output logic id_7
    , id_11,
    input tri0 id_8,
    output wand id_9
);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_8,
      id_9,
      id_1
  );
  always @(negedge 1 or posedge 1 - 1) begin : LABEL_0
    assert (id_8);
    id_7 <= 1;
  end
endmodule
