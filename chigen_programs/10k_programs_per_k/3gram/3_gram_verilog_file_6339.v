// Seed: 2324490192
module module_0 (
    input id_0,
    output reg id_1,
    input reg id_2,
    input id_3,
    input reg id_4,
    output reg id_5,
    output reg id_6,
    input supply1 id_7,
    input id_8
);
  always @(posedge id_7) id_1 = id_2;
  always @(id_2 or negedge 1) begin
    id_1 <= id_4 + (1);
    #1 begin
      #1 id_5 = id_4;
    end
  end
  reg id_9;
  reg id_10, id_11;
  always @(posedge id_4)
    if (id_11 ? id_10 + id_3 : 1) id_5 <= 1;
    else begin
      if (id_9) id_11 <= id_0;
      else begin
        id_6 = 1;
      end
    end
  type_20(
      1, id_10
  );
  generate
    reg id_12 = id_9;
  endgenerate
  assign id_10 = id_12;
  always @(posedge id_7) id_6 <= id_7[1'd0] | 1;
endmodule
