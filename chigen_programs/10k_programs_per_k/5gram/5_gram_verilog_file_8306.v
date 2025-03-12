// Seed: 2324363487
module module_0 ();
  logic id_1 = id_1++;
endmodule
module module_1 #(
    parameter id_4 = 32'd56
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  inout wire id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  output wire id_5;
  inout wire _id_4;
  input wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_6 = id_1[id_4 :-1'b0];
endmodule
module module_2 #(
    parameter id_5 = 32'd39
) (
    input tri0 id_0,
    input uwire id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wand id_4,
    input wire _id_5,
    output logic id_6,
    input tri1 id_7,
    output uwire id_8,
    output supply0 id_9,
    output uwire id_10,
    output wand id_11,
    output supply1 id_12,
    output tri1 id_13
);
  always_comb @(negedge id_4 == id_0) begin : LABEL_0
    id_6 = 1'h0;
  end
  assign id_13 = id_2;
  wire [-1 'b0 -  1 : id_5] id_15;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_13 = id_4 ? 1'b0 - id_15 : -1 <= 1;
endmodule
