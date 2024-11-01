// Seed: 4181138229
module module_0 (
    input supply0 id_0,
    input wand id_1
    , id_18,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input wor id_5
    , id_19,
    output wire id_6,
    output wand id_7,
    output tri id_8,
    output uwire id_9,
    input uwire id_10,
    input wor id_11,
    input wor id_12,
    input uwire id_13,
    output supply1 id_14,
    input tri id_15,
    input wor id_16
);
  id_20(
      .id_0(id_14 | id_1), .id_1(|id_3), .id_2(1), .id_3(1)
  );
  assign id_3 = 1'b0;
  always @(posedge id_1) id_8 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    input logic id_2,
    input tri1 id_3,
    input tri id_4,
    output tri1 id_5,
    output supply0 id_6,
    input uwire id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri1 id_10,
    input wor id_11,
    input tri id_12,
    input tri1 id_13,
    output supply0 id_14,
    input wand id_15,
    input uwire id_16,
    input tri0 id_17
);
  assign id_6 = id_17;
  logic id_19 = id_2;
  supply1 id_20, id_21;
  module_0(
      id_7,
      id_15,
      id_7,
      id_5,
      id_3,
      id_3,
      id_14,
      id_0,
      id_14,
      id_14,
      id_12,
      id_12,
      id_9,
      id_4,
      id_0,
      id_7,
      id_11
  );
  logic id_22 = id_19;
  always @(!id_2 < id_12) begin
    id_1 <= 1;
    if (1'd0)
      if (1) id_1 += id_21;
      else begin
        id_19 <= 1 - 1;
      end
  end
endmodule
