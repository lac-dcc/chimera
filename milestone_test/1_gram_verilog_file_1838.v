// Seed: 1363893667
module module_0 #(
    parameter id_11 = 32'd76,
    parameter id_27 = 32'd68,
    parameter id_3  = 32'd39
) (
    inout id_1
    , id_2,
    input _id_3,
    input logic id_4,
    input id_5,
    output logic id_6
    , id_7 = id_5(
        {1{1}} && id_5, 1 - id_6
    ),
    input reg id_8,
    input id_9#(
        .id_10 (id_7),
        ._id_11(id_5),
        .id_12 ("")
    ),
    input id_13,
    input id_14,
    input id_15,
    input id_16,
    input id_17,
    input logic id_18
    , id_19 = id_14[1],
    input id_20,
    output id_21,
    output id_22,
    output id_23,
    input id_24,
    input id_25
    , id_26, _id_27,
    output logic id_28
);
  type_35 id_29 (
      .id_0 (id_9),
      .id_1 (id_28[id_27[id_11]-id_11]),
      .id_2 (1 || 1),
      .id_3 (1),
      .id_4 (id_15),
      .id_5 ({id_25{id_15}}),
      .id_6 (id_2),
      .id_7 (1),
      .id_8 (id_18),
      .id_9 (),
      .id_10(1 + id_23),
      .id_11(1'h0),
      .id_12(id_22[~1'b0] == 1 & 1'b0),
      .id_13(1'b0),
      .id_14(id_6[id_27]),
      .id_15(id_20),
      .id_16(1),
      .id_17(id_15 ^ id_19),
      .id_18(1),
      .id_19(1'b0),
      .id_20(id_3),
      .id_21(1),
      .id_22(id_3)
  );
  type_36(
      .id_0(1'd0)
  );
  initial
    @(posedge id_14)
      if (id_28) SystemTFIdentifier(1'b0 || 1, 1'd0, "");
      else begin
        if (id_12[id_3] << 1)
          if (id_19)
            if (id_28 * id_8 - 1'b0) id_8 <= #1 id_5 || 1;
            else id_8 <= 1;
      end
  assign id_17 = id_4;
  always id_5 <= 1;
endmodule
