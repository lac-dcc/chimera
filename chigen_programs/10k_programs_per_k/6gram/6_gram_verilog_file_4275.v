// Seed: 3987681368
module module_0 (
    output tri1 id_0,
    input wand id_1,
    output tri0 id_2,
    input wand id_3,
    output tri0 id_4,
    output wand id_5,
    output tri id_6,
    output wire id_7,
    input tri0 id_8,
    output supply0 id_9,
    output tri1 id_10,
    input wor id_11,
    input tri id_12,
    input wire id_13,
    output uwire module_0,
    input wand id_15,
    output tri0 id_16,
    input tri0 id_17,
    input uwire id_18
);
  always @(posedge id_8) id_9 = id_1;
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    input logic id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    output logic id_7,
    input wire id_8,
    output wor id_9,
    input wand id_10,
    input supply0 id_11,
    output wand id_12
);
  wire id_14;
  module_0(
      id_3,
      id_10,
      id_12,
      id_11,
      id_9,
      id_9,
      id_3,
      id_9,
      id_4,
      id_3,
      id_12,
      id_0,
      id_4,
      id_1,
      id_12,
      id_4,
      id_9,
      id_1,
      id_4
  );
  always @(posedge id_11) begin
    wait (1);
    id_7 <= id_2;
  end
endmodule
