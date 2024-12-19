// Seed: 2346792399
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  assign module_2.id_19 = 0;
  always @(id_4 or 1) begin : LABEL_0
    if (id_4 ^ id_1) begin : LABEL_0
      id_3 = 1 ^ id_5 == 1;
    end
  end
endmodule
module module_1;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5
  );
  assign modCall_1.id_5 = 0;
  timeprecision 1ps;
endmodule
module module_2 (
    output supply0 id_0,
    output supply0 id_1,
    output uwire id_2,
    output tri1 id_3,
    output supply0 id_4,
    input tri1 id_5,
    inout logic id_6,
    output supply0 id_7,
    output wor id_8,
    input tri0 id_9,
    input tri0 id_10,
    input logic id_11,
    input logic id_12,
    output uwire id_13,
    output wor id_14,
    input wor id_15,
    input supply0 id_16,
    output wor id_17,
    input tri0 id_18,
    output uwire id_19,
    input wor id_20,
    input uwire id_21,
    input supply0 id_22,
    input tri0 id_23,
    output tri id_24
);
  assign id_24 = id_16;
  always @(posedge id_15)
    if (id_11 - {"", id_23}) begin : LABEL_0
      assign id_13 = id_12;
      id_6 <= !id_22;
      id_6 <= id_11;
      wait (1 & 1);
    end
  tri0 id_26 = id_9;
  assign id_8 = {id_18{1}};
  id_27(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1), .id_4(1), .id_5(id_26)
  );
  wire id_28;
  tri  id_29 = id_15;
  module_0 modCall_1 (
      id_28,
      id_28,
      id_28,
      id_28
  );
  assign id_6 = 1;
endmodule
