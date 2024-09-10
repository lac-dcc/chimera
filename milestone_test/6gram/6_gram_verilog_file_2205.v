// Seed: 1798345411
module module_0 #(
    parameter id_8 = 32'd62,
    parameter id_9 = 32'd23
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  logic id_6;
  type_12(
      1'd0, id_4[1], !(id_5)
  );
  logic id_7;
  always @(posedge 1) begin
    id_1 <= id_3;
  end
  logic _id_8;
  logic _id_9;
  always @(1 or 1 or ~id_3[1 : id_9])
    if (id_2[id_8]) begin
      if (1) id_1[1] <= !1'b0;
      else id_1 <= id_3;
    end else id_3 <= 1;
  assign id_1 = 1 ? 1'b0 : id_1;
  logic id_10;
endmodule
