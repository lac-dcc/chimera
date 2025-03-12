// Seed: 677856562
module module_0 (
    input  tri0 id_0,
    output tri0 id_1,
    input  wand id_2,
    input  tri1 id_3
);
  logic [-1 : 1 'b0] id_5;
  generate
    if (1) begin : LABEL_0
      assign id_1 = id_2 ? id_5 : -1;
    end else begin : LABEL_1
      for (id_6 = id_6; id_5; id_5 = id_6) begin : LABEL_2
        if (1) begin : LABEL_3
          genvar id_7, id_8;
          if (1 == 1) begin : LABEL_4
            always @(posedge "" - id_8) begin : LABEL_5
              if (1) id_5 <= id_8;
              else begin : LABEL_6
                release id_8;
              end
            end
          end
        end
      end
    end
  endgenerate
  tri0 id_9 = -1;
endmodule
module module_1 #(
    parameter id_4 = 32'd64
) (
    output supply1 id_0,
    output tri1 id_1,
    output wand id_2,
    input supply1 id_3,
    input supply0 _id_4
);
  logic id_6;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_9 = 0;
  wire id_7 = -1;
  assign id_7 = id_4;
  logic [-1 : id_4  *  1] id_8, id_9, id_10;
  logic id_11;
  specify
    (id_12 *> id_13) = (id_8, ~id_9 & id_10  : id_7++ < 1  : -1);
  endspecify
endmodule
