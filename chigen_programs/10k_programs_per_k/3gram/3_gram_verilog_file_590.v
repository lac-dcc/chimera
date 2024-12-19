// Seed: 2745461616
module module_0 ();
  if (1) begin : LABEL_0
    always @(negedge 1) id_1 = #1 1'h0;
  end
endmodule
module module_1 ();
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
macromodule module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign module_3.id_2 = 0;
endmodule
program module_3 (
    input wire id_0,
    input uwire id_1,
    output supply0 id_2,
    input supply1 id_3,
    output tri id_4,
    output tri id_5
);
  wire id_7;
  supply1 id_8;
  module_2 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
  id_9 :
  assert property (@(posedge 1'b0) 1 && (1))
  else id_2 = 1'd0;
  assign id_2 = id_8;
endprogram
