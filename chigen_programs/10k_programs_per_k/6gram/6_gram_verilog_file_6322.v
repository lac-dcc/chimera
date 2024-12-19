// Seed: 1604547026
module module_0 #(
    parameter id_5 = 32'd90,
    parameter id_6 = 32'd95
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  defparam id_5.id_6 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
  wire id_6;
  assign id_2 = 1;
  wire id_7;
  always @(posedge id_4 - 1) begin : LABEL_0
    if (id_2) begin : LABEL_0
      {1'h0, id_2 != 1'b0} += id_1;
    end else id_4 = 1;
  end
endmodule
