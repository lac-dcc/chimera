// Seed: 2962017225
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    output tri1 id_2,
    output wor id_3,
    output tri0 id_4,
    input wire id_5,
    input wand id_6,
    output tri0 id_7,
    input supply1 id_8,
    input tri0 id_9
    , id_19,
    input wand id_10,
    output wor id_11,
    input tri0 id_12,
    input wire id_13,
    input supply0 id_14,
    output tri id_15,
    input tri1 id_16,
    output supply0 id_17
);
  assign id_4 = id_8;
  wire id_20;
  wire id_21, id_22;
  assign id_7 = 1;
  wire id_23;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    output logic id_2
);
  uwire id_4;
  module_0(
      id_4,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_0,
      id_1,
      id_4,
      id_1,
      id_4,
      id_0,
      id_4,
      id_4,
      id_4
  );
  assign id_4 = id_0;
  always @(id_1) begin
    begin
      #(1);
      $display(1, id_1 <= id_4);
      id_2 <= 1;
    end
  end
endmodule
