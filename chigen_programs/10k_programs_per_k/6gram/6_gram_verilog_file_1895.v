// Seed: 2529880089
module module_0 #(
    parameter id_3 = 32'd83,
    parameter id_5 = 32'd50,
    parameter id_6 = 32'd57
);
  logic id_1;
  ;
  logic [7:0] id_2;
  logic _id_3;
  logic ["" : 1 'b0] id_4;
  parameter id_5 = ~1;
  wire [id_5 : id_3] _id_6;
  assign module_1.id_6 = 0;
  assign id_2[id_6] = id_4 ? -1 : 1;
  wire id_7;
  ;
  wire id_8;
endmodule
module module_1 #(
    parameter id_10 = 32'd17,
    parameter id_16 = 32'd96
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
    id_13,
    id_14,
    id_15,
    _id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire _id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire _id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout tri1 id_6;
  inout wire id_5;
  input wire id_4;
  inout reg id_3;
  output wire id_2;
  output wire id_1;
  always @(negedge 1) begin : LABEL_0
    if (1)
      if (!1) id_3 <= -1;
      else begin : LABEL_1
        @(negedge 1) release id_6;
      end
  end
  module_0 modCall_1 ();
  logic id_20 = !id_19;
  assign id_6 = "" < {id_7{id_14}};
  assign id_20[id_16 : id_10] = id_5;
  integer id_21, id_22;
endmodule
