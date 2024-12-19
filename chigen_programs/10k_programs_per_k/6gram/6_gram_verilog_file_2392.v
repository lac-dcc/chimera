// Seed: 3895593361
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input tri id_2,
    input supply1 id_3,
    input wire id_4,
    input tri1 id_5,
    output uwire id_6
);
  wand id_8;
  tri1 id_9 = id_0 ? 1 : id_5;
  assign module_1.type_0 = 0;
  assign id_9 = id_9;
  wire id_10;
  wire id_11;
  assign id_8 = id_4;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    output wand  id_2
);
  assign id_0 = !id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
  always #1 begin : LABEL_0
    id_0 <= 1;
  end
endmodule
