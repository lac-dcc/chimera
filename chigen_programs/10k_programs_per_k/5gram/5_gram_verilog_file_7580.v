// Seed: 3204422654
module module_0 #(
    parameter id_4 = 32'd0,
    parameter id_5 = 32'd46
) (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  defparam id_4.id_5 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1,
    input logic id_2,
    input wor id_3,
    input wire id_4,
    input supply0 id_5,
    input tri1 id_6,
    output wor id_7,
    input tri1 id_8,
    input tri1 id_9,
    output wand id_10,
    input tri0 id_11,
    input wand id_12,
    input wand id_13
    , id_15
);
  assign id_15 = !id_12 == id_6;
  xnor primCall (id_10, id_0, id_5, id_3, id_11, id_8, id_1, id_16, id_13, id_12, id_6, id_9, id_4);
  always @(1'b0 - 1'h0) begin : LABEL_0
    if (id_6) begin : LABEL_0
      wait (~{id_6, 1, id_3}) begin : LABEL_0
        #1;
        id_15 <= id_2;
      end
    end else disable id_16;
  end
  module_0 modCall_1 (
      id_16,
      id_16,
      id_16
  );
endmodule
