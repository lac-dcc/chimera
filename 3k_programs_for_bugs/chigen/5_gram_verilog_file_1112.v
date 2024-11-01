// Seed: 3087598292
module module_0 (
    input uwire id_0,
    output wire id_1,
    output supply1 id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri id_5,
    input uwire id_6
    , id_24,
    output wand id_7
    , id_25,
    input tri id_8,
    input uwire id_9,
    input uwire id_10,
    input tri1 id_11,
    input wor id_12,
    input tri0 id_13,
    output wand id_14,
    input uwire id_15,
    output uwire id_16,
    input tri0 id_17,
    input wire id_18,
    output tri1 id_19,
    input uwire id_20,
    output tri1 id_21,
    input supply0 id_22
);
  always @(posedge 1'd0) begin
    begin
      id_25 <= 1'd0;
      #1;
    end
  end
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output supply1 id_3
);
  wire id_5, id_6, id_7, id_8;
  genvar id_9;
  wire id_10;
  wire id_11;
  xor (id_3, id_2, id_5, id_1, id_6, id_0, id_11, id_8, id_7);
  module_0(
      id_0,
      id_3,
      id_3,
      id_1,
      id_0,
      id_1,
      id_0,
      id_3,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_0,
      id_3,
      id_0,
      id_3,
      id_2
  );
endmodule
