// Seed: 215687110
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    output wire id_2,
    input wor id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri id_6,
    output wor id_7,
    output wor id_8,
    input tri1 id_9,
    output wire id_10,
    input wire id_11,
    output supply1 id_12,
    input tri1 id_13,
    input tri1 id_14,
    input wor id_15,
    input wor id_16,
    input uwire id_17,
    input supply1 id_18,
    input tri1 id_19,
    output tri0 id_20,
    output uwire id_21,
    input tri1 id_22,
    input wand id_23
    , id_26,
    output supply1 id_24
);
  wire id_27;
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    input tri0 id_2,
    output tri1 id_3,
    output wire id_4,
    output tri1 id_5,
    output tri0 id_6,
    output supply0 id_7,
    output tri1 id_8,
    output tri0 id_9,
    input tri id_10,
    output logic id_11,
    input tri0 id_12,
    input wand id_13,
    input wor id_14
);
  logic id_16, id_17, id_18;
  initial begin
    if (id_14) begin
      id_18 += 1;
      id_11 <= 1;
      id_5 = 1;
      if (id_14)
        if (1) id_1 <= 1;
        else id_7 = 1;
    end else begin
      id_19(1'b0);
      id_17 <= id_18 !== id_10;
    end
  end
  xor (id_11, id_17, id_2, id_14, id_18, id_12, id_10, id_16, id_13, id_0);
  module_0(
      id_14,
      id_9,
      id_6,
      id_2,
      id_2,
      id_13,
      id_13,
      id_7,
      id_6,
      id_10,
      id_5,
      id_12,
      id_6,
      id_12,
      id_10,
      id_12,
      id_2,
      id_10,
      id_13,
      id_12,
      id_6,
      id_8,
      id_13,
      id_12,
      id_7
  );
  assign id_16 = id_0;
endmodule
