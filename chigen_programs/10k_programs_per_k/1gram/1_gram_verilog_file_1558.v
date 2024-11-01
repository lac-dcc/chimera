// Seed: 2874859784
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output tri1 id_2,
    input uwire id_3,
    output wand id_4,
    output wand id_5,
    output tri1 id_6,
    input tri id_7,
    output wire id_8,
    input tri1 id_9,
    input tri0 id_10,
    output wand id_11,
    output uwire id_12,
    input supply1 id_13,
    input wand id_14,
    input wor id_15,
    output supply0 id_16,
    input uwire id_17,
    input wand id_18,
    output tri0 id_19,
    output tri1 id_20,
    output supply0 id_21,
    input wand id_22,
    output wor id_23,
    input uwire id_24,
    input uwire id_25
);
  assign id_19 = id_25;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input wand id_2,
    output wand id_3,
    output tri0 id_4,
    input wire id_5,
    output tri0 id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri0 id_9,
    input tri1 id_10,
    output logic id_11,
    input tri0 id_12,
    output uwire id_13,
    input tri1 id_14,
    input wire id_15,
    input tri id_16
);
  wire id_18;
  assign id_6 = 1;
  uwire id_19, id_20, id_21, id_22;
  module_0(
      id_20,
      id_10,
      id_20,
      id_2,
      id_0,
      id_21,
      id_4,
      id_12,
      id_19,
      id_10,
      id_9,
      id_4,
      id_22,
      id_5,
      id_8,
      id_15,
      id_22,
      id_10,
      id_16,
      id_19,
      id_4,
      id_0,
      id_15,
      id_19,
      id_16,
      id_1
  );
  assign id_19 = id_21;
  uwire id_23, id_24;
  always begin
    id_11 <= $display(id_22, 1'b0 ? id_15 : 1'b0, id_24);
  end
endmodule
