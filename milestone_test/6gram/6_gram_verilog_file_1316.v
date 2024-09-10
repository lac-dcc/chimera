// Seed: 3146232832
module module_0 (
    id_1,
    id_2,
    id_3
);
  input id_3;
  input id_2;
  output id_1;
  assign id_3 = !id_1;
  logic id_4 = id_4, id_5;
  logic id_6 = id_5;
endmodule
module module_1 #(
    parameter id_10 = 32'd1,
    parameter id_12 = 32'd80,
    parameter id_17 = 32'd86,
    parameter id_5  = 32'd41
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6
);
  output id_6;
  input _id_5;
  output id_4;
  input id_3;
  output id_2;
  output id_1;
  reg id_7;
  type_38(
      id_6, (id_6[id_5]) < id_3, id_3 - 1, id_6
  );
  assign id_4 = id_5;
  reg id_8 = 1 ? id_3 : 1;
  always @(*)
    if ({id_4, {id_1{1}}}) id_8 <= (id_7);
    else id_2 = id_7;
  reg   id_9 = 1'b0;
  logic _id_10;
  assign id_7 = id_3;
  logic id_11;
  logic _id_12;
  reg
      id_13,
      id_14,
      id_15,
      id_16,
      _id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24 = 1,
      id_25;
  reg id_26, id_27, id_28, id_29, id_30, id_31, id_32, id_33, id_34, id_35;
  assign id_31[1] = id_21;
  reg id_36 = id_22;
  always @(posedge 1 or id_29) begin
    if (id_12) begin
      id_12[""] <= 1;
    end else begin
      if (1'h0 && 1 == 1) begin
        id_10 = 1;
        id_4  <= (id_24);
        id_21 <= id_25[id_10];
        #1 id_17[id_12] <= 1;
      end else begin
        if (id_12 - 1) begin
          #1;
          id_28 = id_36[id_17[1]];
        end else begin
          SystemTFIdentifier(id_8 == id_2, id_18, id_6, id_25, id_9);
          id_26 <= {1{1 | id_34 - id_26}};
          id_1  <= id_15;
          id_31 <= 1;
        end
      end
    end
    SystemTFIdentifier(1 == 1, {id_34 !== 1{1}}, id_3.id_36);
    id_20[1] <= 1'h0 - id_16;
  end
endmodule
