// Seed: 2247798693
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri0 id_5,
    input wand id_6,
    output uwire id_7,
    output wand id_8,
    output uwire id_9,
    input tri id_10,
    output tri1 id_11,
    output wand id_12,
    input supply1 id_13
);
  wire id_15;
  assign id_12 = id_5 ? id_5 : 1;
  wire id_16;
  wire id_17;
  supply0 id_18;
  wire id_19;
  wire id_20;
  id_21 :
  assert property (@(posedge 1) 1'b0)
  else $display(1'h0 | id_0 > 1, id_4, id_18, 1 - id_2, 1);
  id_22(
      .id_0(id_12), .id_1(1'b0), .id_2(id_16)
  );
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    input wire id_2,
    input tri1 id_3,
    input wand id_4,
    output uwire id_5,
    input tri0 id_6,
    input wor id_7,
    input wire id_8,
    input wire id_9,
    output logic id_10,
    output wire id_11,
    input tri0 id_12,
    input wor id_13,
    input tri0 id_14,
    input supply1 id_15,
    output wor id_16,
    input supply1 id_17
);
  wire id_19;
  module_0(
      id_4, id_13, id_6, id_9, id_1, id_3, id_4, id_11, id_5, id_5, id_14, id_5, id_5, id_6
  );
  wire id_20;
  always @(posedge id_19) begin
    id_10 <= id_14 % id_0 ? 1 : 1;
  end
endmodule
