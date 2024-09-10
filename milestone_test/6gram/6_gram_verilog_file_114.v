// Seed: 115756185
module module_0 #(
    parameter id_2 = 32'd84,
    parameter id_3 = 32'd3,
    parameter id_4 = 32'd51,
    parameter id_5 = 32'd54,
    parameter id_6 = 32'd99,
    parameter id_7 = 32'd32,
    parameter id_8 = 32'd60
) (
    output id_1,
    input logic _id_2,
    input _id_3,
    input logic _id_4,
    output logic _id_5
);
  always @(negedge 1 == 1'b0 or posedge (id_3) == 1)
    if (id_1) begin
      if (id_4 + 1) begin
        if (id_3[id_3] && id_5 === id_1[id_2 : id_4] && 1) begin
          id_5 = id_4;
        end
      end else begin
        if (1) begin
          id_3[id_4] = 1;
          id_4 = 1;
          id_2 <= id_3;
        end
      end
    end
  assign id_1[{id_3[1], id_5}] = (1) == 1;
  logic _id_6 = 1;
  type_0 _id_7 (
      .id_0 (1),
      .id_1 (id_2),
      .id_2 (1),
      .id_3 (id_1),
      .id_4 ((1)),
      .id_5 (1 & id_6 == id_2#(.id_6(1), .id_7(1'b0), .id_8(id_2), .id_9(1), .id_10(id_4[1]))),
      .id_11(id_2),
      .id_12(id_4)
  );
  always @(id_5[1'b0 : id_6] or id_7[1]) begin
    id_5 <= 1;
    if (1'b0) id_5 <= 1;
    id_6 <= 1 ? 1'h0 : id_3;
  end
  initial begin
    id_2 <= 1 | 1'd0 | 1;
    logic _id_8;
    #(1) id_1[id_8[1 : 1] : id_7] = 1'b0;
    id_2 = id_4;
    if (1)
      if ((1'b0)) begin
        id_5 <= #1 1'b0 - id_6;
      end
    #1
    if (id_3[1]) begin
      id_2#(
          .id_5(1'h0),
          .id_4(1),
          .id_4(1),
          .id_7(id_2),
          .id_6(id_4 + id_7),
          .id_7(id_3),
          .id_4(1),
          .id_1(1),
          .id_8(id_7)
      ) <= id_2;
      #1;
      id_7 <= id_7;
    end else begin
      #1
      if (id_7)
        id_4 <= id_1#(
            .id_2(""),
            .id_7(id_2),
            .id_1(1),
            .id_6(1'h0),
            .id_4(1'b0),
            .id_5(1 - (id_2)),
            .id_1(id_8),
            .id_4(1)
        );
    end
    id_6 <= id_4;
  end
endmodule
