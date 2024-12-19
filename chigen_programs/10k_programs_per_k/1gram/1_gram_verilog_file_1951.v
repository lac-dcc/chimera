// Seed: 490348350
module module_0 (
    output uwire id_0,
    input  wand  id_1,
    input  wire  id_2,
    input  wire  id_3
);
  supply0 id_5;
  assign id_5 = id_2;
  assign id_5 = id_3;
  wire id_6;
  supply1 id_7 = id_1;
  wire id_8, id_9;
  assign id_0 = id_1;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input logic id_2,
    input tri1 id_3,
    output supply1 id_4,
    input tri1 id_5,
    output wor id_6,
    input tri1 id_7,
    input tri1 id_8
);
  reg id_10, id_11 = 1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_8
  );
  assign modCall_1.id_0 = 0;
  assign id_4 = id_3;
  always begin : LABEL_0
    begin : LABEL_0
      id_11 <= id_2;
    end
    $display(id_10 + 1);
  end
endmodule
