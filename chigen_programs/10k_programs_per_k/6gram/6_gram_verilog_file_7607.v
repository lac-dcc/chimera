// Seed: 3380907894
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input tri id_2,
    input uwire id_3,
    input wire id_4,
    input uwire id_5,
    output wor id_6
    , id_8
);
  always @(posedge 1) force id_6 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    output logic id_1,
    output wire  id_2
);
  wor id_4 = id_0 - 1;
  bufif1 primCall (id_2, id_4, id_5);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  always begin : LABEL_0
    if (id_0) id_1 <= 1;
  end
endmodule
