// Seed: 2032455171
module module_0 #(
    parameter id_4 = 32'd5,
    parameter id_5 = 32'd63,
    parameter id_6 = 32'd49
) ();
  logic id_1;
  parameter id_2 = 1;
  assign id_1 = -1'b0;
  always id_1 = "" * id_1;
  parameter id_3 = -1;
  wire _id_4;
  logic [7:0][1 : -1] _id_5;
  ;
  assign id_1 = 1;
  wire [1 : id_5] _id_6;
  assign module_1.id_0 = 0;
  logic id_7;
  ;
  wire id_8;
  struct packed {
    logic id_9;
    struct packed {
      logic   id_10;
      logic   id_11;
      integer id_12;
      integer id_13;
      logic   id_14;
    } id_15;
    union packed {
      struct packed {
        id_16 id_17[id_4 : -1];
        logic id_18;
        logic id_19;
      } [1 : 1] id_20;
      logic id_21;
    } id_22[-1 : id_6];
    logic id_23;
  } id_24 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd37,
    parameter id_9 = 32'd63
) (
    inout  tri   id_0,
    input  uwire id_1,
    input  tri   id_2,
    output tri0  id_3,
    input  uwire _id_4
);
  parameter id_6 = 1;
  wire [!  1 'b0 : 1] id_7, id_8;
  wire _id_9;
  genvar id_10;
  module_0 modCall_1 ();
  wire id_11;
  ;
  final
    @(id_10[id_9===id_4] | 1 - -1) begin : LABEL_0
      logic id_12[1 : 1];
      ;
    end
endmodule
