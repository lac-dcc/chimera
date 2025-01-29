// Seed: 2722797746
module module_0 (
    input wor id_0,
    output supply0 id_1,
    input tri id_2,
    input tri0 id_3,
    output supply1 id_4,
    output supply0 id_5,
    output wire id_6,
    input wire id_7,
    output uwire id_8
);
  assign id_8 = -1;
  reg id_10, id_11;
  wire id_12;
  parameter id_13 = -1;
  parameter id_14 = -1;
  assign id_5 = 1;
  reg id_15, id_16, id_17;
  bit id_18;
  id_19(
      id_7, 1'd0
  );
  wire  id_20;
  uwire id_21, id_22 = -1;
  always begin : LABEL_0
    cover (1) id_15 <= id_18;
    @(posedge {
      id_18,
      id_18 - 1'd0,
      id_18
    })
    if (id_14) begin : LABEL_0
      wait (1'b0) id_6 = 1;
      id_11 = id_16;
      begin : LABEL_0
        id_10 = id_13 === id_2;
      end
    end else id_11 = (1);
  end
  wire id_23;
  assign id_18 = 1;
  parameter id_24 = 1;
  assign id_8 = -1;
  wire id_25;
  wire id_26;
  wire id_27;
  wire id_28;
endmodule
module module_1 (
    input  wor  id_0,
    input  tri0 id_1,
    input  wand id_2,
    input  tri0 id_3,
    output wire id_4,
    input  wor  id_5
);
  wire id_7, id_8;
  assign id_4 = id_5;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_5,
      id_0,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4
  );
  assign modCall_1.type_38 = 0;
  wire id_9, id_10;
  wire id_11;
  logic [7:0][-1 'h0] id_12;
  wire id_13;
  wire id_14, id_15;
  tri0 id_16 = id_0 * id_1;
endmodule
