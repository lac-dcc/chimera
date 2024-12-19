// Seed: 3108010213
module module_0 ();
  wire id_1, id_2;
  assign id_1 = 1;
  assign id_2 = id_1;
  wire id_3, id_4;
  wire id_5, id_6;
endmodule
module module_1 (
    output logic id_0,
    input  tri1  id_1,
    input  tri   id_2
);
  always
    if (id_2) id_0 <= !1;
    else begin : LABEL_0
      id_0 = 1'd0;
      if ("") begin : LABEL_0
        id_0 <= #1 1;
      end
    end
  assign id_0 = 1;
  wor id_4, id_5, id_6 = 1;
  module_0 modCall_1 ();
endmodule
