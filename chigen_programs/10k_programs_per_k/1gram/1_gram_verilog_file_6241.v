// Seed: 2914536191
module module_0 (
    output uwire id_0,
    output logic id_1,
    input wor id_2,
    output wor id_3,
    input wand id_4,
    input supply1 id_5,
    input wor id_6,
    output supply1 id_7,
    input tri1 id_8[1 : 1],
    output wor id_9,
    input tri0 id_10,
    output logic id_11,
    input uwire id_12,
    input tri id_13
);
  logic id_15 = 1 + -1;
  assign module_1.id_16 = 0;
  wire id_16;
  always begin : LABEL_0
    begin : LABEL_1
      begin : LABEL_2
        if (1) id_1 <= id_5;
        id_11 <= id_8;
      end
    end
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd2
) (
    output uwire id_0,
    output uwire _id_1,
    output logic id_2[-1 'b0 : (  -1  )  ?  -1 : id_1],
    output tri id_3,
    input tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    input uwire id_7,
    input uwire id_8,
    input wire id_9,
    input wand id_10,
    input supply1 id_11,
    input supply1 id_12,
    input supply1 id_13,
    input wor id_14,
    input wire id_15,
    input uwire id_16
);
  if (1) assign id_3 = 1;
  else id_18 : assert property (@(posedge -1'b0) -1) id_2 <= -1'h0;
  logic id_19;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_3,
      id_14,
      id_14,
      id_4,
      id_3,
      id_12,
      id_0,
      id_5,
      id_2,
      id_16,
      id_13
  );
  assign id_3 = id_7 / id_18;
  wire id_20;
  wire id_21;
endmodule
