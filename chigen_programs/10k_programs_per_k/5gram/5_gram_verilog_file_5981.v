// Seed: 1492214239
module module_0 #(
    parameter id_6 = 32'd65,
    parameter id_7 = 32'd56
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  defparam id_6.id_7 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  always @(posedge 1 == id_1, posedge id_1) begin : LABEL_0
    #1 begin : LABEL_0
      id_2 = 1'b0 & 1;
    end
  end
  buf primCall (id_2, id_1);
endmodule
