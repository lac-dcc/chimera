// Seed: 1626996771
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    input wand id_3,
    input wire id_4,
    output wire id_5,
    input tri0 id_6
    , id_19, id_20,
    input wand id_7,
    input wand id_8,
    input tri0 id_9,
    input tri0 id_10,
    input supply1 id_11,
    input tri0 id_12,
    input tri0 id_13,
    input tri0 id_14,
    input wor id_15,
    input wand id_16,
    output uwire id_17
);
  wire id_21;
  wire id_22;
  id_23(
      .id_0(1),
      .id_1(1),
      .id_2(!id_9 == id_6),
      .id_3(id_6),
      .id_4(1),
      .id_5(id_2),
      .id_6(1),
      .id_7(1),
      .id_8(1'd0),
      .id_9(1 + 1)
  );
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input supply0 id_3,
    input tri0 id_4
    , id_15,
    input logic id_5,
    input tri id_6,
    output supply0 id_7,
    input tri0 id_8,
    input wor id_9,
    input wor id_10,
    input supply0 id_11,
    input wand id_12,
    output uwire id_13
);
  logic id_16;
  module_0(
      id_6,
      id_2,
      id_2,
      id_10,
      id_1,
      id_2,
      id_11,
      id_4,
      id_12,
      id_11,
      id_12,
      id_8,
      id_6,
      id_10,
      id_1,
      id_11,
      id_12,
      id_13
  ); id_17(
      .id_0(),
      .id_1(1),
      .id_2(1),
      .id_3(id_10),
      .id_4(id_4),
      .id_5(1 !=? 1'b0),
      .id_6(1),
      .id_7(1),
      .id_8(id_13),
      .id_9(1),
      .id_10(!id_7),
      .id_11(1'h0)
  );
  always @(1 or posedge id_3) begin
    id_0  = id_6;
    id_16 = 1 ? id_5 : id_4 == 1;
    id_16 <= 1;
    id_16 = id_8 == id_9;
  end
  assign id_15[1] = id_11;
endmodule
