// Seed: 649583172
`timescale 1ps / 1ps
module module_0 #(
    parameter id_1  = 32'd34,
    parameter id_10 = 32'd78,
    parameter id_2  = 32'd67,
    parameter id_3  = 32'd1,
    parameter id_4  = 32'd97,
    parameter id_5  = 32'd2,
    parameter id_6  = 32'd17,
    parameter id_7  = 32'd92,
    parameter id_8  = 32'd52,
    parameter id_9  = 32'd56
) (
    output _id_1,
    output _id_2
);
  always @(posedge id_1[1] or negedge 1 - 1) begin
    id_2 = 1'h0;
  end
  always @(1) begin
    id_1 = id_1[1'b0 : id_1] - id_1[1];
  end
  assign id_2[1] = 1;
  logic _id_3;
  logic _id_4 = id_4 * 1;
  logic _id_5 = id_1 + 1;
  assign id_4 = id_3[~(id_3)];
  logic _id_6;
  assign id_4 = (id_5);
  always @(posedge id_1[id_2]) begin
    if (1'h0) begin
      #1 id_6 <= id_6;
      repeat (id_2) begin
        id_2 <= id_1[1'h0 : 1];
        id_4 = 1;
      end
      #1;
      if ("" == 1) begin
        id_3 <= id_3;
      end else SystemTFIdentifier(1 - id_4[id_4], "");
    end
    id_4 = 1;
    id_5 = id_5;
    #1;
    id_5 <= id_1;
    id_6 <= "";
    id_6.id_6[1<=id_1] = 1;
  end
  assign id_3 = id_5;
  type_15 _id_7 (
      .id_0 (id_5),
      .id_1 (1),
      .id_2 (1),
      .id_3 (id_6),
      .id_4 (id_3),
      .id_5 (id_2),
      .id_6 (id_1),
      .id_7 (1),
      .id_8 (id_4),
      .id_9 (id_1),
      .id_10(1'b0),
      .id_11(1),
      .id_12(id_5[1*1 : 1]),
      .id_13(0),
      .id_14(id_5),
      .id_15(1'b0),
      .id_16(1)
  );
  logic _id_8;
  logic _id_9, _id_10;
  always @(negedge !1)
    if (id_10) id_7 <= #1 id_4[id_9==id_10[1'b0 : id_4] : id_7];
    else begin
      id_8 = 1;
      if (id_10[1])
        if (id_4 && id_9 == 1'b0) begin
          id_5 <= id_5[1 : id_6[id_3!=id_4 : ""]];
        end
      wait (1);
      id_5 = id_4;
      id_1 = !(1 || id_7[id_3[1'b0]] || 1);
      id_6 <= 1;
      id_5 <= 1'b0;
      id_8 <= 1;
      id_5 <= id_6;
      @(posedge id_3);
      id_6 = 1;
      if (id_6[1-1]) begin
        id_7 <= 1 * id_10;
      end
      @(posedge 1'b0) id_3 = 1;
      #1;
      id_2 <= 1;
      #1;
      id_4 <= #1 id_2[""];
      SystemTFIdentifier(id_2[id_6] - 1);
      id_7 <= id_9;
      id_6 <= 1;
      id_1[id_8 : 0] <= id_10[id_4] - 1 * id_2;
    end
  assign id_1 = id_8[id_4 : id_4] ? 1 : id_6[id_1[id_5[id_10]]];
endmodule
