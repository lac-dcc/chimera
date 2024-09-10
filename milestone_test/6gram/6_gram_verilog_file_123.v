// Seed: 1952948195
`default_nettype id_1 `timescale 1ps / 1 ps
module module_0 #(
    parameter id_3 = 32'd37,
    parameter id_5 = 32'd98
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6
);
  input id_6;
  input _id_5;
  input id_4;
  input _id_3;
  output id_2;
  input id_1;
  assign id_2 = 1 & id_6 & id_3;
  assign id_5 = id_4;
  assign id_5 = 1;
  type_18(
      id_4, 1'b0
  );
  reg id_7 = (1'b0);
  defparam id_8.id_9 = ~id_2;
  always @(negedge id_4[id_5]) begin
    @(posedge 1) id_3 = 1'b0;
    SystemTFIdentifier(id_9, id_2[1]);
    id_8 <= id_1;
  end
  reg id_10;
  always #(1) begin
    if (1) begin
      if (id_2[1] || 1'h0 || ~id_3 || id_1) id_8 <= id_10;
      else begin
        id_8 <= id_7;
        id_3 <= 1;
      end
    end
  end
  logic id_11;
  logic id_12 = id_9(id_11 - 1, 1) << id_8 + id_5;
  reg   id_13;
  logic id_14;
  assign id_13[1^id_3] = id_9;
  logic id_15;
  defparam id_16.id_17 = 1;
endmodule
