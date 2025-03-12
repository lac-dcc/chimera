// Seed: 4201011588
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd29,
    parameter id_4 = 32'd82,
    parameter id_6 = 32'd30,
    parameter id_7 = 32'd62
) (
    inout tri id_0
    , id_11,
    input supply0 id_1,
    input tri _id_2,
    input wire id_3[-1 : id_4  ^  ( "" )],
    input wire _id_4[id_2 : 1 'b0 |  id_6],
    output tri1 id_5,
    input supply1 _id_6,
    input supply1 _id_7,
    output tri1 id_8,
    input tri id_9
);
  wire id_12;
  struct packed {
    logic id_13;
    logic id_14;
    logic id_15[id_7 : id_4];
    logic id_16;
  } id_17;
  module_0 modCall_1 (
      id_12,
      id_17
  );
  wire  id_18;
  logic id_19 = 'h0;
  generate
    begin : LABEL_0
      wire id_20;
    end
    assign id_17.id_15 = id_6;
  endgenerate
  logic id_21;
  struct packed {logic id_22;} id_23;
  parameter id_24 = 1;
  assign id_11 = 1;
  assign id_17.id_14 = -1;
  logic id_25;
  wire id_26, id_27;
  assign id_0 = 1;
endmodule
