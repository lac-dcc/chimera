// Seed: 297499028
module module_0 #(
    parameter id_11 = 32'd76,
    parameter id_12 = 32'd38
) ();
  always_latch @(id_1 == 1)
    if (!id_1) begin : LABEL_0
      id_1 <= id_1;
      id_1 = 1;
    end
  wire id_2;
  wire id_3;
  wire id_4;
  wor id_5, id_6, id_7, id_8;
  always @(posedge id_5) begin : LABEL_0
    release id_4;
  end
  wire id_9;
  wire id_10;
  always @* id_10 = id_3;
  defparam id_11.id_12 = id_8 == 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_12 = 0;
  wire id_4;
endmodule
