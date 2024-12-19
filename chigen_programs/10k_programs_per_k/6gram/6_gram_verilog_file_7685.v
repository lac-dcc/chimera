// Seed: 2838407912
module module_0;
  wire id_1, id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9;
  assign id_1 = id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wand id_5;
  assign id_1 = id_1 + 1 == id_3;
  generate
    if (id_4) begin : LABEL_0
      assign id_5 = 1;
      assign id_5 = 1;
    end else begin : LABEL_0
      always @(*) begin : LABEL_0
        id_1 <= 1;
      end
    end
  endgenerate
  module_0 modCall_1 ();
endmodule
