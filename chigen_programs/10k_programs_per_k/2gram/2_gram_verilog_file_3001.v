// Seed: 3438447316
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output logic id_2
);
  always_comb
  fork
    id_2 = id_1;
    id_2 <= -1;
    repeat ({
      -1 !== id_1#(
          .id_0(1 || 1'd0),
          .id_1(1),
          .id_1(1)
      ) < 1,
      id_1
    })
    $unsigned(80);
    ;
    if (1) begin : LABEL_0
      id_2 = id_1;
    end else if (~1) @(1);
    else release id_2;
    id_2 = 1;
  join
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd88,
    parameter id_11 = 32'd99,
    parameter id_2  = 32'd80
) (
    input supply0 _id_0,
    input uwire id_1,
    input wand _id_2,
    output supply0 id_3,
    output logic id_4,
    input wire id_5,
    output wand id_6,
    output logic id_7,
    input tri0 id_8
);
  assign id_3 = -1'b0;
  assign id_3 = -1 ? -1 : id_2;
  tri0 id_10;
  always @(id_10) begin : LABEL_0
    id_4 <= 1'h0;
    id_7 <= 1;
    id_7 = id_8;
    $clog2(43);
    ;
  end
  always begin : LABEL_1
    id_7 <= id_2;
  end
  assign id_10 = 1'b0 | 1;
  assign id_6  = id_8;
  wire _id_11;
  wire  [  ~&  id_2  :  id_0  ]  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  [  1  :  id_11  ]  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_7
  );
  wire [id_2 : -1] id_26;
endmodule
