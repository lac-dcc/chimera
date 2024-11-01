// Seed: 265088153
module module_0 (
    output tri id_0,
    input tri0 id_1,
    input wor id_2,
    output supply1 id_3,
    input tri0 id_4,
    input wor id_5,
    output tri1 id_6,
    output supply0 id_7,
    output supply0 id_8,
    input tri0 id_9,
    input tri0 id_10,
    input wand id_11,
    input uwire id_12,
    input supply1 id_13,
    output tri id_14,
    input supply1 id_15,
    output tri id_16,
    output supply0 id_17,
    input tri0 id_18,
    input wand id_19,
    input wire id_20,
    input wire id_21,
    output tri0 id_22
);
  wire id_24;
  wire id_25;
  assign id_17 = 1 * 1;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri0 id_3,
    output wire id_4,
    input tri0 id_5,
    input tri id_6,
    input tri1 id_7,
    output tri id_8,
    input supply1 id_9,
    input tri id_10,
    input tri0 id_11,
    output tri1 id_12,
    input uwire id_13,
    input tri1 id_14,
    output tri0 id_15,
    input wand id_16,
    output wand id_17,
    output tri0 id_18,
    output wire id_19,
    output supply0 id_20,
    input uwire id_21,
    input uwire id_22,
    output logic id_23,
    output wire id_24
);
  always @(posedge id_10 or posedge 1) begin
    $display(id_22 == id_13, 1);
  end
  module_0(
      id_20,
      id_9,
      id_3,
      id_19,
      id_22,
      id_9,
      id_8,
      id_17,
      id_4,
      id_9,
      id_3,
      id_5,
      id_16,
      id_7,
      id_19,
      id_21,
      id_8,
      id_4,
      id_1,
      id_5,
      id_10,
      id_10,
      id_8
  );
  wand id_26;
  tri0 id_27, id_28;
  wor id_29;
  assign id_8 = 1;
  always @(1 or id_2) begin
    if (id_27 && (id_13)) begin
      assume #1  (id_29 | id_16)
      else $display(1);
      id_23 <= 1;
    end else assume (id_26 | 1);
  end
  assign id_18 = 1;
  assign id_17 = 1;
  assign id_20 = 1;
endmodule
