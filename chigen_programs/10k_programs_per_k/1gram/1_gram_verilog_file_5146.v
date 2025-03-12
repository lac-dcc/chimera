// Seed: 3910248522
module module_0 #(
    parameter id_13 = 32'd64
) (
    output tri id_0
    , id_11,
    input tri1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    output tri1 id_4,
    output tri id_5[-1 : -1 'b0],
    output tri0 id_6,
    input wire id_7,
    input supply1 id_8,
    input tri0 id_9
);
  always begin : LABEL_0
    assign id_4 = id_8;
    begin : LABEL_1
      return id_9;
      begin : LABEL_2
        $clog2(23);
        ;
      end
    end
  end
  logic [1 : 1 'b0] id_12;
  initial id_12 = -1;
  logic _id_13;
  ;
  logic id_14;
  ;
  supply1 [id_13 : "" -  -1] id_15, id_16;
  pmos id_17 ("" & 1);
  assign id_16 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd70,
    parameter id_6 = 32'd94
) (
    input supply0 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input uwire _id_3
    , id_5
);
  logic _id_6;
  ;
  wire [id_6 : id_3] id_7, id_8;
  logic id_9, id_10;
  wire id_11;
  wire id_12, id_13;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_0 = 0;
  assign id_7 = id_7;
endmodule
