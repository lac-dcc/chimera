// Seed: 3494766946
module module_0 ();
  wire id_1;
  assign module_2.type_1 = 0;
  wire id_2;
  wire id_4;
endmodule
module module_1 (
    output tri  id_0,
    input  tri0 id_1,
    input  tri  id_2,
    input  wor  id_3,
    output tri0 id_4,
    output tri0 id_5,
    output tri0 id_6,
    output wand id_7
);
  always @(posedge id_3) begin : LABEL_0
    if (1) $display(1 + id_3);
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    input uwire id_0,
    output tri0 id_1,
    input tri1 id_2,
    output wor id_3,
    input tri id_4,
    input logic id_5,
    output tri1 id_6,
    input tri1 id_7,
    input wand id_8,
    output logic id_9,
    output supply1 id_10,
    output logic id_11,
    output tri1 id_12
);
  wire id_14;
  always @(negedge 1) id_11 <= id_8 >>> id_5;
  wire id_15;
  module_0 modCall_1 ();
  always
    if (1'h0 || 1) begin : LABEL_0
      begin : LABEL_0
        #1 release id_10;
        id_9 <= id_5;
      end
    end
endmodule
