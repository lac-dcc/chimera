// Seed: 1741641782
module module_1 (
    output supply1 id_0
    , id_15,
    input tri1 id_1,
    input uwire id_2,
    output wand id_3,
    input tri1 module_0,
    output uwire id_5,
    input tri0 id_6,
    input tri1 id_7,
    output supply1 id_8,
    output wand id_9,
    input tri id_10,
    inout wor id_11,
    input wand id_12,
    input tri0 id_13
);
endmodule
module module_0 (
    input tri id_0,
    input tri0 id_1,
    input tri id_2,
    input wor id_3,
    output uwire id_4
    , id_24,
    input supply0 id_5,
    output wor id_6,
    input wire id_7,
    input wire id_8,
    input supply1 sample,
    input tri0 id_10,
    input uwire id_11,
    input wire id_12,
    output tri id_13,
    output supply1 sample,
    output uwire id_15,
    input wire id_16,
    output tri id_17,
    input supply1 id_18,
    input uwire id_19,
    input wire id_20,
    input tri id_21,
    input uwire id_22
);
  reg id_25;
  module_0(
      id_4, id_11, id_2, id_24, id_11, id_15, id_0, id_2, id_4, id_24, id_11, id_24, id_19, id_20
  );
  always_ff @(negedge 1) begin
    if (id_18 == 1'b0) begin
      if (id_9) begin
        fork
          id_25 <= "";
          id_26;
        join
      end
    end else id_24 = id_1;
  end
  wire id_27;
  genvar id_28;
  assign id_4 = 1 - 1;
  wire module_1;
endmodule
