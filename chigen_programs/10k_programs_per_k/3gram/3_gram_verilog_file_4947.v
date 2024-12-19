// Seed: 1105270152
module module_0 ();
  assign id_1 = "";
  assign module_2.id_7 = 0;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri0  id_1,
    output wor   id_2,
    input  tri0  id_3,
    output wand  id_4,
    input  uwire id_5,
    input  wire  id_6
);
  nor primCall (id_0, id_1, id_3, id_5, id_6);
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  tri0  id_0,
    output logic id_1,
    input  logic id_2,
    input  tri0  id_3,
    input  wire  id_4
);
  reg id_6 = 1;
  reg id_7, id_8;
  wire id_9;
  wire id_10, id_11;
  module_0 modCall_1 ();
  wire id_12;
  initial begin : LABEL_0
    `define pp_13 0
    if (id_8) id_1 <= 1;
    id_6 <= id_2;
    @(posedge 1) begin : LABEL_0
      foreach (id_14[1]) begin : LABEL_0
        id_7 <= #1  (1);
      end
    end
    `pp_13 = 1;
    {1'b0, `pp_13[1'b0]} <= id_8;
    id_7 = 1'b0;
  end
  wire  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ;
  wire id_29 = id_12;
endmodule
