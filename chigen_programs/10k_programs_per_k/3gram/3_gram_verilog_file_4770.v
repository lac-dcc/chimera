// Seed: 4209264495
module module_0 (
    output wand id_0,
    output tri0 id_1,
    output tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri0 id_5
    , id_12,
    input wire id_6,
    output supply0 id_7,
    input uwire id_8,
    input uwire id_9,
    output wire id_10
);
  assign id_10 = $display(1'b0, (!1));
  always disable id_13;
  wire id_14;
  assign id_1 = id_8;
  wand id_15 = id_3;
  wire id_16;
  wand id_17 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    output logic id_2,
    input supply1 id_3
    , id_5
);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_3,
      id_3,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5,
      id_5
  );
  assign modCall_1.id_0 = 0;
  assign id_5 = id_1;
  always @(negedge id_1 or posedge id_3) id_2 <= #1 1;
endmodule
