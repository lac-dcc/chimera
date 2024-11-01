// Seed: 62165619
module module_0 (
    input tri1 id_0,
    input tri id_1,
    output wor id_2,
    output tri id_3,
    input supply1 id_4,
    output supply0 id_5
);
  wire id_7;
  always @(id_4 or negedge id_1) begin
    disable id_8;
  end
  generate
    for (id_9 = id_0; 1; id_9 = 0) begin : id_10
      assign id_5 = id_9;
    end
  endgenerate
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    input tri id_2,
    input supply1 id_3,
    input wire id_4,
    output wire id_5,
    input tri1 id_6,
    input uwire id_7,
    output uwire id_8,
    output uwire id_9,
    input wor id_10,
    output wor id_11,
    output uwire id_12,
    input uwire id_13,
    output tri id_14
);
  id_16(
      1, id_9 !== 1
  );
  assign id_8 = $display;
  wand id_17 = 1 - id_0;
  module_0(
      id_6, id_10, id_5, id_5, id_1, id_5
  );
endmodule
