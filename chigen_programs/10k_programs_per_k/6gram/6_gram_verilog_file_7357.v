// Seed: 1788043407
module module_0 ();
  always disable id_1;
  assign module_1.type_16 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input  supply0 id_1,
    output supply1 id_2
);
  wand id_4;
  wire id_5;
  wire id_6;
  supply1 id_7;
  logic [7:0] id_8;
  tri id_9 = 1;
  module_0 modCall_1 ();
  wire id_10 = id_8[1];
  or primCall (id_0, id_1, id_4, id_5, id_6, id_7, id_8, id_9);
  assign id_7 = 1'd0;
  assign id_4 = 1;
endmodule
module module_2 (
    input logic id_0,
    output supply0 id_1,
    output wand id_2,
    input uwire id_3,
    output logic id_4,
    input logic id_5,
    output logic id_6
);
  always @(posedge 1) begin : LABEL_0
    id_6 = id_5;
    if (1) begin : LABEL_0
      id_4 = id_5;
    end
  end
  always @(posedge 1)
    if (id_3) id_4 <= id_0;
    else assign id_2 = id_0;
  module_0 modCall_1 ();
endmodule
