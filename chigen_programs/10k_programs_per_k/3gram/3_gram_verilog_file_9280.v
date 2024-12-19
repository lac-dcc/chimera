// Seed: 2944961647
module module_0 ();
  wire id_1;
  wire id_2;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input tri0 id_2,
    input uwire id_3,
    output tri1 id_4,
    input wor id_5,
    output tri id_6,
    input supply1 id_7,
    input logic id_8,
    output logic id_9,
    input tri1 id_10,
    output logic id_11,
    input tri id_12,
    input wire id_13,
    input supply1 id_14
);
  always @(posedge id_3)
    if (id_12)
      if (1) id_9 <= id_8;
      else begin : LABEL_0
        id_11 = #1 1;
      end
    else id_11 = 1'b0;
  or primCall (id_11, id_12, id_13, id_14, id_2, id_3, id_5, id_7, id_8);
  module_0 modCall_1 ();
endmodule
