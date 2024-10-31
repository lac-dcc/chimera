// Seed: 1786723289
module module_0 (
    output supply1 id_0,
    input wor id_1,
    input tri0 id_2,
    output supply0 id_3,
    input supply0 id_4,
    output uwire module_0,
    input tri id_6,
    input tri1 id_7,
    input supply1 id_8
);
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input uwire id_2,
    output wire id_3
);
  uwire id_5;
  wire  id_6;
  wire  id_7;
  wire  id_8;
  module_0(
      id_3, id_0, id_0, id_3, id_0, id_3, id_1, id_2, id_0
  );
  assign id_5 = 1;
endmodule
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output supply0 id_2,
    output logic id_3,
    input supply1 id_4,
    output tri id_5,
    input wor id_6,
    input tri1 id_7,
    input supply1 id_8,
    output supply0 id_9,
    input wor id_10,
    input wire id_11,
    input wand id_12,
    input tri id_13,
    output uwire id_14,
    input uwire id_15,
    input wor id_16,
    input wor id_17,
    output logic id_18,
    input tri module_2,
    input wand id_20,
    output supply1 id_21
);
  always @(1 or id_12 - id_8) begin
    id_18 <= 1;
    id_3  <= 1;
    fork
      id_23;
      begin
        wait (1);
        wait (0 == 'h0);
      end
    join
  end
  module_0(
      id_21, id_15, id_7, id_5, id_0, id_9, id_6, id_12, id_0
  );
endmodule
