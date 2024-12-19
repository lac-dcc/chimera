// Seed: 2083877883
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    output wire id_3,
    input supply1 id_4,
    output wire id_5,
    input wand id_6,
    input tri id_7,
    input supply1 id_8
);
  generate
    if (id_1) begin : LABEL_0
      id_10(
          id_5, id_4, 1'b0
      );
    end else begin : LABEL_0
      assign id_0 = 1;
      id_11(
          .id_0(id_8), .id_1(1), .id_2(id_0), .id_3(id_1 < 1)
      );
    end
  endgenerate
endmodule
module module_1 (
    input wor id_0,
    input logic id_1,
    output supply1 id_2
    , id_12,
    output tri id_3,
    output supply1 id_4,
    output supply0 id_5,
    input tri id_6,
    input uwire id_7,
    output tri0 id_8,
    input wand id_9,
    output tri0 id_10
);
  assign id_12 = 1;
  assign id_2  = 1;
  always disable id_13;
  reg id_14;
  xnor primCall (id_4, id_12, id_9, id_13, id_6, id_1, id_7, id_0, id_14);
  module_0 modCall_1 (
      id_8,
      id_9,
      id_6,
      id_3,
      id_9,
      id_8,
      id_6,
      id_9,
      id_9
  );
  always
    repeat (1)
      if (1) begin : LABEL_0
        if ("") begin : LABEL_0
          id_12#(.id_6(1 == 1)) <= 1;
          #1 #0;
        end else id_14 <= id_1;
      end
endmodule
