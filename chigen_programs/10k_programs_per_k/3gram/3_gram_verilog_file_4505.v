// Seed: 3254869131
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    output supply0 id_2,
    output wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input wand id_6,
    input tri1 id_7,
    output wor id_8,
    input uwire id_9,
    input wor id_10,
    output supply0 id_11,
    input tri0 id_12,
    output wire id_13,
    output wire id_14,
    inout supply1 id_15,
    input wire id_16
);
  uwire id_18 = 1;
  assign id_8 = 1'b0;
  uwire id_19;
  wire  id_20;
  assign id_0 = 1'b0;
  final $display(id_4, id_16('b0, 1, id_5, id_19));
  genvar id_21;
  wire id_22;
  wire id_23;
  tri  id_24 = 1;
  id_25 :
  assert property (@(posedge id_5) id_9)
  else if (id_10) assign id_23 = 1;
  else id_3 = 1;
  wire id_26;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input supply0 id_2,
    output wor id_3,
    output wire id_4,
    input wand id_5,
    input tri id_6
);
  supply1 id_8;
  module_0(
      id_8,
      id_4,
      id_4,
      id_1,
      id_6,
      id_6,
      id_5,
      id_6,
      id_3,
      id_0,
      id_0,
      id_8,
      id_5,
      id_3,
      id_3,
      id_8,
      id_0
  );
  initial begin
    id_4 = 1;
  end
  supply0 id_9;
  assign id_1 = id_8;
  wire id_10;
  wire id_11;
  supply1 id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22;
  id_23(
      .id_0(id_9 * id_22), .id_1(id_12), .id_2(~id_22)
  );
endmodule
