// Seed: 233413608
module module_0 (
    input wire id_0,
    output uwire id_1,
    output uwire id_2,
    input wire id_3,
    input wor id_4,
    input tri1 id_5,
    input tri0 id_6,
    input logic id_7,
    input tri0 id_8,
    input supply0 id_9,
    input uwire id_10,
    input wand id_11,
    output tri id_12,
    input supply1 id_13,
    input supply0 id_14,
    output supply1 id_15
    , id_22,
    output tri0 id_16,
    input wire id_17,
    output uwire id_18,
    input supply0 id_19,
    output logic id_20
);
  wire id_23;
  wire id_24;
  assign id_15 = 1;
  always @(negedge 1) begin
    id_20 <= id_7;
  end
  id_25(
      .id_0(id_3), .id_1(), .id_2(((id_15 == id_16)))
  );
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input supply1 id_2,
    input logic id_3,
    input uwire id_4,
    input wire id_5,
    input wand id_6,
    input logic id_7,
    inout logic id_8,
    input supply1 id_9,
    output tri id_10,
    input uwire id_11,
    output tri0 id_12
);
  assign id_8 = 1;
  module_0(
      id_11,
      id_10,
      id_12,
      id_5,
      id_11,
      id_9,
      id_9,
      id_7,
      id_6,
      id_5,
      id_1,
      id_0,
      id_12,
      id_5,
      id_5,
      id_12,
      id_12,
      id_9,
      id_12,
      id_2,
      id_8
  );
  initial begin
    begin
      deassign id_12;
      id_8 <= id_7;
    end
    id_8 <= id_3;
  end
endmodule
