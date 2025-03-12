// Seed: 2791518323
module module_0 (
    input wor id_0,
    output logic id_1,
    output tri1 id_2,
    input supply1 id_3,
    output supply0 id_4,
    output tri0 id_5,
    input wand id_6,
    input wand id_7
);
  always_ff wait (1) @(id_0 or posedge 'd0 or posedge 1) id_1 <= !1;
  assign id_5 = (1);
  logic id_9;
  logic id_10;
  struct packed {logic id_11;} id_12 = -1;
  tri1 id_13 = id_7 & id_6;
endmodule
module module_1 #(
    parameter id_17 = 32'd94
) (
    input wand id_0,
    input supply0 id_1,
    input wor id_2,
    input wire id_3,
    input tri1 id_4,
    input uwire id_5,
    input uwire id_6,
    input supply1 id_7,
    output logic id_8,
    output logic id_9,
    input wire id_10,
    input supply1 id_11,
    output supply1 id_12,
    output logic id_13,
    input uwire id_14,
    output logic id_15
);
  always if (1) id_13 = new;
  always
    if (1) begin : LABEL_0
      id_8 = id_10;
      begin : LABEL_1
        id_9 = id_5;
        begin : LABEL_2
          @(posedge -1);
          begin : LABEL_3
            id_9  <= id_14;
            id_15 <= -1'd0;
            $clog2(83);
            ;
          end
          id_13#(
              .id_1(1),
              .id_4({"" ? 1 : -1{1}})
          ) <= -1;
        end
      end
    end
  supply1 [1 'h0 : -1] _id_17, id_18, id_19;
  assign id_18 = 1;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_12,
      id_2,
      id_12,
      id_12,
      id_4,
      id_10
  );
  struct packed {logic id_20[-1 'h0 : id_17  ===  -1];} id_21;
  ;
endmodule
