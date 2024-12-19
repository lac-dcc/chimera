// Seed: 4061701868
module module_0 (
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4#(
      .id_2(id_9 + id_7),
      .id_9(1)
  ) = 1;
  assign id_14 = id_8;
  assign id_10 = id_9;
  always @(posedge 1) begin : LABEL_0
    if (id_6) disable id_18;
    else id_10 <= id_5;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(*) begin : LABEL_0
    begin : LABEL_0
      if ((id_6)) disable id_10;
      else
        for (id_7 = 1'd0; 1'b0; id_10 = id_10)
        if (id_1) begin : LABEL_0
          id_6 <= id_6;
          id_10 = id_5;
        end
    end
    id_7 <= id_9;
  end
  reg  id_11;
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_12,
      id_4,
      id_10,
      id_6,
      id_5,
      id_12,
      id_3,
      id_6,
      id_7,
      id_2,
      id_10,
      id_10,
      id_10,
      id_12,
      id_12,
      id_12
  );
  assign id_11 = id_9;
  assign id_9  = 1'd0 && 1;
  wire id_13;
  assign id_4 = 1;
  wire id_14;
  tri0 id_15 = 1 && 1;
  genvar id_16;
  wire  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ;
endmodule
