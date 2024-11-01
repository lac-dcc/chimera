// Seed: 1628690557
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input supply0 id_2,
    output uwire id_3,
    input logic id_4,
    output supply1 id_5,
    output logic id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri id_9,
    input supply0 id_10,
    input tri0 id_11
);
  logic id_13;
  always id_6 <= id_4;
  assign id_6 = ~(1'h0);
  wire id_14;
  assign id_13 = id_4;
  always_latch @(posedge id_4) id_6 = 1 & 1;
  id_15(
      .id_0(1), .id_1(id_11), .id_2(), .id_3(id_0), .id_4(1), .id_5(1 ? 1 : id_7), .id_6(id_8)
  );
  supply0 id_16 = 1 - id_0;
  wire id_17, id_18;
  wire id_19;
  integer id_20;
endmodule : id_21
module module_1 (
    output tri1 id_0,
    output logic id_1,
    input tri1 id_2,
    input tri1 id_3,
    input tri id_4,
    output tri0 id_5,
    input supply0 id_6,
    input wire id_7,
    input uwire id_8,
    input wor id_9,
    input wire id_10,
    input logic id_11,
    output wand id_12,
    input uwire id_13,
    input wire id_14,
    input supply0 id_15,
    input supply1 id_16
);
  always_comb
    if (1) @(posedge 1'b0) id_1 <= 1'b0 | 1;
    else;
  wire id_18;
  generate
    begin
      initial @(posedge 1 or posedge 1) id_1 <= id_11;
    end
  endgenerate
  module_0(
      id_4, id_12, id_6, id_12, id_11, id_12, id_1, id_10, id_6, id_10, id_2, id_15
  );
  always id_1 <= 1;
endmodule
