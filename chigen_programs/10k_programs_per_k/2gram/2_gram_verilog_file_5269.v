// Seed: 1541107022
module module_0 #(
    parameter id_18 = 32'd12
) (
    input tri0 id_0,
    output uwire id_1,
    input wire id_2,
    input wand id_3,
    input supply1 id_4,
    output wor id_5,
    input tri0 id_6,
    output supply1 id_7,
    input wor id_8,
    output wire id_9,
    output wand id_10,
    input wand id_11,
    input tri id_12,
    input wand id_13,
    input wand id_14,
    output tri0 id_15
);
  wire id_17;
  assign module_1.id_2 = 0;
  localparam id_18 = 1;
  assign id_15 = id_4;
  if (-1) begin : LABEL_0
    wire id_19;
    initial begin : LABEL_1
      force id_19#(
          .id_13(1'h0),
          .id_12(-1)
      ) [~1] = -1'b0;
    end
    assign id_9 = 1;
    defparam id_18.id_18 = 1'b0;
  end
  wire id_20;
endmodule
module module_1 (
    inout wand id_0,
    input supply0 id_1,
    input tri1 id_2
);
  logic id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0
  );
endmodule
