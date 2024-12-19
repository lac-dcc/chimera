// Seed: 1504193356
module module_0 #(
    parameter id_10 = 32'd25,
    parameter id_11 = 32'd85
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
  wire id_9;
  defparam id_10.id_11 = 1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    module_1,
    id_4,
    id_5,
    id_6
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_7 or posedge 1) begin : LABEL_0
    if (1)
      if (id_2) begin : LABEL_0
        id_6 <= (1);
        $display;
      end else id_4 <= id_4;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_5
  );
endmodule
