// Seed: 1511917421
module module_0 (
    id_1,
    .id_4(id_2),
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_4;
endmodule
module module_1 #(
    parameter id_10 = 32'd90,
    parameter id_13 = 32'd95,
    parameter id_18 = 32'd26
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
    _id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    _id_18,
    id_19
);
  inout logic [7:0] id_19;
  input wire _id_18;
  output wire id_17;
  output logic [7:0] id_16;
  inout reg id_15;
  output wire id_14;
  input wire _id_13;
  inout wire id_12;
  inout wire id_11;
  input wire _id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_17
  );
  output wire id_2;
  output wire id_1;
  always @(posedge 1'h0 or posedge -1'b0) begin : LABEL_0
    $unsigned(12);
    ;
    if (1 && 1 != -1) SystemTFIdentifier(id_18);
    else begin : LABEL_1
      id_2 += !(id_12);
    end
  end
  always @(posedge id_19[id_10&id_13<-1]) begin : LABEL_2
    id_15 <= {id_8{id_15}};
    id_16[id_13 : id_18] = id_12;
  end
endmodule
