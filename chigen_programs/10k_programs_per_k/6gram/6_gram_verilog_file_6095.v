// Seed: 1851633838
module module_0 #(
    parameter id_10 = 32'd39,
    parameter id_11 = 32'd49,
    parameter id_12 = 32'd20,
    parameter id_7  = 32'd67,
    parameter id_8  = 32'd26,
    parameter id_9  = 32'd63
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_7.id_8 = 1'b0, id_9.id_10 = id_10, id_11.id_12 = 1;
  assign module_1.type_3 = 0;
endmodule
module module_1;
  wire id_2;
  assign id_1 = id_2;
  always @(id_1 or posedge 1) begin : LABEL_0
    if (id_2) begin : LABEL_0
      #1;
    end else begin : LABEL_0
      id_2 = 1;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1
  );
endmodule
