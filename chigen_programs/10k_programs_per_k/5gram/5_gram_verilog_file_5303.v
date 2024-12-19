// Seed: 175535911
module module_0 #(
    parameter id_3 = 32'd90,
    parameter id_4 = 32'd59
);
  wire id_1;
  wire id_2;
  defparam id_3.id_4 = 1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_8;
  module_0 modCall_1 ();
  generate
    assign id_5 = id_3;
    always @(id_2 or id_3) begin : LABEL_0
      id_3 <= id_3;
      `define pp_9 0
      `pp_9 <= 1;
      id_1  <= id_3;
    end
  endgenerate
endmodule
