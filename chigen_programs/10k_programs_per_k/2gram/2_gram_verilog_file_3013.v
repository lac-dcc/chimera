// Seed: 153156539
module module_0;
  assign id_1 = 1;
  assign #id_2 id_1 = 1;
  genvar id_3;
  wire id_4;
  wire id_5;
endmodule
macromodule module_1 (
    input supply0 id_0,
    input supply0 id_1,
    output wire id_2,
    input supply1 id_3,
    output wor id_4
);
  wire id_6;
  reg  id_7;
  reg  id_8;
  reg
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22;
  assign id_18 = id_8;
  reg  id_23;
  module_0();
  wire id_24;
  wire id_25;
  always begin
    id_18 <= id_8;
    @(posedge 1 or negedge id_8)
    if ((id_7))
      @(posedge id_18)
      if (1)
        assume (id_18 == 1);
        else begin
          id_13 <= id_23;
        end
    id_7 = id_12;
    if (1) begin
      id_14 = 1;
    end
  end
  id_26(
      .id_0(1), .id_1(1'd0), .id_2(1), .id_3(1), .id_4(1), .id_5(1), .id_6(1)
  );
  or (id_2, id_20, id_21, id_22, id_23, id_3, id_6, id_7, id_8, id_9);
  reg id_27 = id_13;
  assign id_23 = 1;
endmodule
