// Seed: 3281945475
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input tri1 id_2,
    input tri id_3,
    input uwire id_4,
    input wand id_5,
    output uwire id_6,
    input tri0 id_7,
    input tri1 id_8,
    input wor id_9,
    output wor id_10,
    input wire id_11,
    input tri0 id_12,
    input tri id_13,
    input wand id_14,
    input wand id_15,
    output uwire id_16,
    output wand id_17,
    input tri1 id_18,
    input tri0 id_19,
    input supply1 id_20,
    input tri id_21,
    input uwire id_22,
    output tri0 id_23,
    input supply0 id_24,
    input wand id_25,
    input wire id_26,
    input supply0 id_27,
    output uwire id_28,
    input wire id_29,
    input wor id_30,
    output uwire id_31,
    input supply1 id_32,
    input wand id_33,
    output wor id_34,
    output supply0 id_35
);
  reg id_37;
  always @(1 or negedge id_1) begin
    if (1) $display(1, id_8);
    else id_37 <= 1;
  end
  assign id_16 = 1;
endmodule
module module_1 (
    input  wire  id_0,
    input  wor   id_1,
    input  tri0  id_2,
    input  wire  id_3,
    input  tri0  id_4,
    input  tri1  id_5,
    output wor   id_6,
    output logic id_7
);
  wire id_9;
  assign id_7 = 1;
  wire id_10;
  module_0(
      id_1,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5,
      id_6,
      id_1,
      id_1,
      id_1,
      id_6,
      id_2,
      id_2,
      id_1,
      id_4,
      id_3,
      id_6,
      id_6,
      id_3,
      id_2,
      id_3,
      id_0,
      id_1,
      id_6,
      id_0,
      id_3,
      id_0,
      id_1,
      id_6,
      id_5,
      id_1,
      id_6,
      id_1,
      id_2,
      id_6,
      id_6
  );
  always @(posedge id_4 or posedge 1'h0 - 1'b0) begin
    if (id_10) disable id_11;
    else begin
      id_7 <= 1 + 1 + id_1 * 1 - id_0;
    end
  end
endmodule
