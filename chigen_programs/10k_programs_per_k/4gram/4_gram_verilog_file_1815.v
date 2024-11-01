// Seed: 1245042089
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  always @(negedge 1'b0) begin
    if (1) id_1 <= id_3;
    else id_2 -= 1;
  end
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    module_1
);
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(id_11 or posedge 1) begin
    disable id_12;
    assume (id_11 + id_12++);
    id_1 <= 1;
    for (id_6 = id_3; 1'd0 && id_5; id_11 = id_2) begin
      id_12 <= id_9;
    end
    #1;
    id_7 <= !id_3 ? id_11 : 1;
    id_1 = id_5;
    id_5 = id_11;
    id_3 <= 1;
  end
  module_0(
      id_7, id_6
  );
endmodule
