// Seed: 302181103
module module_0 (
    input wand id_0,
    output supply0 id_1,
    output supply1 id_2
    , id_8,
    input wire id_3,
    input wire id_4,
    input supply1 id_5,
    input wand id_6
);
  wire id_9;
  assign module_1.type_7 = 0;
endmodule
module module_1 #(
    parameter id_16 = 32'd27,
    parameter id_17 = 32'd82
) (
    input uwire id_0,
    input tri0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output supply0 id_5,
    output wor id_6,
    input supply0 id_7,
    input supply0 id_8,
    input wand id_9,
    output supply1 id_10
);
  reg id_12;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5,
      id_8,
      id_1,
      id_7,
      id_4
  );
  supply1 id_13;
  wire id_14;
  always @(*) begin : LABEL_0
    if (id_13) id_12 <= 1'd0 == id_7;
    else begin : LABEL_0
      id_10 = id_0 + 1 - id_14;
    end
  end
  uwire id_15 = 1;
  defparam id_16.id_17 = 1'b0;
endmodule
