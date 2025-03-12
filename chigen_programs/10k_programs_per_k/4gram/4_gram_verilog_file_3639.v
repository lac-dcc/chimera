// Seed: 4284472514
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input tri0 id_2,
    input supply1 id_3,
    output wor id_4
);
  logic id_6;
  ;
  assign id_4 = 1;
  logic [-1 'b0 : 1] id_7;
  ;
  always #1 begin : LABEL_0
    id_6 = #id_8 1;
  end
  wire id_9;
  parameter id_10 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    output uwire id_2,
    output tri0 id_3,
    output tri1 id_4,
    input wand id_5,
    output uwire id_6,
    output wand id_7,
    output tri0 id_8
);
  assign id_8 = 'b0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
