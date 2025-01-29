// Seed: 3171719573
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input uwire id_3,
    input wire id_4
);
  wand id_6;
  wire id_7;
  parameter id_8 = 1'h0;
  assign id_1 = -1;
  wire id_9 = id_6;
  wire id_10, id_11;
  assign id_0 = id_6;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output wire id_2,
    input wor id_3,
    input tri id_4,
    input wor id_5,
    output supply0 id_6
);
  assign id_2 = 1'b0;
  parameter id_8 = ~{-1{1}};
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_0,
      id_3
  );
  assign modCall_1.id_4 = 0;
  assign id_2 = -1;
  localparam id_9 = id_0 ^ id_9;
endmodule
