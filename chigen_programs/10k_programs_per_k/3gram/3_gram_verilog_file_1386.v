// Seed: 719193770
module module_0 (
    output supply0 id_0,
    input tri id_1,
    output supply1 id_2,
    input tri0 id_3
);
  wire id_5;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    input wire id_2,
    input wire id_3,
    input wand id_4,
    input supply0 id_5,
    input supply1 id_6
);
  wand id_8;
  always_latch @(id_8 & 1 or id_4) begin
    $display(1);
  end
  assign id_0 = 1;
  wire id_9;
  always @(negedge id_8) begin
    id_0 <= 1;
  end
  uwire id_10 = id_5;
  wor   id_11;
  module_0(
      id_11, id_6, id_11, id_6
  );
  assign id_10 = id_11;
endmodule
