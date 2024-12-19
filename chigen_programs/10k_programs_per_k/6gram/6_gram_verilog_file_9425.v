// Seed: 2287829976
module module_0;
  wire id_2;
  logic [7:0] id_4;
  assign id_4 = id_3;
  assign id_3 = id_3[1'b0];
endmodule
module module_1 (
    input  tri1  id_0,
    output wire  id_1,
    input  wand  id_2,
    output uwire id_3,
    input  tri1  id_4,
    input  wand  id_5,
    output logic id_6,
    output tri1  id_7
);
  wire id_9;
  always @(posedge 1 or posedge 1'b0) begin : LABEL_0
    release id_3.id_5;
  end
  module_0 modCall_1 ();
  wire id_10;
  wire id_11;
  xnor primCall (id_1, id_2, id_4, id_5, id_9);
  initial
    #(id_0) begin : LABEL_0
      id_6 <= 0;
      $display(1);
    end
endmodule
