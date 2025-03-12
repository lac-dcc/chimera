// Seed: 2493585727
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input uwire id_2,
    input wor id_3,
    output tri1 id_4,
    input tri1 id_5,
    input wand id_6,
    input tri id_7,
    output supply0 id_8,
    input uwire id_9,
    output logic id_10
);
  assign id_10 = 1;
  logic id_12;
  ;
  wire id_13;
  always @* begin : LABEL_0
    id_10 = -1;
  end
endmodule
module module_1 (
    input  wand  id_0,
    input  wire  id_1,
    input  uwire id_2,
    output tri1  id_3,
    input  wand  id_4,
    output logic id_5
);
  supply0 id_7 = 1;
  wor id_8 = 1;
  always @(*) begin : LABEL_0
    id_5 = #id_9 1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_3,
      id_4,
      id_1,
      id_2,
      id_3,
      id_0,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
