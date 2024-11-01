// Seed: 1059343102
module module_0 (
    output supply0 id_0,
    output tri id_1,
    input supply0 id_2,
    input wor id_3,
    output wand id_4,
    output supply1 id_5,
    output uwire id_6,
    output supply1 id_7,
    input tri id_8,
    output supply1 id_9,
    input uwire id_10,
    input wand id_11,
    output tri0 id_12,
    input tri0 id_13,
    input supply0 id_14
    , id_16
);
  always @(posedge id_3 or id_13) begin
    assert (id_8);
  end
  always @(posedge id_10)
    if (id_3) #1;
    else $display("" & id_2 & id_8, 1);
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wand id_2,
    input wor id_3,
    output tri id_4,
    output wor id_5,
    output supply0 id_6,
    input tri id_7,
    input tri0 id_8
    , id_18,
    input wor id_9,
    input supply1 id_10,
    input tri0 id_11,
    input wand id_12,
    input uwire id_13,
    input wand id_14,
    input wand id_15,
    output wire id_16
);
  wire id_19;
  tri  id_20 = 1;
  wire id_21;
  module_0(
      id_16,
      id_6,
      id_7,
      id_8,
      id_4,
      id_4,
      id_6,
      id_16,
      id_14,
      id_16,
      id_12,
      id_12,
      id_5,
      id_13,
      id_0
  );
  assign id_16 = id_10;
  initial id_18 <= ~id_3;
endmodule
