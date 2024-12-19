// Seed: 1619329258
module module_0 ();
  wire id_1;
  assign module_1.type_1 = 0;
  wire id_2;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    input uwire id_2,
    input wand id_3,
    input tri0 id_4,
    input logic id_5
    , id_7
);
  always @(id_0)
    if (1) begin : LABEL_0
      id_7 = 1;
    end else begin : LABEL_0
      if (1) id_1 = 1;
      id_1 <= id_5;
    end
  nor primCall (id_1, id_2, id_3, id_4, id_5, id_7);
  module_0 modCall_1 ();
endmodule
module module_2 (
    output wire id_0,
    input  wire id_1
);
  reg id_3;
  always
    repeat (1)
      for (id_0 = id_3; 1; id_3 = id_3) begin : LABEL_0
        id_3 <= id_3;
        disable id_4;
      end
  module_0 modCall_1 ();
endmodule
