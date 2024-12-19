// Seed: 1447422236
module module_0 ();
  always @(1'd0 ~^ 1 or 1) begin : LABEL_0
    fork
      #1;
      #1 id_1 = 1;
    join
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_4;
  wire id_5;
endmodule
module module_2 (
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
    id_16
);
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg  id_17;
  wire id_18;
  always @(posedge 1 or posedge id_6) begin : LABEL_0
    id_4 <= id_8;
  end
  initial begin : LABEL_0
    fork
      begin : LABEL_0
        if (id_10) if ((id_7.id_10 + id_17)) if (1) id_15 = id_13;
      end
      id_19(id_6);
    join
    id_17 <= 1;
    id_17 <= 1;
    id_19 <= id_10;
  end
  assign id_4 = 1;
  always @(posedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  wire id_20 = id_11;
  or primCall (
      id_1,
      id_10,
      id_11,
      id_13,
      id_14,
      id_16,
      id_17,
      id_18,
      id_19,
      id_2,
      id_20,
      id_4,
      id_6,
      id_7,
      id_8
  );
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
