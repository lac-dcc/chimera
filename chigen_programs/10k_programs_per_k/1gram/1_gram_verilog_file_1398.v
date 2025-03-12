// Seed: 357139389
program module_0;
  localparam id_1 = 1;
  struct {logic id_2;} id_3;
  ;
  assign module_2.id_0 = 0;
  logic id_4;
endprogram
program module_1 (
    id_1[1 :-1],
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout reg id_3;
  inout wire id_2;
  module_0 modCall_1 ();
  output logic [7:0] id_1;
  always @(posedge -1 or posedge 1'h0) begin : LABEL_0
    id_3 = 1;
  end
endprogram
module module_2 (
    output wand id_0,
    input  wire id_1
);
  wire id_3;
  bufif1 primCall (id_0, id_1, id_3);
  module_0 modCall_1 ();
endmodule
