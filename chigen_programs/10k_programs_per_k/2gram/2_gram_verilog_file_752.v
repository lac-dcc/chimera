// Seed: 603877259
module module_0;
  wire  id_1;
  logic id_2;
  localparam id_3 = 1;
  wire id_4;
  wire id_5;
endmodule
module module_1;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_9 = 32'd82
) (
    input uwire id_0,
    input wand id_1,
    output wire id_2,
    input tri id_3,
    input supply1 id_4,
    input tri0 id_5,
    input uwire id_6,
    output supply1 id_7,
    input wand id_8,
    input uwire _id_9,
    input wand id_10,
    output wand id_11,
    input uwire id_12,
    output wire id_13,
    output wor id_14,
    output tri id_15,
    input tri id_16,
    output logic id_17
);
  assign id_17 = id_3 == id_4 ^ id_16;
  wire [-1 'h0 -  1 'b0 : id_9] id_19;
  or primCall (id_11, id_12, id_16, id_19, id_3, id_4, id_5, id_6, id_8);
  assign id_19 = $clog2(43);
  ;
  module_0 modCall_1 ();
  parameter id_20 = -1;
  initial
    @(posedge -1) begin : LABEL_0
      id_17 <= 1;
    end
endmodule
