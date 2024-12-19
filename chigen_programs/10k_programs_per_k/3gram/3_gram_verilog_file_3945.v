// Seed: 569001480
module module_0 #(
    parameter id_2 = 32'd28,
    parameter id_3 = 32'd54
) ();
  assign module_1.id_4 = 0;
  assign id_1 = 1;
  defparam id_2.id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  tri0 id_5;
  module_0 modCall_1 ();
  always @(id_1 or posedge 1 || id_4 || "") begin : LABEL_0
    begin : LABEL_0
      id_2 = 1;
      if (id_5) id_3[1'h0] <= id_4;
      else begin : LABEL_0
        #1;
      end
    end
  end
endmodule
