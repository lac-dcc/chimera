// Seed: 3673038243
module module_0 #(
    parameter id_12 = 32'd24,
    parameter id_18 = 32'd95,
    parameter id_23 = 32'd82,
    parameter id_28 = 32'd45
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output id_17;
  output id_16;
  input id_15;
  input id_14;
  output id_13;
  input _id_12;
  output id_11;
  input id_10;
  input id_9;
  output id_8;
  output id_7;
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  logic [(  1  )] _id_18 = id_18;
  initial id_2 = 1'h0;
  logic id_19;
  initial begin
    begin
      @(id_4 or ~id_11 or id_7) id_12 <= id_7;
      if ('b0) id_13 <= 1;
      else id_12 <= "";
    end
  end
  type_43
      id_20 (
          .id_0(1),
          .id_1(id_13[1]),
          .id_2(1),
          .id_3(1)
      ),
      id_21;
  type_44(
      id_2
  );
  reg id_22;
  assign id_4[!1] = 1'b0;
  logic _id_23;
  logic id_24, id_25;
  logic id_26, id_27, _id_28;
  logic id_29;
  logic id_30;
  function id_31(input id_32, id_33);
    SystemTFIdentifier(id_20[id_23], id_15[id_12 : 1]);
  endfunction
  logic id_34, id_35;
  assign id_9#(.id_21(id_1)) [id_18] = id_22;
  assign id_26 = id_5 & id_20;
  assign id_32 = id_9;
  logic id_36;
  assign id_28[id_28] = id_27;
  always id_22 <= id_22 ** 1;
  logic id_37, id_38;
  logic id_39;
  logic id_40;
  if (id_4) assign (strong1, strong0) id_39 = !1 & 1;
  type_55(
      .id_0(1)
  );
  type_56 id_41 (
      id_40,
      1'b0,
      {1 - id_10 & 1 || id_15[id_12][1 : 1], 1'b0, 1, 1},
      id_30,
      id_34,
      id_14,
      1
  );
  always id_34 = SystemTFIdentifier(id_5[1], (1 | 1), (id_25) + 1);
endmodule
module module_1 (
    id_1
);
  output id_1;
  assign id_1 = id_1;
  logic id_2, id_3;
  assign id_1 = 1 <= id_3 ? id_1 : 1;
  assign id_2 = 'b0;
  type_11(
      .id_0(id_4), .id_1(id_2), .id_2('b0), .id_3(1), .id_4(1 || id_4), .id_5(1 - 1)
  );
  always @(posedge 1 == id_4) id_1 <= id_1;
  logic id_5, id_6;
  logic id_8;
  assign id_5 = 1'b0 != 1;
  logic id_9;
  assign id_8 = id_7;
  assign id_8 = 1'b0;
endmodule
