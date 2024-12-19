// Seed: 4221800905
module module_0;
  always @(posedge id_1 != (1)) #0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input wand id_2
    , id_15,
    input uwire id_3
    , id_16,
    input tri1 id_4,
    input wand id_5,
    output tri0 id_6,
    input uwire id_7,
    input tri0 id_8,
    input supply0 id_9,
    input wand id_10,
    input wire id_11,
    input supply0 id_12,
    input uwire id_13
);
  wire id_17;
  assign id_15 = id_12;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always @(negedge !id_3) begin : LABEL_0
    #1;
    wait (id_15);
  end
  wire id_18;
  assign id_17 = id_1;
endmodule
