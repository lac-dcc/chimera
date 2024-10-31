// Seed: 4251559610
module module_0 (
    output supply1 id_0,
    input wire id_1,
    input wor id_2,
    input supply1 id_3
    , id_26,
    output wand id_4,
    input wor id_5,
    input tri id_6,
    input tri0 id_7,
    output supply1 id_8,
    output wand id_9,
    input wire id_10,
    input uwire id_11,
    input tri0 id_12,
    input tri0 id_13,
    input supply1 id_14,
    input wor id_15,
    input wire id_16,
    input wand id_17,
    output tri id_18,
    input wand id_19,
    output tri id_20,
    input tri0 id_21,
    output tri1 id_22,
    output wor id_23,
    input tri id_24
);
endmodule
module module_1 (
    input  wire  id_0,
    input  logic id_1,
    input  tri0  id_2,
    input  logic id_3,
    input  wire  id_4,
    output tri0  id_5,
    input  tri1  id_6
);
  assign id_5 = id_2;
  module_0(
      id_5,
      id_2,
      id_6,
      id_2,
      id_5,
      id_0,
      id_6,
      id_0,
      id_5,
      id_5,
      id_0,
      id_2,
      id_6,
      id_0,
      id_2,
      id_6,
      id_2,
      id_6,
      id_5,
      id_6,
      id_5,
      id_0,
      id_5,
      id_5,
      id_2
  );
  reg id_8;
  always @(1 or posedge 1) begin
    id_8 <= id_1;
    #1 begin
      id_8 <= id_3;
    end
  end
  assign id_5 = 1'b0;
  xor (id_5, id_6, id_3, id_0);
endmodule
