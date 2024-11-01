// Seed: 3007035552
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply1 id_3,
    input supply1 id_4,
    input tri0 id_5,
    output supply0 id_6,
    output supply0 id_7,
    input supply1 id_8,
    output supply0 id_9,
    input supply0 id_10,
    input uwire id_11,
    input tri id_12,
    output wor id_13
);
  wand id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25;
  assign id_9 = 1 ? 1'b0 : id_0 ? 1 : id_1;
  wire id_26;
  initial begin : id_27
    release id_22;
    #1 id_15 = 1'b0;
  end
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    input uwire id_2,
    output tri1 id_3
);
  always @(posedge 1, 1) #1;
  assign id_3 = 1 ? id_2 : id_1;
  assign id_3 = 1 && id_2 != ("" == 1);
  wire id_5;
  module_0(
      id_2, id_2, id_2, id_1, id_2, id_1, id_3, id_3, id_1, id_3, id_2, id_1, id_2, id_3
  );
  wire id_6;
  wire id_7, id_8;
  wire id_9;
  wire id_10;
  always @(posedge 1 == id_2) begin
    if (id_2) id_9 = id_6;
    else begin
      id_0 <= 1;
    end
  end
  wire id_11;
endmodule
