module issue_006(a, y);
  input [4:0] a;
  output [4:0] y;
  // icarus verilog has a bug (git 336b299) that prevents it from
  // evaluating ^~ in parameters. This is just a quick test of all
  // verilog expressions in localparams to catch such bugs.
  localparam [4:0] pb00 = 5'd00 +   5'd3;
  localparam [4:0] pb01 = 5'd01 -   5'd3;
  localparam [4:0] pb02 = 5'd02 *   5'd3;
  localparam [4:0] pb03 = 5'd03 /   5'd3;
  localparam [4:0] pb04 = 5'd04 %   5'd3;
  localparam [4:0] pb05 = 5'd05 **  5'd3;
  localparam [4:0] pb06 = 5'd06 >   5'd3;
  localparam [4:0] pb07 = 5'd07 >=  5'd3;
  localparam [4:0] pb08 = 5'd08 <   5'd3;
  localparam [4:0] pb09 = 5'd09 <=  5'd3;
  localparam [4:0] pb10 = 5'd10 &&  5'd3;
  localparam [4:0] pb11 = 5'd11 ||  5'd3;
  localparam [4:0] pb12 = 5'd12 ==  5'd3;
  localparam [4:0] pb13 = 5'd13 !=  5'd3;
  localparam [4:0] pb14 = 5'd14 === 5'd3;
  localparam [4:0] pb15 = 5'd15 !== 5'd3;
  localparam [4:0] pb16 = 5'd16 &   5'd3;
  localparam [4:0] pb17 = 5'd17 |   5'd3;
  localparam [4:0] pb18 = 5'd18 ^   5'd3;
  localparam [4:0] pb19 = 5'd19 ^~  5'd3;
  localparam [4:0] pb20 = 5'd20 <<  5'd3;
  localparam [4:0] pb21 = 5'd21 >>  5'd3;
  localparam [4:0] pb22 = 5'd22 <<< 5'd3;
  localparam [4:0] pb23 = 5'd23 >>> 5'd3;
  localparam [4:0] pu00 = +  5'd00;
  localparam [4:0] pu01 = -  5'd01;
  localparam [4:0] pu02 = !  5'd02;
  localparam [4:0] pu03 = ~  5'd03;
  localparam [4:0] pu04 = &  5'd04;
  localparam [4:0] pu05 = ~& 5'd05;
  localparam [4:0] pu06 = |  5'd06;
  localparam [4:0] pu07 = ~| 5'd07;
  localparam [4:0] pu08 = ^  5'd08;
  localparam [4:0] pu09 = ~^ 5'd09;
  localparam [4:0] pter = 1 ? 2 : 3;
  assign y = pb00 ^ pb01 ^ pb02 ^ pb03 ^ pb04 ^ pb05 ^ pb06 ^ pb07 ^ pb08 ^
             pb09 ^ pb10 ^ pb11 ^ pb12 ^ pb13 ^ pb14 ^ pb15 ^ pb16 ^ pb17 ^
             pb18 ^ pb19 ^ pb20 ^ pb21 ^ pb22 ^ pb23 ^ pu00 ^ pu01 ^ pu02 ^
             pu03 ^ pu04 ^ pu05 ^ pu06 ^ pu07 ^ pu08 ^ pu09 ^ pter ^ a;
endmodule
