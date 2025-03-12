// Seed: 2570963725
module module_0 (
    input supply0 id_0,
    input tri0 id_1
);
  wire id_3, id_4, id_5;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_8 = 32'd0
) (
    output logic id_0,
    output supply1 id_1,
    input wire id_2,
    output supply1 id_3,
    output logic id_4,
    input supply0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input uwire _id_8,
    input wire id_9,
    input wand id_10
);
  notif0 primCall (id_4, id_9, id_10);
  logic [7:0] id_12;
  ;
  module_0 modCall_1 (
      id_2,
      id_6
  );
  always begin : LABEL_0
    @(posedge id_12 or posedge id_5) id_12["" : id_8] <= {1'b0, 1, 1, (1)};
    @(posedge -1) fork @(-1 or 1'b0, posedge -1); join_none
    id_0 <= #id_7 -1'h0;
    if (1)
      if (-1)
        @(posedge id_10 <-> -1 or -1 - id_5) begin : LABEL_1
          wait (id_5);
        end
    id_0 <= id_12 <-> id_7;
    id_4 = 1;
  end
endmodule
