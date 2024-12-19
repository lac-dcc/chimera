// Seed: 1617994309
module module_0 ();
  always @(posedge 1) begin : LABEL_0
    id_1 <= 1;
    if (id_1) begin : LABEL_0
      id_1 <= id_1 + ~id_1;
      wait (1'b0);
    end
  end
endmodule
module module_1 (
    output uwire id_0,
    input tri0 id_1,
    input tri1 id_2,
    output logic id_3,
    input tri1 id_4,
    input wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    input wor id_8,
    output tri id_9,
    output tri1 id_10,
    output tri0 id_11,
    input wor id_12,
    output wor id_13,
    input logic id_14,
    output supply1 id_15,
    output tri0 id_16
);
  wire id_18;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always #1 begin : LABEL_0
    id_3 <= id_14;
  end
endmodule
