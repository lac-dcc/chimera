// Seed: 1710363287
module module_0 #(
    parameter id_1 = 32'd40,
    parameter id_2 = 32'd29,
    parameter id_5 = 32'd31
) (
    input logic _id_1,
    input logic _id_2,
    input id_3,
    output id_4,
    output _id_5,
    input id_6,
    input id_7,
    input id_8,
    output reg id_9
);
  reg id_10 = id_4;
  always @(*) id_4 <= id_6[~(id_1&id_5)];
  type_19(
      id_6[""][1'b0-id_2], id_3, id_9
  );
  logic id_11;
  type_21(
      1'd0, 1, id_7
  );
  assign id_4  = id_4.id_3 + 1'b0 ? id_6 : 1;
  assign id_10 = 1;
  logic id_12;
  always @(posedge 1) begin
    if (id_11) id_4 = 1'h0;
  end
  assign id_10 = 1;
  logic id_13;
  assign id_7 = id_12;
  assign id_3[id_5] = 1;
  assign id_3 = 1;
  logic id_14;
endmodule
module module_1 #(
    parameter id_4 = 32'd32,
    parameter id_7 = 32'd29
) (
    output logic id_1,
    input logic id_2,
    input id_3,
    output _id_4,
    output id_5,
    output id_6,
    output _id_7,
    input logic id_8,
    output logic id_9
);
  type_14(
      id_3, id_4 - id_5[{id_7{id_4}}], 1'b0
  );
  assign id_7 = id_8 ? id_6 : 1;
endmodule
