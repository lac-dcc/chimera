// Seed: 2475296664
module module_0;
  assign id_1 = 1;
  wire id_2;
  module_2 modCall_1 (id_2);
endmodule
module module_1 ();
  assign id_1 = -1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  assign id_1 = id_2;
  assign module_3.type_2 = 0;
endmodule
module module_3 (
    output logic id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wand id_3,
    input logic id_4
);
  wire id_6;
  wor  id_7;
  uwire id_8, id_10;
  module_2 modCall_1 (id_7);
  always begin : LABEL_0
    id_0 <= id_4;
    begin : LABEL_0
      if (id_9) begin : LABEL_0
        #(1) $display(-1 / id_9, 1, -1'b0);
      end else $display(-1, 1);
      begin : LABEL_0
        id_0 <= ~id_7;
      end
    end
    if (id_10 < {-1{id_7}}) $display(id_3, id_2);
    id_9 <= id_9;
    id_9 <= id_4;
    @(posedge 1 & -1 or posedge id_10);
    id_0 = -1;
  end
  assign id_8 = -1;
endmodule
